unit AnimalsClasses;

interface

type
  TAnimal = class
  public
    constructor Create;
    function GetKind: string;
    function Voice: string; virtual; abstract;
  private
    FKind: string;
  end;

  TDog = class (TAnimal)
  public
    constructor Create;
    function Voice: string; override;
    function Eat: string; virtual;
  end;

  TCat = class (TAnimal)
  public
    constructor Create;
    function Voice: string; override;
    function Eat: string; virtual;
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

function TDog.Eat: string;
begin
  Result := 'Bone';
end;

function TDog.Voice: string;
begin
  Result := 'ArfArf';
end;

{ TCat }

constructor TCat.Create;
begin
  inherited;
  FKind := 'Cat';
end;

function TCat.Eat: string;
begin
  Result := 'Mouse';
end;

function TCat.Voice: string;
begin
  Result := 'Mieow';
end;

end.
