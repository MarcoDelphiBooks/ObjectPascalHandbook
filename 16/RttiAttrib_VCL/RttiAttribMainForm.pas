unit RttiAttribMainForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm39 = class(TForm)
    btnMethods: TButton;
    Memo1: TMemo;
    btnClassAttribs: TButton;
    btnInvokeIfZero: TButton;
    procedure btnMethodsClick(Sender: TObject);
    procedure btnClassAttribsClick(Sender: TObject);
    procedure btnInvokeIfZeroClick(Sender: TObject);
  private
    { Private declarations }
  public
    procedure Log (const strMsg: string);
  end;

type
  SimpleAttribute = class(TCustomAttribute)
  end;

  ValueAttribute = class(TCustomAttribute)
  private
    FValue: Integer;
  public
    constructor Create(N: Integer);
    property Value: Integer read FValue write FValue;
  end;

type
  // Uncommenting [More] causes a warning and is ignored
  [Simple][Value(22)]  // [More]
  TMyClass = class(TObject)
  public
    [Simple]
    procedure One;
    [Value(0)]
    procedure Two;

    procedure Three;
  end;

var
  Form39: TForm39;

implementation

{$R *.dfm}

uses
  Rtti;

{ FooAttribute }

constructor ValueAttribute.Create(N: Integer);
begin
  FValue := N;
end;

type
  TCustomAttributeClass = class of TCustomAttribute;

function HasAttribute (aMethod: TRttiMethod; attribClass: TCustomAttributeClass): Boolean;
var
  attributes: TArray<TCustomAttribute>;
  attrib: TCustomAttribute;
begin
  Result := False;
  attributes := aMethod.GetAttributes;
  for attrib in attributes do
     if attrib.InheritsFrom (attribClass) then
       Exit (True);
end;

procedure TForm39.btnInvokeIfZeroClick(Sender: TObject);
var
  context: TRttiContext;
  aType: TRttiType;
  aMethod: TRttiMethod;
  aTarget: TMyClass;
  zeroParams: array of TValue;
begin
  aTarget := TMyClass.Create;
  try
    aType := context.GetType(aTarget.ClassType);
    for aMethod in aType.GetMethods do
      if HasAttribute (aMethod, SimpleAttribute) then
        aMethod.Invoke(aTarget, zeroParams);
  finally
    aTarget.Free;
  end;
end;

procedure TForm39.btnMethodsClick(Sender: TObject);
var
  context: TRttiContext;
  aType: TRttiType;
  aMethod: TRttiMethod;
begin
  aType := context.GetType(TMyClass);

  Log ('Methods marked with [Simple] attribute');
  for aMethod in aType.GetMethods do
    if HasAttribute (aMethod, SimpleAttribute) then
      Log (aMethod.name);

  Log ('');
  Log ('Methods marked with any attribute');
  for aMethod in aType.GetMethods do
    if HasAttribute (aMethod, TCustomAttribute) then
      Log (aMethod.name);
end;

{ TMyClass }

procedure TMyClass.One;
var
  context: TRttiContext;
  attributes: TArray<TCustomAttribute>;
  attrib: TCustomAttribute;
begin
  attributes := context.GetType(ClassType).GetAttributes;
  for attrib in attributes do
  begin
    Form39.Log(attrib.ClassName);
    if attrib is ValueAttribute then
      Form39.Log(' -' + IntToStr (ValueAttribute(attrib).Value));
  end;
end;

procedure TMyClass.Three;
begin
  ShowMessage ('three');
end;

procedure TMyClass.Two;
begin
  //
end;

procedure TForm39.btnClassAttribsClick(Sender: TObject);
begin
  with TMyClass.Create do
  begin
    One;
  end;
end;

procedure TForm39.Log(const strMsg: string);
begin
  Memo1.Lines.Add (strMsg);
end;

end.
