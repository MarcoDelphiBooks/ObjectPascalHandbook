unit PointersTestForm;

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
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
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
  TPointerToInt = ^Integer;

procedure TForm1.Button1Click(Sender: TObject);
var
  P: ^Integer;
  X: Integer;
begin
  X := 10;
  P := @X;
  // change the value of X using the pointer
  P^ := 20;
  Show ('X: ' + X.ToString);
  Show ('P^: ' + P^.ToString);
  Show ('P: ' + Integer(P).ToHexString (8));
end;

procedure TForm1.Button2Click(Sender: TObject);
var
  P: ^Integer;
begin
  // initialization
  New (P);
  // operations
  P^ := 20;
  Show (P^.ToString);
  // termination
  Dispose (P);
end;

procedure TForm1.Button3Click(Sender: TObject);
var
  P: ^Integer;
begin
  P := nil;
  // if Assigned (P) then
    Show (P^.ToString);
end;

procedure TForm1.Show(const msg: string);
begin
  Memo1.Lines.Add(msg);
end;

end.
