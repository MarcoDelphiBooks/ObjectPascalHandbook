unit VariablesTestForm;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

var
  Value2: Integer = 10;
  Correct2: Boolean = True;

procedure TForm1.Button1Click(Sender: TObject);
var
  Value: Integer;
begin
  ShowMessage (Value.ToString); // X is indefined
end;

procedure TForm1.Button2Click(Sender: TObject);
var
  Value: Integer;
  IsCorrect: Boolean;
  A, B: Char;
  s: string;
begin
  // literal value: string including a '
  s := 'Marco Cantu''';

  // legal asssignments
  Value := 10;
  Value := Value + 10;
  IsCorrect := True;

  // illegal assignment
  // Value := IsCorrect; // error

end;

procedure TForm1.Button3Click(Sender: TObject);
const
  sAuthorName = 'Marco';
resourcestring
  strAuthorName = 'Marco';
begin
  ShowMessage (strAuthorname);
end;

const
  Thousand = 1000;
  Pi = 3.14;
  AuthorName = 'Marco Cantu';

const
  ThousandAgain: Integer = 1000;



end.
