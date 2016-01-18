unit ExceptionForm;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Layouts, FMX.Memo;

type
  TForm1 = class(TForm)
    Memo1: TMemo;
    Button1: TButton;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    procedure Show (const msg: string);
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

function DividePlusOne (A, B: Integer): Integer;
begin
  try
    Result := A div B; // raises exception if B equals 0
    Inc (Result);
  except
    Result := 0;
  end;
  //more
end;

procedure TForm1.Button1Click(Sender: TObject);
var
  N: Integer;
begin
  N := DividePlusOne (10, Random(3));
  Show (N.ToString);
end;

function DividePlusOneBis (A, B: Integer): Integer;
begin
  try
    Result := A div B; // error if B equals 0
    Result := Result + 1;
  except
    on E: EDivByZero do
    begin
      Result := 0;
      ShowMessage (E.Message);
    end;
  end;
end;

procedure TForm1.Button2Click(Sender: TObject);
var
  N: Integer;
begin
  N := DividePlusOneBis (10, Random(3));
  Show (N.ToString);
end;

procedure TForm1.Show(const Msg: string);
begin
  Memo1.Lines.Add(Msg);
end;

initialization
  Randomize; // make the random sequence start with a new seed

end.
