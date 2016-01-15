unit OperatorsTypes;

interface

uses
  SysUtils;

type
  TPointRecord = record
  private
    x, y: Integer;
  public
    procedure SetValue (x1, y1: Integer);
    class operator Add (a, b: TPointRecord): TPointRecord;
    class operator Explicit (a: TPointRecord) : string;
    class operator Implicit (x1: Integer): TPointRecord;
  end;

type
  TPointRecord2 = record
  private
    x, y: Integer;
  public
    class operator Explicit (a: TPointRecord2) : string;
    procedure SetValue (x1, y1: Integer);
    // commutativity
    class operator Add (a: TPointRecord2; b: Integer): TPointRecord2;
    class operator Add (b: Integer; a: TPointRecord2): TPointRecord2;
  end;


implementation

{ TPointRecord }

class operator TPointRecord.Add(a, b: TPointRecord): TPointRecord;
begin
  Result.x := a.x + b.x;
  Result.y := a.y + b.y;
end;

class operator TPointRecord.Explicit(a: TPointRecord): string;
begin
  Result := Format('(%d:%d)', [a.x, a.y]);
end;

class operator TPointRecord.Implicit(x1: Integer): TPointRecord;
begin
  Result.x := x1;
  Result.y := 10;
end;

procedure TPointRecord.SetValue(x1, y1: Integer);
begin
  x := x1;
  y := y1;
end;

{ TPointRecord2 }

procedure TPointRecord2.SetValue(x1, y1: Integer);
begin
  x := x1;
  y := y1;
end;

class operator TPointRecord2.Add(a: TPointRecord2; b: Integer): TPointRecord2;
begin
  Result.x := a.x + b;
  Result.y := a.y + b;
end;

class operator TPointRecord2.Add(b: Integer; a: TPointRecord2): TPointRecord2;
begin
  Result := a + b; // implement commutativity
end;

class operator TPointRecord2.Explicit(a: TPointRecord2): string;
begin
  Result := Format('(%d:%d)', [a.x, a.y]);
end;

end.
