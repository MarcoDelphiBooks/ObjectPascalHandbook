unit ParamsTestForm;

interface

// running this program raises an exception by design

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Layouts, FMX.Memo, FMX.Controls.Presentation, FMX.ScrollBox;

type
  TForm1 = class(TForm)
    Memo1: TMemo;
    Button1: TButton;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    procedure Show (const msg: string);
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

function CharInString (S: string; Ch: Char): Boolean;
var
  I: Integer;
begin
  Result := False;
  for I := Low (S) to High (S) do
    if (S[I]) = Ch then
    begin
      Result := True;
      Exit;
    end;
end;

function CharInString2 (S: string; Ch: Char): Boolean;
var
  I: Integer;
begin
  Result := False;
  for I := Low (S) to High (S) do
    if (S[I]) = Ch then
      Exit (True);
end;

procedure DoubleTheValue (var Value: Integer);
begin
  Value := Value * 2;
end;

//function DoubleTheValue2 (const Value: Integer): Integer;
//begin
//  Value := Value * 2;      // compiler error
//  Result := Value;
//end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  if CharInString ('Hello world', 'o') then
    Show ('Found');
  if CharInString2 ('Hello world', 'o') then
    Show ('Found');
end;

procedure TForm1.Button2Click(Sender: TObject);
var
  X: Integer;
//  C: Cardinal;
begin
  X := 10;
  DoubleTheValue (X);
  Show (X.ToString);

//  C := 10;
//  DoubleTheValue (C);
end;

procedure TForm1.Show(const msg: string);
begin
  Memo1.Lines.Add(msg);
end;

end.
