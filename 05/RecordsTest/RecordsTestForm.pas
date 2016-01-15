unit RecordsTestForm;

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
  TMyDate = packed record
    Year: Integer;
    Month: Byte;
    Day: Byte;
  end;

function MyDateToString (MyDate: TMyDate): string;
begin
  Result := MyDate.Year.ToString + '.' +
    MyDate.Month.ToString + '.' +
    MyDate.Day.ToString;
end;

procedure IncreaseYear (var MyDate: TMyDate);
begin
  Inc (MyDate.Year);
end;

procedure TForm1.Button1Click(Sender: TObject);
var
  BirthDay: TMyDate;
begin
  BirthDay.Year := 1997;
  BirthDay.Month := 2;
  BirthDay.Day := 14;

  Show ('Born in year ' + BirthDay.Year.ToString);
  Show ('Record size is ' + SizeOf (BirthDay).ToString);
end;

procedure TForm1.Button2Click(Sender: TObject);
var
  BirthDay: TMyDate;
  ADay: TMyDate;
begin
  BirthDay.Year := 1997;
  BirthDay.Month := 2;
  BirthDay.Day := 14;

  ADay := Birthday;
  ADay.Year := 2008;

  Show (MyDateToString (BirthDay));
  Show (MyDateToString (ADay));
end;

procedure TForm1.Button3Click(Sender: TObject);
var
  ADay: TMyDate;
begin
  ADay.Year := 2016;
  ADay.Month := 3;
  ADay.Day := 18;

  Increaseyear (ADay);
  Show (MyDateToString (ADay));
end;

procedure TForm1.Button4Click(Sender: TObject);
var
  DatesList: array of TMyDate;
  I: Integer;
begin
  // allocate array elements
  SetLength (DatesList, 5);

  // assign random values
  for I := Low(DatesList) to High(DatesList) do
  begin
    DatesList[I].Year := 2000 + Random (50);
    DatesList[I].Month := 1 + Random (12);
    DatesList[I].Day := 1 + Random (27);
  end;

  // display the values
  for I := Low(DatesList) to High(DatesList) do
    Show (I.ToString + ': ' +
      MyDateToString (DatesList[I]));
end;

procedure TForm1.Show(const msg: string);
begin
  Memo1.Lines.Add(msg);
end;

initialization
  Randomize;

end.
