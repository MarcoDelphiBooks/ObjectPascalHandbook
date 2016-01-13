unit LoopsTestForm;

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
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
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
  System.Diagnostics;

procedure TForm1.Button1Click(Sender: TObject);
var
  I: Integer;
begin
  for I := 1 to 20 do
    Show ('Number ' + IntToStr (I));
end;

procedure TForm1.Button2Click(Sender: TObject);
var
  I: Integer;
begin
  I := 1;
  while I <= 20 do
  begin
    Show ('Number ' + IntToStr (I));
    Inc (I, 2)
  end;
end;

{works also with $ZEROBASEDSTRINGS ON}

procedure TForm1.Button3Click(Sender: TObject);
var
  I: Integer;
begin
  Randomize;
  I := 1;
  while I < 500 do
  begin
    Show ('Random Number: ' + IntToStr (I));
    I := I + Random (100);
  end;
end;

procedure TForm1.Button4Click(Sender: TObject);
var
  s: string;
  ch: Char;
begin
  s := 'Hello world';
  for ch in s do
    Show(ch);
end;

procedure TForm1.Button5Click(Sender: TObject);
var
  S: string;
  I: Integer;
  Total: Integer;
  SW: TStopWatch;
  Ch: Char;
begin
  // create a thirty million char string
  S := '';
  for I := 1 to 30000000 do
  begin
    // take the first char of the number
    S := S + IntToStr (I).Chars [1];
  end;

  SW := TStopWatch.StartNew;
  Total := 0;
  for I := Low(S) to High(S) do
  begin
    Total := Total + Ord (S[I]);
  end;
  SW.Stop;
  Show ('for ' + Total.ToString +
      ' [' + SW.ElapsedMilliseconds.ToString + '] ');

  SW := TStopWatch.StartNew;
  Total := 0;
  for Ch in S do
  begin
    Total := Total + Ord (Ch);
  end;
  SW.Stop;
  Show ('for ' + Total.ToString +
      ' [' + SW.ElapsedMilliseconds.ToString + '] ');

end;

procedure TForm1.Show(const msg: string);
begin
  Memo1.Lines.Add(msg);
end;

end.
