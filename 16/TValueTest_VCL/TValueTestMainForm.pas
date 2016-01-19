unit TValueTestMainForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm39 = class(TForm)
    btnNoConvert: TButton;
    Memo1: TMemo;
    procedure btnNoConvertClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Log (const strMsg: string);
  end;

var
  Form39: TForm39;

implementation

{$R *.dfm}

uses
  Rtti;

procedure TForm39.btnNoConvertClick(Sender: TObject);
var
  v1: TValue;
begin
  //v1 := 100;
  v1 := TValue.From<Integer>(100);
  if v1.IsOrdinal then
    Log (IntToStr (v1.AsInteger));
  if v1.IsType<string> then
    Log (v1.AsString);
  Log (v1.ToString);
end;

procedure TForm39.Log(const strMsg: string);
begin
  Memo1.Lines.Add (strMsg);
end;

end.
