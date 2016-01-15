unit VariantTestForm;

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

procedure TForm1.Button1Click(Sender: TObject);
var
  V: Variant;
  S: string;
begin
  V := 10;
  S := v;
  V := V + S;
  Show (V);

  V := 'Hello, World';
  V := V + S;
  Show (V);

  V := 45.55;
  V := V + S;
  Show (V);
end;

const
  maxno = 10000000;  // 10 millions

procedure TForm1.Button2Click(Sender: TObject);
var
  time1, time2: TDateTime;
  n1, n2: Variant;
  i1, i2: Int64;
begin
  time1 := Now;
  n1 := 0;
  n2 := 0;

  while n1 < maxno do
  begin
    n2 := n2 + n1;
    Inc (n1);
  end;

  // we must use the result
  time2 := Now;

  Show (n2);
  Show ('Variants: ' + FormatDateTime (
    'ss.zzz', Time2-Time1) + ' seconds');

  /// now use integers
  time1 := Now;
  i1 := 0;
  i2 := 0;

  while i1 < maxno do
  begin
    i2 := i2 + i1;
    Inc (i1);
  end;

  // we must use the result
  time2 := Now;
  Show (i2.ToString);
  Show ('Integers: ' + FormatDateTime (
    'ss.zzz', Time2-Time1) + ' seconds');

end;

procedure TForm1.Show(const msg: string);
begin
  Memo1.Lines.Add(msg);
end;

end.
