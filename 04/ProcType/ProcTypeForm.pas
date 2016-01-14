unit ProcTypeForm;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Layouts, FMX.Memo, FMX.Controls.Presentation, FMX.ScrollBox;

type
  TForm1 = class(TForm)
    Memo1: TMemo;
    Button1: TButton;
    CheckBox1: TCheckBox;
    procedure Button1Click(Sender: TObject);
    procedure CheckBox1Change(Sender: TObject);
  private
    { Private declarations }
  public
    procedure Show (const msg: string);
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

type
  TIntProc = procedure (var Num: Integer);

procedure DoubleTheValue (var Value: Integer);
begin
  Value := Value * 2;
end;

procedure TripleTheValue (var Value: Integer);
begin
  Value := Value * 3;
end;

var
  IntProc: TIntProc = DoubleTheValue;
  Value: Integer = 1;

procedure TForm1.Button1Click(Sender: TObject);
begin
  IntProc (Value);
  Show (Value.ToString);
end;

procedure TForm1.CheckBox1Change(Sender: TObject);
begin
  if CheckBox1.IsChecked then
    IntProc := TripleTheValue
  else
    IntProc := DoubleTheValue;
end;

{$INLINE ON}

procedure TForm1.Show(const msg: string);
begin
  Memo1.Lines.Add(msg);
end;

end.
