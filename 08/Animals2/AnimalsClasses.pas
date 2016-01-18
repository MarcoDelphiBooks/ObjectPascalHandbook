unit AnimalsClasses;

interface

type
  TAnimal = class
  public
    constructor Create;
    function GetKind: string;
    function Voice: string; virtual;
  private
    FKind: string;
  end;

  TDog = class (TAnimal)
  public
    constructor Create;
    function Voice: string; override;
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

function TAnimal.Voice: string;
begin
  Result := 'AnimalVoice';
end;

{ TDog }

constructor TDog.Create;
begin
  inherited;
  FKind := 'Dog';
end;

function TDog.Voice: string;
begin
  Result := 'ArfArf';
end;

end.
