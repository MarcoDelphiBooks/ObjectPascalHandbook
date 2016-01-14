unit FunctionTestForm;

interface

// running this program raises an exception by design

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
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
  private
    { Private declarations }
  public
    procedure Show (const msg: string);
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

// simple procedure
procedure Hello;
begin
  Form1.Show ('Hello world!');
end;

// alternative code (uncomment, and comment the previous version)
//procedure Hello;
//begin
//  FOrm1.Show ('Hello world, again!');
//end;

// classic style function (assign result to function name)
function DoubleOld (Value: Integer) : Integer;
begin
  DoubleOld := Value * 2;
end;

// functions with modern alternative coding (use Result)
function Double (Value: Integer) : Integer;
begin
  Result := Value * 2;
end;

procedure DoubleHello; forward;

procedure NewHello;
begin
  if MessageDlg ('Do you want a double message?',
      TMsgDlgType.mtConfirmation,
      [TMsgDlgBtn.mbYes, TMsgDlgBtn.mbNo],
      0) = mrYes then
    DoubleHello
  else
    ShowMessage ('Hello');
end;

procedure DoubleHello;
begin
  NewHello;
  NewHello;
end;

function PowerL (Base, Exp: Integer): Integer;
var
  I: Integer;
begin
  Result := 1;
  for I := 1 to Exp do
    Result := Result * Base;
end;

function PowerR (Base, Exp: Integer): Integer;
var
  I: Integer;
begin
  if Exp = 0 then
    Result := 1
  else
    Result := Base * PowerR (Base, Exp - 1);
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  Hello;
end;

procedure TForm1.Button2Click(Sender: TObject);
var
  X, Y: Integer;
begin
  // call the function
  X := Double (100);
  Y := Double (X);
  Show (Y.ToString);

  // error: wrong type
  // Double (10.0);
end;

{works also with $ZEROBASEDSTRINGS ON}

procedure TForm1.Button3Click(Sender: TObject);
begin
  NewHello;
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
  Show(PowerL (2,3).ToString);
  Show(PowerR (2,3).ToString);
end;

procedure TForm1.Show(const msg: string);
begin
  Memo1.Lines.Add(msg);
end;

end.
