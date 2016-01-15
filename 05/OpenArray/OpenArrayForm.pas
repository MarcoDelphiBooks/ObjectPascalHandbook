unit OpenArrayForm;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Layouts, FMX.Memo, FMX.Controls.Presentation, FMX.ScrollBox;

type
  TForm1 = class(TForm)
    Memo1: TMemo;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
  private
    { Private declarations }
  public
    procedure Show (const msg: string);
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

type
  TIntegersArray = array of Integer;

function Sum (const A: array of Integer): Integer;
var
  I: Integer;
begin
  Result := 0;
  for I := Low(A) to High(A) do
    Result := Result + A[I];
end;

procedure TForm1.Button1Click(Sender: TObject);
var
  X, Y, I: Integer;
begin
  Y := 10;
  I := 1;
  X := Sum ([10, Y, 27*I]);
  Show (X.ToString);
end;

procedure TForm1.Button2Click(Sender: TObject);
var
  List: array of Integer;
  X, I: Integer;
begin
  // initialize the array
  SetLength (List, 10);
  for I := Low (List) to High (List) do
    List [I] := I * 2;
  // call
  X := Sum (List);
  Show (X.ToString);
end;

procedure TForm1.Button3Click(Sender: TObject);
var
  List: array [1..10] of Integer;
  X, I: Integer;
begin
  // initialize the array
  for I := Low (List) to High (List) do
    List [I] := I * 2;

  // call
  X := Sum (List);
  Show (X.ToString);

  // pass portion of the array
  X := Sum (Slice (List, 5));
  Show (X.ToString);
end;

procedure TForm1.Button4Click(Sender: TObject);
var
  N: Integer;
  S: string;
begin
  N := 20;
  S := 'Total:';
  Show (Format ('Total: %d', [N]));
  Show (Format ('Int: %d, Float: %f', [N, 12.4]));
  Show (Format ('%s %d', [S, N * 2]));
end;

function SumAll (const Args: array of const): Extended;
var
  I: Integer;
begin
  Result := 0;
  for I := Low(Args) to High (Args) do
    case Args [I].VType of
      vtInteger: Result :=
        Result + Args [I].VInteger;
      vtBoolean:
        if Args [I].VBoolean then
          Result := Result + 1;
      vtExtended:
        Result := Result + Args [I].VExtended^;
      vtWideChar:
        Result := Result + Ord (Args [I].VWideChar);
      vtCurrency:
        Result := Result + Args [I].VCurrency^;
    end; // case
end;

procedure TForm1.Button5Click(Sender: TObject);
var
  X: Extended;
  Y: Integer;
begin
  Y := 10;
  X := SumAll ([Y * Y, 'k', True, 10.34]);
  Show ('SumAll: ' + X.ToString);
end;

procedure TForm1.Show(const msg: string);
begin
  Memo1.Lines.Add(msg);
end;

end.
