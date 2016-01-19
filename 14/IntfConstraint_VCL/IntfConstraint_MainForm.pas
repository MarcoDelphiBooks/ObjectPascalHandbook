unit IntfConstraint_MainForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TFormIntfConstraint = class(TForm)
    btnValue: TButton;
    Memo1: TMemo;
    btnValueButton: TButton;
    btnPlainIntf: TButton;
    btnConstructor: TButton;
    ScrollBox1: TScrollBox;
    procedure btnValueClick(Sender: TObject);
    procedure btnPlainIntfClick(Sender: TObject);
    procedure btnConstructorClick(Sender: TObject);
    procedure btnValueButtonClick(Sender: TObject);
  private
    procedure Log (const strMsg: string);
  public
    { Public declarations }
  end;

var
  FormIntfConstraint: TFormIntfConstraint;

implementation

{$R *.dfm}

uses
  Math, Generics.Defaults;

type
  IGetValue = interface
    ['{60700EC4-2CDA-4CD1-A1A2-07973D9D2444}']
    function GetValue: Integer;
    procedure SetValue (Value: Integer);
  end;

  TGetValue = class (TSingletonImplementation, IGetValue)
  private
    fValue: Integer;
  public
    constructor Create (Value: Integer); // = 0);
    function GetValue: Integer;
    procedure SetValue (Value: Integer);
  end;

  TButtonValue = class (TButton, IGetValue)
  public
    function GetValue: Integer;
    procedure SetValue (Value: Integer);
    class function MakeTButtonValue (
      Owner: TComponent; Parent: TWinControl): TButtonValue;
  end;

  TInftClass <T: IGetValue> = class
  private
    val1, val2: T; // or IGetValue
  public
    procedure Set1 (val: T);
    procedure Set2 (val: T);
    function GetMin: Integer;
    function GetAverage: Integer;
    procedure IncreaseByTen;
  end;

  TPlainInftClass = class
  private
    val1, val2: IGetValue;
  public
    procedure Set1 (val: IGetValue);
    procedure Set2 (val: IGetValue);
    function GetMin: Integer;
    function GetAverage: Integer;
    procedure IncreaseByTen;
  end;

  TConstrClass <T: class, constructor> = class
  private
    val: T;
  public
    constructor Create;
    function Get: T;
  end;

  // not used, code test only
  TInftComp <T: TComponent, IGetValue> = class
  private
    val: T;
  public
    function GetTheValue: Integer;
  end;


{ TGetValue }

constructor TGetValue.Create(Value: Integer);
begin
  fValue := Value;
end;

function TGetValue.GetValue: Integer;
begin
  Result := fValue;
end;

procedure TGetValue.SetValue(Value: Integer);
begin
  fValue := Value;
end;

{ TInftClass<T> }

function TInftClass<T>.GetAverage: Integer;
begin
  if Assigned (val1) and Assigned (val2) then
    Result := (val1.GetValue + val2.GetValue) div 2
  else
    Result := 0;
end;

function TInftClass<T>.GetMin: Integer;
begin
  if Assigned (val1) and Assigned (val2) then
    Result := min (val1.GetValue, val2.GetValue)
  else
    Result := 0;
end;

procedure TInftClass<T>.IncreaseByTen;
begin
  if Assigned (val1) and Assigned (val2) then
  begin
    val1.SetValue (val1.GetValue + 10);
    val2.SetValue (val2.GetValue + 10);
  end;
end;

procedure TInftClass<T>.Set1(val: T);
begin
  val1 := val;
end;

procedure TInftClass<T>.Set2(val: T);
begin
  val2 := val;
end;

{ TButtonValue }

function TButtonValue.GetValue: Integer;
begin
  Result := Left;
end;

class function TButtonValue.MakeTButtonValue(Owner: TComponent;
  Parent: TWinControl): TButtonValue;
