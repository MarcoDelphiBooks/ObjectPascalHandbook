unit ViewDatesForm;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Layouts, FMX.Memo, Dates, FMX.Controls.Presentation, FMX.ScrollBox;

type
  TDateForm = class(TForm)
    Memo1: TMemo;
    btnToday: TButton;
    btnIncrease: TButton;
    btnDecrease: TButton;
    LabelDate: TLabel;
    btnAdd10: TButton;
    btnSubtract10: TButton;
    btnLeapyear: TButton;
    procedure btnTodayClick(Sender: TObject);
    procedure btnIncreaseClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnLeapyearClick(Sender: TObject);
    procedure btnDecreaseClick(Sender: TObject);
    procedure btnAdd10Click(Sender: TObject);
    procedure btnSubtract10Click(Sender: TObject);
  private
    ADay: TNewDate;
  public
    procedure Show (const msg: string);
  end;

var
  DateForm: TDateForm;

implementation

{$R *.fmx}

uses
  DateUtils;

procedure TDateForm.btnLeapyearClick(Sender: TObject);
begin
  if ADay.LeapYear then
    Show ('Leap year: ' + ADay.GetText)
  else
    Show ('Not a leap year: ' + ADay.GetText);
end;

procedure TDateForm.btnSubtract10Click(Sender: TObject);
begin
  ADay.Decrease (10);
  LabelDate.Text := ADay.GetText;
end;

procedure TDateForm.btnTodayClick(Sender: TObject);
begin
  ADay.SetValue(Today);
  LabelDate.Text := ADay.GetText;
end;

procedure TDateForm.FormCreate(Sender: TObject);
begin
  // create
  ADay := TNewDate.Create; // today
  LabelDate.Text := ADay.GetText;
end;

procedure TDateForm.FormDestroy(Sender: TObject);
begin
  ADay.Free;
end;

procedure TDateForm.btnAdd10Click(Sender: TObject);
begin
  ADay.Increase (10);
  LabelDate.Text := ADay.GetText;
end;

procedure TDateForm.btnDecreaseClick(Sender: TObject);
begin
  ADay.Decrease;
  LabelDate.Text := ADay.GetText;
end;

procedure TDateForm.btnIncreaseClick(Sender: TObject);
begin
  ADay.Increase;
  LabelDate.Text := ADay.GetText;
end;

procedure TDateForm.Show(const Msg: string);
begin
  Memo1.Lines.Add(Msg);
end;

end.
