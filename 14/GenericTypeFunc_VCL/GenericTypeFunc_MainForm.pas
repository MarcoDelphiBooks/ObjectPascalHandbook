unit GenericTypeFunc_MainForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm30 = class(TForm)
    btnShowInfo: TButton;
    Memo1: TMemo;
    btnExperiments: TButton;
    procedure btnShowInfoClick(Sender: TObject);
    procedure btnExperimentsClick(Sender: TObject);
  private
    { Private declarations }
  public
    procedure Log (const strMsg: string);
  end;

var
  Form30: TForm30;

implementation

uses
  TypInfo;

{$R *.dfm}

type
  TSampleClass <T> = class
  private
    data: T;
  public
    procedure Zero;
    function GetDataSize: Integer;
    function GetDataName: string;
  end;

procedure TForm30.btnShowInfoClick(Sender: TObject);
var
  t1: TSampleClass<Integer>;
  t2: TSampleClass<string>;
  t3: TSampleClass<double>;
begin
  t1 := TSampleClass<Integer>.Create;
  t1.Zero;
  Log ('TSampleClass<Integer>');
  Log ('data: ' + IntToStr (t1.data));
  Log ('type: ' + t1.GetDataName);
  Log ('size: ' + IntToStr (t1.GetDataSize));

  t2 := TSampleClass<string>.Create;
  t2.Zero;
  Log ('TSampleClass<string>');
  Log ('data: ' + t2.data);
  Log ('type: ' + t2.GetDataName);
  Log ('size: ' + IntToStr (t2.GetDataSize));

  t3 := TSampleClass<double>.Create;
  t3.Zero;
  Log ('TSampleClass<double>');
  Log ('data: ' + FloatToStr (t3.data));
  Log ('type: ' + t3.GetDataName);
  Log ('size: ' + IntToStr (t3.GetDataSize));
end;

procedure TForm30.btnExperimentsClick(Sender: TObject);
var
  I: Integer;
  s: string;
begin
  I := Default (Integer);
  Log ('Default Integer: ' + IntToStr (I));

  s := Default (string);
  Log ('Default String: ' + s);

  Log ('TypeInfo String: ' + GetTypeName (TypeInfo (string)));
end;

procedure TForm30.Log(const strMsg: string);
begin
  Memo1.Lines.Add(strMsg);
end;

{ TSampleClass<T> }

function TSampleClass<T>.GetDataSize: Integer;
begin
  Result := SizeOf (T);
end;

function TSampleClass<T>.GetDataName: string;
begin
  Result := GetTypeName (TypeInfo (T));
end;

procedure TSampleClass<T>.Zero;
begin
  data := Default (T);
end;

end.
