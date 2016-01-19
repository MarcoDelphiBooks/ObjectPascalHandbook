unit DescriptionAttribute_MainForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Contnrs, ComCtrls, Generics.Collections;

type
  TFormDescrAttr = class(TForm)
    ListView1: TListView;
    procedure FormCreate(Sender: TObject);
  private
    fObjectsList: TObjectList<TObject>;
  public
    procedure UpdateList;
  end;

var
  FormDescrAttr: TFormDescrAttr;

implementation

{$R *.dfm}

uses
  DescriptionAttribute_Classes, RTTI;

procedure TFormDescrAttr.FormCreate(Sender: TObject);
var
  aPerson: TPerson;
  aCompany: TCompany;
begin
  fObjectsList := TObjectList<TObject>.Create;

  // add a person
  aPerson := TPerson.Create;
  aPerson.Name := 'Wiley';
  aPerson.Country := 'Desert';
  aPerson.BirthDate := Date - 1000;
  fObjectsList.Add(aPerson);

  // add a company
  aCompany := TCompany.Create;
  aCompany.Name := 'ACME Inc.';
  aCompany.ID := IntToStr (GetTickCount);
  aCompany.Country := 'Worldwide';
  fObjectsList.Add(aCompany);

  // add an unrelated object
  fObjectsList.Add(TStringList.Create);

  UpdateList;
end;

function TypeHasDescription (aType: TRttiType): Boolean;
var
  attrib: TCustomAttribute;
begin
  for attrib in aType.GetAttributes do
  begin
    if (attrib is DescriptionAttribute) then
      Exit(True);
  end;
  Result := False;
end;

procedure TFormDescrAttr.UpdateList;
var
  anObject: TObject;
  context: TRttiContext;
  aType: TRttiType;
  attrib: TCustomAttribute;
  aMethod: TRttiMethod;
  strDescr, strID: string;
begin
  for anObject in fObjectsList do
  begin
    aType := context.GetType(anObject.ClassInfo);
    if TypeHasDescription (aType) then
    begin
      for aMethod in aType.GetMethods do
        for attrib in aMethod.GetAttributes do
          if attrib is DescriptionAttribute then
            case DescriptionAttribute(attrib).Kind of
              dakClass: ; // ignore
              dakDescription:
                // should check if duplicate attribute
                strDescr := aMethod.Invoke(
                  anObject, []).ToString;
              dakId:
                strID := aMethod.Invoke(
                  anObject, []).ToString;
            end;
      // done looking for attributes
      // should check if we found anything
      with ListView1.Items.Add do
      begin
        Caption := strID;
        SubItems.Add(strDescr);
      end;
    end;
  end;
  // else ignore the object, could raise an exception
end;

end.
