unit TrivialXmlWriter;

interface

uses
  Classes, Generics.Collections;

type
  TTrivialXmlWriter = class
  private
    fWriter: TTextWriter;
    fNodes: TStack<string>;
    fOwnsTextWriter: Boolean;
  public
    constructor Create (aWriter: TTextWriter); overload;
    constructor Create (aStream: TStream); overload;
    destructor Destroy; override;
    procedure WriteStartElement (const sName: string);
    procedure WriteEndElement (fIndent: Boolean = False);
    procedure WriteString (const sValue: string);
    procedure WriteObjectPublished (AnObj: TObject);
    procedure WriteObjectRtti (AnObj: TObject);
    procedure WriteObjectAttrib (AnObj: TObject);
    function Indentation: string;
  end;

  xmlAttribute = class (TCustomAttribute)
  private
    fTag: string;
  public
    constructor Create (strTag: string = '');
    property TagName: string read fTag;
  end;

implementation

{ TTrivialXmlWriter }

uses
  TypInfo, SysUtils, RTTI;

function CheckXmlAttr (aField: TRttiField;
  var strTag: string): Boolean;
var
  attrib: TCustomAttribute;
begin
  Result := False;
  for attrib in aField.GetAttributes do
    if attrib is XmlAttribute then
    begin
      strTag := xmlAttribute(attrib).TagName;
      if strTag = '' then // default value
        strTag := aField.Name;
      Exit (True);
    end;
end;

constructor TTrivialXmlWriter.Create(aWriter: TTextWriter);
begin
  fWriter := aWriter;
  fNodes := TStack<string>.Create;
end;

constructor TTrivialXmlWriter.Create(aStream: TStream);
begin
  fWriter := TStreamWriter.Create (aStream);
  Create (fWriter); // call first constructor
  fOwnsTextWriter := True;
end;

destructor TTrivialXmlWriter.Destroy;
begin
  while fNodes.Count > 0 do
    WriteEndElement;
  fNodes.Free;
  if fOwnsTextWriter then
    FreeAndNil (fWriter);
  inherited;
end;

function TTrivialXmlWriter.Indentation: string;
begin
  Result := StringOfChar (' ', fNodes.Count * 2)
end;

procedure TTrivialXmlWriter.WriteEndElement (fIndent: Boolean);
var
  strNode: string;
begin
  strNode := fNodes.Pop;
  if fIndent then
    fWriter.Write(Indentation);
  fWriter.Write ('</' + strNode + '>' + sLineBreak);
end;

procedure TTrivialXmlWriter.WriteObjectAttrib(AnObj: TObject);
var
  aContext: TRttiContext;
  aType: TRttiType;
  aField: TRttiField;
  strTagName: string;
begin
  WriteString (sLineBreak); // new line
  aType := aContext.GetType (anObj.ClassType);
  for aField in aType.GetFields do
  begin
    if CheckXmlAttr (aField, strTagName) then
    begin
      if aField.FieldType.IsInstance then
      begin
        WriteStartElement (strTagName);
        WriteObjectAttrib (
          aField.GetValue(anObj).AsObject);
        WriteEndElement (True);
      end
      else
      begin
        WriteStartElement (strTagName);
        WriteString (
          aField.GetValue(anObj).ToString);
        WriteEndElement;
      end;
    end;
  end;
end;

procedure TTrivialXmlWriter.WriteObjectPublished(AnObj: TObject);
var
  nProps, i: Integer;
  PropList: PPropList;
  internalObject: TObject;
  strPropName: string;
begin
  WriteString (sLineBreak); // new line
  // get list of properties
  nProps := GetTypeData(AnObj.ClassInfo)^.PropCount;
  if nProps = 0 then
    Exit;

  GetMem(PropList, nProps * SizeOf(Pointer));
  try
    GetPropInfos(AnObj.ClassInfo, PropList);
    for i := 0 to nProps - 1 do
    begin
      strPropName := UTF8ToString (PropList[i].Name);
      case PropList[i].PropType^.Kind of

        tkUnknown, tkInteger, tkChar, tkEnumeration, tkFloat,
          tkString, tkUString, tkSet, tkWChar, tkLString, tkWString, tkInt64:
        begin
          WriteStartElement (strPropName);
          WriteString (GetPropValue(AnObj, strPropName));
          WriteEndElement;
        end;

        tkClass:
        begin
          internalObject := GetObjectProp(AnObj, strPropName);
          if Assigned(internalObject) and // skip if nil
            internalObject.InheritsFrom(TPersistent) then
          begin
            // recurse in subclass
            WriteStartElement (strPropName);
            WriteObjectPublished (internalObject as TPersistent);
            WriteEndElement (True);
          end;
        end; // tkClass
      end; // case
    end; // for
  finally
    FreeMem(PropList);
  end;
end;

procedure TTrivialXmlWriter.WriteObjectRtti(AnObj: TObject);
var
  aContext: TRttiContext;
  aType: TRttiType;
  aField: TRttiField;
begin
  WriteString (sLineBreak); // new line
  aType := aContext.GetType (anObj.ClassType);
  for aField in aType.GetFields do
  begin
    if aField.FieldType.IsInstance then
    begin
      WriteStartElement (aField.Name);
      WriteObjectRtti (
        aField.GetValue(anObj).AsObject);
      WriteEndElement (True);
    end
    else
    begin
      WriteStartElement (aField.Name);
      WriteString (
        aField.GetValue(anObj).ToString);
      WriteEndElement;
    end;
  end;
end;

procedure TTrivialXmlWriter.WriteStartElement(const sName: string);
begin
  fWriter.Write (Indentation + '<' + sName + '>');
  fNodes.Push (sname);
end;

procedure TTrivialXmlWriter.WriteString(const sValue: string);
begin
  fWriter.Write (sValue);
end;

{ xmlAttribute }

constructor xmlAttribute.Create(strTag: string);
begin
  fTag := strTag;
end;

end.
