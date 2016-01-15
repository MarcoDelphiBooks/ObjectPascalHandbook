unit RecordsWithForm;

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
  with BirthDay do
  begin
    Year := 1997;
    Month := 2;
    Day := 14;
    Show ('Born in year ' + Year.ToString);
  end;

  Show ('Record size is ' + SizeOf (BirthDay).ToString);
end;

type
  TMyRecord = record
    MyName: string;
    MyValue: Integer;
  end;

procedure TForm1.Button2Click(Sender: TObject);
var
  Record1: TMyRecord;
begin
  with Record1 do
  begin
    Name := 'Joe';
    MyValue := 22;
  end;

  with Record1 do
    Show (MyName + ': ' + MyValue.ToString);
end;

procedure TForm1.Show(const msg: string);
begin
  Memo1.Lines.Add(msg);
end;

initialization
  Randomize;

end.
