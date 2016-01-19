unit GenericInterface_MainForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TFormGenericInterface = class(TForm)
    btnValue: TButton;
    Memo1: TMemo;
    btnValueButton: TButton;
    btnIValue: TButton;
    ScrollBox1: TScrollBox;
    procedure btnValueClick(Sender: TObject);
    procedure btnIValueClick(Sender: TObject);
    procedure btnValueButtonClick(Sender: TObject);
  private
    procedure Log (const strMsg: string);
  public
    { Public declarations }
  end;

var
  FormGenericInterface: TFormGenericInterface;

implementation

{$R *.dfm}

uses
  Math, Generics.Defaults;

type
  IGetValue<T> = interface
    function GetValue: T;
    procedure SetValue (Value: T);
  end;

  TGetValue<T> = class (TInterfacedObject, IGetValue<T>)
  private
    fValue: T;
  public
    constructor Create (Value: T);
    destructor Destroy; override;
    function GetValue: T;
    procedure SetValue (Value: T);
  end;

  TButtonValue = class (TButton, IGetValue<Integer>)
  public
    function GetValue: Integer;
    procedure SetValue (Value: Integer);
    class function MakeTButtonValue (
      Owner: TComponent; Parent: TWinControl): TButtonValue;
  end;

{ TGetValue }

constructor TGetValue<T>.Create(Value: T);
begin
  fValue := Value;
end;

destructor TGetValue<T>.Destroy;
begin
  FormGenericInterface.Log('Destroyed');
end;

function TGetValue<T>.GetValue: T;
begin
  Result := fValue;
end;

procedure TGetValue<T>.SetValue(Value: T);
begin
  fValue := Value;
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

procedure TFormGenericInterface.btnValueButtonClick(Sender: TObject);
var
  iVal: IGetValue<Integer>;
begin
  iVal := TButtonValue.MakeTButtonValue (self, ScrollBox1);
  Log ('Button value: ' + IntToStr (iVal.GetValue));
end;

procedure TFormGenericInterface.btnValueClick(Sender: TObject);
var
  aVal: TGetValue<string>;
begin
  aVal := TGetValue<string>.Create (Caption);
  try
    Log ('TGetValue value: ' + aVal.GetValue);
  finally
    aVal.Free;
  end;
end;

procedure TFormGenericInterface.btnIValueClick(Sender: TObject);
var
  aVal: IGetValue<string>;
begin
  aVal := TGetValue<string>.Create (Caption);
  Log ('IGetValue value: ' + aVal.GetValue);
  // freed automatically, as it is reference counted
end;

procedure TFormGenericInterface.Log(const strMsg: string);
begin
  Memo1.Lines.Add (strMsg);
end;

initialization
  Randomize;

end.
