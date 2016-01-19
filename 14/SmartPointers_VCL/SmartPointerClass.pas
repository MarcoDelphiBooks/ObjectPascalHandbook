unit SmartPointerClass;

interface

uses
  Generics.Defaults;

type
  TSmartPointer<T: class, constructor> = record
  strict private
    FValue: T;
    FFreeTheValue: IInterface;
    function GetValue: T;
  private
    type
      TFreeTheValue = class (TInterfacedObject)
      private
        fObjectToFree: TObject;
      public
        constructor Create(anObjectToFree: TObject);
        destructor Destroy; override;
      end;
  public
    constructor Create(AValue: T); overload;
    procedure Create; overload;
    class operator Implicit(AValue: T): TSmartPointer<T>;
    class operator Implicit(smart: TSmartPointer <T>): T;
    property Value: T read GetValue;
  end;

implementation

{ TSmartPointer<T> }

constructor TSmartPointer<T>.Create(AValue: T);
begin
  FValue := AValue;
  FFreeTheValue := TFreeTheValue.Create(FValue);
end;

procedure TSmartPointer<T>.Create;
begin
  TSmartPointer<T>.Create (T.Create);
end;

function TSmartPointer<T>.GetValue: T;
begin
  if not Assigned(FFreeTheValue) then
    self := TSmartPointer<T>.Create (T.Create);
  Result := FValue;
end;

class operator TSmartPointer<T>.Implicit(smart: TSmartPointer<T>): T;
begin
  Result := Smart.Value;
end;

class operator TSmartPointer<T>.Implicit(AValue: T): TSmartPointer<T>;
begin
  Result := TSmartPointer<T>.Create(AValue);
end;

{ TSmartPointer<T>.TFreeTheValue }

constructor TSmartPointer<T>.TFreeTheValue.Create(anObjectToFree: TObject);
begin
  fObjectToFree := anObjectToFree;
end;

destructor TSmartPointer<T>.TFreeTheValue.Destroy;
begin
  fObjectToFree.Free;
  inherited;
end;


end.
