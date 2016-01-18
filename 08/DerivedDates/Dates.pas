unit Dates;

interface

type
  TDate = class
  private
    FDate: TDateTime;
  public
    constructor Create; overload;
    constructor Create (Month, Day, Year: Integer); overload;
    procedure SetValue (Month, Day, Year: Integer); overload;
    procedure SetValue (NewDate: TDateTime); overload;
    function LeapYear: Boolean;
    procedure Increase (NumberOfDays: Integer = 1);
    procedure Decrease (NumberOfDays: Integer = 1);
    function GetText: string;
  end;

  TNewDate = class (TDate)
  public
    function GetText: string;
  end;

implementation

uses
  SysUtils, DateUtils;

constructor TDate.Create;
begin
  FDate := Today;
end;

constructor TDate.Create (Month, Day, Year: Integer);
begin
  FDate := EncodeDate (Year, Month, Day);
end;

procedure TDate.Decrease(NumberOfDays: Integer);
begin
  FDate := FDate - NumberOfDays;
end;

procedure TDate.SetValue (Month, Day, Year: Integer);
begin
  FDate := EncodeDate (Year, Month, Day);
end;

function TDate.GetText: string;
begin
  Result := DateToStr (FDate);
end;

procedure TDate.Increase (NumberOfDays: Integer);
begin
  FDate := FDate + NumberOfDays;
end;

function TDate.LeapYear: Boolean;
begin
  // call IsLeapYear in SysUtils and YearOf in DateUtils
  Result := IsLeapYear (YearOf (FDate));
end;

procedure TDate.SetValue(NewDate: TDateTime);
begin
  FDate := NewDate;
end;

{ TNewDate }

function TNewDate.GetText: string;
begin
  Result := FormatDateTime ('dddddd', fDate);
end;

end.
