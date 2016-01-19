unit Dates;

interface

uses
  Classes, SysUtils;

type
  TDate = class (TComponent)
  private
    fDate: TDateTime;
    FOnChange: TNotifyEvent;
    function GetYear: Integer;
    function GetDay: Integer;
    function GetMonth: Integer;
    procedure SetDay(const Value: Integer);
    procedure SetMonth(const Value: Integer);
    procedure SetYear(const Value: Integer);
  protected
    procedure DoChange; virtual;
  public
    constructor Create (AOwner: TComponent); overload; override;
    constructor Create (y, m, d: Integer); reintroduce; overload;
    procedure SetValue (y, m, d: Integer); overload;
    procedure SetValue (NewDate: TDateTime); overload;
    function LeapYear: Boolean;
    procedure Increase (NumberOfDays: Integer = 1);
    procedure Decrease (NumberOfDays: Integer = 1);
    function GetText: string; virtual;
    property Text: string read GetText;
  published
    property Day: Integer read GetDay write SetDay;
    property Month: Integer read GetMonth write SetMonth;
    property Year: Integer read GetYear write SetYear;
    property OnChange: TNotifyEvent
      read FonChange write FOnChange;
  end;

  // custom exception
  EDateOutOfRange = class (Exception)
  end;

procedure Register;

implementation

procedure TDate.SetValue (y, m, d: Integer);
begin
  fDate := EncodeDate (y, m, d);
  // fire the event
  DoChange;
end;

function TDate.LeapYear: Boolean;
begin
  // compute leap years, considering "exceptions"
  if (GetYear mod 4 <> 0) then
    LeapYear := False
  else if (GetYear mod 100 <> 0) then
    LeapYear := True
  else if (GetYear mod 400 <> 0) then
    LeapYear := False
  else
    LeapYear := True;
end;

procedure TDate.Increase (NumberOfDays: Integer = 1);
begin
  fDate := fDate + NumberOfDays;
  // fire the event
  DoChange;
end;

function TDate.GetText: string;
begin
  GetText := DateToStr (fDate);
end;

procedure TDate.Decrease (NumberOfDays: Integer = 1);
begin
  fDate := fDate - NumberOfDays;
  // fire the event
  DoChange;
end;

constructor TDate.Create (y, m, d: Integer);
begin
  inherited Create (nil);
  fDate := EncodeDate (y, m, d);
end;

constructor TDate.Create (AOwner: TComponent);
begin
  inherited Create (AOwner);
  // today...
  fDate := Date;
end;

function TDate.GetYear: Integer;
var
  y, m, d: Word;
begin
  DecodeDate (fDate, y, m, d);
  Result := y;
end;

procedure TDate.SetValue(NewDate: TDateTime);
begin
  fDate := NewDate;
  // fire the event
  DoChange;
end;

function TDate.GetDay: Integer;
var
  y, m, d: Word;
begin
  DecodeDate (fDate, y, m, d);
  Result := d;
end;

function TDate.GetMonth: Integer;
var
  y, m, d: Word;
begin
  DecodeDate (fDate, y, m, d);
  Result := m;
end;

procedure TDate.SetDay(const Value: Integer);
begin
  if (Value < 0) or (Value > 31) then
    raise EDateOutOfRange.Create ('Invalid month');
  SetValue (Year, Month, Value);
end;

procedure TDate.SetMonth(const Value: Integer);
begin
  if (Value < 0) or (Value > 12) then
    raise EDateOutOfRange.Create ('Invalid month');
  SetValue (Year, Value, Day);
end;

procedure TDate.SetYear(const Value: Integer);
begin
  SetValue (Value, Month, Day);
end;

procedure TDate.DoChange;
begin
  if Assigned (FOnChange) then
    FOnChange (Self);
end;

procedure Register;
begin
  RegisterComponents ('Md5', [TDate]);
end;

end.

