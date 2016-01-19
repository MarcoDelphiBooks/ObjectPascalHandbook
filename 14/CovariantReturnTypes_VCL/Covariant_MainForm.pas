unit Covariant_MainForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Memo1: TMemo;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

type
  TAnimal = class
  private
    FName: string;
    procedure SetName(const Value: string);
  public
    property Name: string read FName write SetName;
  public
    class function Get (const aName: string): TAnimal;
    class function GetAs<T: class> (const aName: string): T;
    function ToString: string; override;
  end;

  TDog = class (TAnimal)

  end;

  TCat = class (TAnimal)

  end;

  TAnimalShop = class
    class function GetAs<T: TAnimal, constructor> (const aName: string): T;
  end;

procedure TForm1.Button1Click(Sender: TObject);
var
  aCat: TCat;
  aDog: TDog;
begin
  aCat := TCat.Get('Matisse') as TCat;
  Memo1.Lines.Add (aCat.ToString);
  aCat.Free;

  aDog := TDog.GetAs<TDog>('Pluto');
  Memo1.Lines.Add (aDog.ToString);
  aDog.Free;

  aDog := TAnimalShop.GetAs<TDog>('Pluto');
  Memo1.Lines.Add (aDog.ToString);
  aDog.Free;
end;

{ TAnimal }

class function TAnimal.Get(const aName: string): TAnimal;
begin
  Result := Create;
  Result.fName := aName;
end;

class function TAnimal.GetAs<T>(const aName: string): T;
var
  res: TAnimal;
begin
  res := Get (aName);
  if res.inheritsFrom (T) then
    Result := T(res)
  else
    Result := nil;
end;

procedure TAnimal.SetName(const Value: string);
begin
  FName := Value;
end;

function TAnimal.ToString: string;
begin
  Result := 'This ' + Copy (ClassName, 2, maxint) +
    ' is called ' + FName;
end;

{ TAnimalShop }

// we can actually simplify this code (which was in the book), as shown below
//class function TAnimalShop.GetAs<T>(const aName: string): T;
//var
//  res: TAnimal;
//begin
//  res := T.Create;
//  res.Name := aName;
//  if res.inheritsFrom (T) then
//    Result := T(res)
//  else
//    Result := nil;
//end;

class function TAnimalShop.GetAs<T>(const aName: string): T;
begin
  Result := T.Create;
  Result.Name := aName;
end;


end.
