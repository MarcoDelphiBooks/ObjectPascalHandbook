unit OperatorsOverForm;

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
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
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
  OperatorsTypes;

procedure TForm1.Button1Click(Sender: TObject);
var
  a, b, c: TPointRecord;
begin
  a.SetValue(10, 10);
  b := 30;
  c := a + b;
  Show (string(c));
end;

procedure TForm1.Button2Click(Sender: TObject);
var
  a: TPointRecord2;
begin
  a.SetValue(10, 20);
  a := a + 10;
  a := 30 + a;
  Show (string(a));
end;

procedure TForm1.Button3Click(Sender: TObject);
var
  a, c: TPointRecord;
begin
  a := 50;

  c := a + 30;
  Show (string(c));

  c := 50 + 30;
  Show (string(c));

  c := 50 + TPointRecord(30);
  Show (string(c));

end;

procedure TForm1.Show(const msg: string);
begin
  Memo1.Lines.Add(msg);
end;

end.
