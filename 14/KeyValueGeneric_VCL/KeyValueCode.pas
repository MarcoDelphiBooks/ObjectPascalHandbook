unit KeyValueCode;

interface

type
  TKeyValue<T> = class
  private
    FKey: string;
    FValue: T;
    procedure SetKey(const Value: string);
    procedure SetValue(const Value: T);
  public
    procedure DoSomething;
    property Key: string read FKey write SetKey;
    property Value: T read FValue write SetValue;
  end;

implementation

{ TKeyValue }

procedure TKeyValue<T>.DoSomething;
begin

end;

procedure TKeyValue<T>.SetKey(const Value: string);
begin
  FKey := Value;
end;

procedure TKeyValue<T>.SetValue(const Value: T);
begin
  FValue := Value;
end;

end.
