unit Strings101Form;

interface

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

uses
  Diagnostics;

const
  MaxLoop = 5000000; // five million


procedure TForm1.Button1Click(Sender: TObject);
var
  str1, str2, strFinal: string;
  I: Integer;
  t1: TStopwatch;
begin
  str1 := 'Marco ';
  str2 := 'Cantu ';

  t1 := TStopwatch.StartNew;
  for I := 1 to MaxLoop do
    str1 := str1 + str2;
  strFinal := str1;

  t1.Stop;
  Show('Length: ' + IntToStr (strFinal.Length));
  Show('Concatenation: ' + IntToStr (t1.ElapsedMilliseconds));
end;

procedure TForm1.Button2Click(Sender: TObject);
var
  str1, str2, strFinal: string;
  I: Integer;
  t1: TStopwatch;
begin
  str1 := 'Marco ';
  str2 := 'Cantu ';

  SetLength (str1, MaxLoop * 6);
  t1 := TStopwatch.StartNew;
  for I := 1 to MaxLoop do
    str1 := str1 + str2;
  strFinal := str1;

  t1.Stop;
  Show('Length: ' + IntToStr (strFinal.Length));
  Show('Concatenation: ' + IntToStr (t1.ElapsedMilliseconds));
end;

procedure TForm1.Show(const Msg: string);
begin
  Memo1.Lines.Add(Msg);
end;

end.
