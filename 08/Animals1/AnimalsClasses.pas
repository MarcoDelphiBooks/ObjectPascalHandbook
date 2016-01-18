unit AnimalsClasses;

interface

type
  TAnimal = class
  public
    constructor Create;
    function GetKind: string;
  private
    FKind: string;
  end;

  TDog = class (TAnimal)
  public
    constructor Create;
  end;

implementation

{ TAnimal }

constructor TAnimal.Create;
begin
  FKind := 'Animal';
end;

function TAnimal.GetKind: string;
begin
  Result := FKind;
end;

{ TDog }

constructor TDog.Create;
begin
  inherited;
  FKind := 'Dog';
end;

end.
