unit VarPropForm;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Layouts, FMX.Memo;

type
  TForm1 = class(TForm)
    Memo1: TMemo;
    btnTest: TButton;
    procedure btnTestClick(Sender: TObject);
  private
    { Private declarations }
  public
    procedure Show (const msg: string);
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

{$VARPROPSETTER ON}

type
  TMyIntegerClass = class
  private
    fNumber: Integer;
    function GetNumber: Integer;
    procedure SetNumber(var Value: Integer);
  public
    property Number: Integer
      read GetNumber write SetNumber;
  end;

procedure TForm1.btnTestClick(Sender: TObject);
var
  mic: TMyIntegerClass;
  n: Integer;
begin
  mic := TMyIntegerClass.Create;
  try
    // mic.Number := 10; // Error: E2036 Variable required

    n := 10;
    mic.Number := n;
    mic.Number := n;

    Show(mic.Number.ToString);
  finally
    mic.Free;
  end;
end;

procedure TForm1.Show(const Msg: string);
begin
  Memo1.Lines.Add(Msg);
end;

{ TMyIntegerClass }

function TMyIntegerClass.GetNumber: Integer;
begin
  Result := fNumber;
end;

procedure TMyIntegerClass.SetNumber(var Value: Integer);
begin
  Inc (Value); // side effect
  fNumber := Value;
end;

end.
