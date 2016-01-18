unit ExceptionForm;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Layouts, FMX.Memo;

type
  TForm1 = class(TForm)
    Memo1: TMemo;
    btnWrong: TButton;
    btnFinally: TButton;
    Button1: TButton;
    procedure btnWrongClick(Sender: TObject);
    procedure btnFinallyClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
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
  EArrayFull = class (Exception);

procedure AddToArray (i: Integer);
begin
  if i > 10 then // not taht this makes much sense...
    raise EArrayFull.Create ('Array full');
end;

procedure TForm1.btnWrongClick(Sender: TObject);
var
  I, J: Integer;
begin
  Caption := 'Calculating';

  J := 0;
  // long (and wrong) computation...
  for I := 1000 downto 0 do
    J := J + J div I;

  Caption := 'Finished';
  Show ('Total: ' + J.ToString);
end;

procedure TForm1.Button1Click(Sender: TObject);
var
  I, J: Integer;
begin
  Caption := 'Calculating';
  J := 0;
  try try
    // long (and wrong) computation...
    for I := 1000 downto 0 do
      J := J + J div I;
    Show ('Total: ' + J.ToString);
  except
    on E: EDivByZero do
    begin
      // re-raise the exception with a new message
      raise Exception.Create ('Error in Algorithm');
    end;
  end;
  finally
    Caption := 'Finished';
  end;
end;

procedure TForm1.btnFinallyClick(Sender: TObject);
var
  I, J: Integer;
begin
  Caption := 'Calculating';
  J := 0;
  try
    // long (and wrong) computation...
    for I := 1000 downto 0 do
      J := J + J div I;
    Show ('Total: ' + J.ToString);
  finally
    Caption := 'Finished';
  end;
end;

procedure TForm1.Show(const Msg: string);
begin
  Memo1.Lines.Add(Msg);
end;

end.
