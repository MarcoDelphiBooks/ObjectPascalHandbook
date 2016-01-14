unit InliningTestForm;

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
    Button3: TButton;
    Button4: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
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
  System.Math, System.Diagnostics;

procedure Show (const msg: string);
begin
  Form1.Show(msg)
end;

const
  loopCount = 20000000; // twenty millions

procedure TForm1.Button1Click(Sender: TObject);
var
  sw: TStopWatch;
  I, J: Integer;
begin
  J := 0;
  sw := TStopWatch.StartNew;
  for I := 0 to LoopCount do
    J := Max (I, J);
  sw.Stop;
  Show ('Max on ' + J.ToString +
      ' [' + sw.ElapsedMilliseconds.ToString + '] ');
end;

procedure TForm1.Button3Click(Sender: TObject);
var
  sw: TStopWatch;
  I, J: Integer;
  ssample: string;
begin
  J := 0;
  ssample:= 'sample string';
  sw := TStopWatch.StartNew;
  for I := 0 to LoopCount do
    Inc (J, Length(ssample));
  sw.Stop;
  Show ('Length inlined ' + IntToStr (J) +
      ' [' + IntToStr (sw.ElapsedMilliseconds) + '] ');
end;

{$INLINE OFF}
procedure TForm1.Button2Click(Sender: TObject);
var
  sw: TStopWatch;
  I, J: Integer;
begin
  J := 0;
  sw := TStopWatch.StartNew;
  for I := 0 to LoopCount do
    J := Max (I, J);
  sw.Stop;
  Show ('Max off ' + J.ToString +
      ' [' + sw.ElapsedMilliseconds.ToString + '] ');
end;
{$INLINE ON}


{$INLINE OFF}
procedure TForm1.Button4Click(Sender: TObject);
var
  sw: TStopWatch;
  I, J: Integer;
  sample: string;
begin
  J := 0;
  sample:= 'sample string';
  sw := TStopWatch.StartNew;
  for I := 0 to LoopCount do
    Inc (J, Length(sample));
  sw.Stop;
  Show ('Length not inlined ' + IntToStr (J) +
      ' [' + IntToStr (sw.ElapsedMilliseconds) + '] ');
end;
{$INLINE ON}

procedure TForm1.Show(const msg: string);
begin
  Memo1.Lines.Add(msg);
end;

end.
