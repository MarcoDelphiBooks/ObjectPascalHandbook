unit KeyValueCode;

interface

type
  TKeyValue = class
  private
    FKey: string;
    FValue: TObject;
    procedure SetKey(const Value: string);
    procedure SetValue(const Value: TObject);
  public
    property Key: string read FKey write SetKey;
    property Value: TObject read FValue write SetValue;
  end;

implementation

{ TKeyValue }

procedure TKeyValue.SetKey(const Value: string);
begin
  FKey := Value;
end;

procedure TKeyValue.SetValue(const Value: TObject);
begin
  FValue := Value;
end;

end.