begin
  Result := TButtonValue.Create(Owner);
  Result.Parent := Parent;
  Result.SetBounds(
    Random (Parent.Width), Random (Parent.Height),
    Result.Width, Result.Height);
  Result.Caption := 'btnv';
end;

procedure TButtonValue.SetValue(Value: Integer);
begin
  Left := Value;
end;

procedure TFormIntfConstraint.btnValueButtonClick(Sender: TObject);
var
  iClass: TInftClass<TButtonValue>;
begin
  iClass := TInftClass<TButtonValue>.Create;
  iClass.Set1 (TButtonValue.MakeTButtonValue (self, ScrollBox1));
  iClass.Set2 (TButtonValue.MakeTButtonValue (self, ScrollBox1));
  Log ('Average: ' + IntToStr (iClass.GetAverage));
  Log ('Min: ' + IntToStr (iClass.GetMin));
  iClass.IncreaseByTen;
  Log ('New Average: ' + IntToStr (iClass.GetAverage));
end;

procedure TFormIntfConstraint.btnValueClick(Sender: TObject);
var
  iClass: TInftClass<TGetValue>;
begin
  iClass := TInftClass<TGetValue>.Create;
  iClass.Set1 (TGetValue.Create (5));
  iClass.Set2 (TGetValue.Create (25));
  Log ('Average: ' + IntToStr (iClass.GetAverage));
  iClass.IncreaseByTen;
  Log ('Min: ' + IntToStr (iClass.GetMin));
end;

procedure TFormIntfConstraint.btnPlainIntfClick(Sender: TObject);
var
  aClass: TPlainInftClass;
begin
  aClass := TPlainInftClass.Create;
  aClass.Set1 (TGetValue.Create (5));
  aClass.Set2 (TGetValue.Create (25));
  Log ('Average: ' + IntToStr (aClass.GetAverage));
  aClass.IncreaseByTen;
  Log ('Min: ' + IntToStr (aClass.GetMin));
end;

type
  TSimpleConst = class
  public
    Value: Integer;
    constructor Create;
  end;

type
  TParamConst = class
  public
    Value: Integer;
    constructor Create (I: Integer);
  end;


procedure TFormIntfConstraint.btnConstructorClick(Sender: TObject);
var
  constructObj: TConstrClass<TSimpleConst>;
  paramCostObj: TConstrClass<TParamConst>;
begin
  constructObj := TConstrClass<TSimpleConst>.Create;
  Log ('Value 1: ' + IntToStr (constructObj.Get.Value));

  paramCostObj := TConstrClass<TParamConst>.Create;
  Log ('Value 2: ' + IntToStr (paramCostObj.Get.Value));

//  with TParamConst.Create do
//  begin
//    //
//  end;
end;

procedure TFormIntfConstraint.Log(const strMsg: string);
begin
  Memo1.Lines.Add (strMsg);
end;

{ TPlainInftClass }

function TPlainInftClass.GetAverage: Integer;
begin
  Result := (val1.GetValue + val2.GetValue) div 2;
end;

function TPlainInftClass.GetMin: Integer;
begin
  Result := min (val1.GetValue, val2.GetValue);
end;

procedure TPlainInftClass.IncreaseByTen;
begin
  val1.SetValue (val1.GetValue + 10);
  val2.SetValue (val2.GetValue + 10);
end;

procedure TPlainInftClass.Set1(val: IGetValue);
begin
  val1 := val;
end;

procedure TPlainInftClass.Set2(val: IGetValue);
begin
  val2 := val;
end;

{ TConstrClass<T> }

constructor TConstrClass<T>.Create;
begin
  val := T.Create;
end;

function TConstrClass<T>.Get: T;
begin
  Result := val;
end;

{ TSimpleCont }

constructor TSimpleConst.Create;
begin
  Value := 10;
end;

{ TParamCont }

constructor TParamConst.Create(I: Integer);
begin
  Value := I;
end;

{ TInftComp<T> }

function TInftComp<T>.GetTheValue: Integer;
begin
  Result := val.getValue;
end;

initialization
  Randomize;

end.
