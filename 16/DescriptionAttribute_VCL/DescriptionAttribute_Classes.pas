unit DescriptionAttribute_Classes;

interface

uses
  SysUtils;

type
  TDescriptionAttrKind = (dakClass, dakDescription, dakId);

  DescriptionAttribute = class (TCustomAttribute)
  private
    fDak: TDescriptionAttrKind;
  public
    constructor Create (aDak: TDescriptionAttrKind = dakClass);
    property Kind: TDescriptionAttrKind read fDak;
  end;

  [Description]
  TPerson = class
  private
    FBirthDate: TDate;
    FName: string;
    FCountry: string;
    procedure SetBirthDate(const Value: TDate);
    procedure SetCountry(const Value: string);
    procedure SetName(const Value: string);
  public
    [Description (dakDescription)]
    function GetName: string;
    [Description (dakID)]
    function GetStringCode: Integer;
  published
    property Name: string read GetName write SetName;
    property BirthDate: TDate read FBirthDate write SetBirthDate;
    property Country: string read FCountry write SetCountry;
  end;

  [Description]
  TCompany = class
  private
    FName: string;
    FCountry: string;
    FID: string;
    procedure SetName(const Value: string);
    procedure SetID(const Value: string);
  public
    [Description (dakDescription)]
    function GetName: string;
    [Description (dakID)]
    function GetID: string;
  published
    property Name: string read GetName write SetName;
    property Country: string read FCountry write FCountry;
    property ID: string read FID write SetID;
  end;

implementation

{ DescriptionAttribute }

constructor DescriptionAttribute.Create(aDak: TDescriptionAttrKind);
begin
  fDak := aDak;
end;

{ TPerson }

function TPerson.GetName: string;
begin
  Result := fName;
end;

function TPerson.GetStringCode: Integer;
begin
  inherited GethashCode;
end;

procedure TPerson.SetBirthDate(const Value: TDate);
begin
  FBirthDate := Value;
end;

procedure TPerson.SetCountry(const Value: string);
begin
  FCountry := Value;
end;

procedure TPerson.SetName(const Value: string);
begin
  FName := Value;
end;

{ TCompany }

function TCompany.GetID: string;
begin
  Result := fID;
end;

function TCompany.GetName: string;
begin
  Result := fName;
end;

procedure TCompany.SetID(const Value: string);
begin
  FID := Value;
end;

procedure TCompany.SetName(const Value: string);
begin
  fName := Value;
end;

end.
