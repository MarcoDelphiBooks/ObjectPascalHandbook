unit DynArrayForm;

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
    procedure Button2Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
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

type
  TIntegersArray = array of Integer;

var
  IntArray1: TIntegersArray;

procedure TForm1.Button1Click(Sender: TObject);
var
  Array1: array of Integer;
begin
  // would cause a runtime Range Check error
  // Array1 [1] := 100;
  SetLength (Array1, 10);
  Array1 [1] := 100; // this is OK
  Show (Array1 [1].ToString);
end;

procedure TForm1.Button2Click(Sender: TObject);
var
  I: Integer;
begin
  SetLength (IntArray1, 20);
  for I := Low (IntArray1) to High (IntArray1) do
    IntArray1 [I] := I;
end;

procedure TForm1.Button3Click(Sender: TObject);
var
  I: Integer;
  total: Integer;
begin
  Total := 0;
  for I := Low(IntArray1) to High(IntArray1) do
  begin
    Inc (Total, IntArray1[I]);
    Show (I.ToString + ': ' + IntArray1[I].ToString);
  end;
  Show ('Average: ' + (Total / Length(IntArray1)).ToString);
end;

procedure TForm1.Button4Click(Sender: TObject);
var
  IntArray2: TIntegersArray;
  IntArray3: TIntegersArray;
begin
  // alias
  IntArray2 := IntArray1;

  // separate copy
  IntArray3 := Copy (IntArray1, Low(IntArray1), Length(IntArray1));

  // modify items
  IntArray2 [1] := 100;
  IntArray3 [2] := 100;

  // check values for each array
  Show (Format ('[%d] %d -- %d -- %d',
    [1, IntArray1 [1], IntArray2 [1], IntArray3 [1]]));
  Show (Format ('[%d] %d -- %d -- %d',
    [2, IntArray1 [2], IntArray2 [2], IntArray3 [2]]));
end;

procedure TForm1.Show(const msg: string);
begin
  Memo1.Lines.Add(msg);
end;

end.
