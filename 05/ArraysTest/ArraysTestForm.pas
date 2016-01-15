unit ArraysTestForm;

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

type
  TDayTemperatures = array [1..24] of Integer;

var
  DayTemp1: TDayTemperatures;

procedure TForm1.Button1Click(Sender: TObject);
begin
  DayTemp1 [1] := 54;
  DayTemp1 [2] := 52;
  DayTemp1 [3] := 50;
  DayTemp1 [4] := 50;
  DayTemp1 [5] := 52;
  DayTemp1 [6] := 54;
  DayTemp1 [7] := 56;
  DayTemp1 [8] := 58;
  DayTemp1 [9] := 62;
  DayTemp1 [10] := 64;
  DayTemp1 [11] := 64;
  DayTemp1 [12] := 72;
  DayTemp1 [13] := 70;
  DayTemp1 [14] := 70;
  DayTemp1 [15] := 72;
  DayTemp1 [16] := 74;
  DayTemp1 [17] := 66;
  DayTemp1 [18] := 68;
  DayTemp1 [19] := 62;
  DayTemp1 [20] := 56;
  DayTemp1 [21] := 56;
  DayTemp1 [22] := 54;
  DayTemp1 [23] := 55;
  DayTemp1 [24] := 53;
  // The following line causes: E1012 Constant expression violates subrange bounds
  // DayTemp1 [25] := 67;
end;

procedure TForm1.Button2Click(Sender: TObject);
var
  I: Integer;
begin
  for I := 1 to 24 do
    Show (I.ToString + ': ' + DayTemp1[I].ToString);
end;

procedure TForm1.Button3Click(Sender: TObject);
var
  I: Integer;
  total: Integer;
begin
  Total := 0;
  for I := Low(DayTemp1) to High(DayTemp1) do
    Inc (Total, DayTemp1[I]);
  Show ((Total / Length(DayTemp1)).ToString);
end;

type
  // specific types
  TAllMonthTemps = array [1..24, 1..31] of Integer;
  TAllYearTemps = array [1..24, 1..31, 1..12] of Integer;

  // types based on each other, and compatible
  TMonthTemps = array [1..31] of TDayTemperatures;
  TYearTemps = array [1..12] of TMonthTemps;

procedure TForm1.Button4Click(Sender: TObject);
var
  AllMonth1: TAllMonthTemps;
  AllYear1: TAllYearTemps;

  Month1: TMonthTemps;
  Year1: TYearTemps;
begin
  AllMonth1 [13, 30] := 55; // hour, day
  AllYear1 [13, 30, 8] := 55; // hour, day, month

  Month1 [30][14] := 44;
  Month1 [30, 13] := 55; // day, hour
  Year1 [8, 30, 13] := 55; // month, day, hour

  Year1[3] := Month1;
  // Error: Incompatible types: 'array[1..31] of array[1..12] of Integer' and
  //   'TAllMonthTemps'
  // AllYear1[3] := AllMonth1;
end;

procedure TForm1.Show(const msg: string);
begin
  Memo1.Lines.Add(msg);
end;

end.
