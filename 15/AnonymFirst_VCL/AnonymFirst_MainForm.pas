unit AnonymFirst_MainForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;


// anonymous method type declaration
type
  TIntProc = reference to procedure (n: Integer);

// method reference type declaration (not used, only to compare syntax)
type
  TIntMethod = procedure (n: Integer) of object;

type
  TFormAnonymFirst = class(TForm)
    btnSimpleVar: TButton;
    Memo1: TMemo;
    btnProcParam: TButton;
    btnLocalVal: TButton;
    btnStore: TButton;
    btnCall: TButton;
    btnNoParen: TButton;
    btReturn: TButton;
    procedure btnSimpleVarClick(Sender: TObject);
    procedure btnProcParamClick(Sender: TObject);
    procedure btnLocalValClick(Sender: TObject);
    procedure btnStoreClick(Sender: TObject);
    procedure btnCallClick(Sender: TObject);
    procedure btReturnClick(Sender: TObject);
  private
    FAnonMeth: TIntProc;
    procedure SetAnonMeth(const Value: TIntProc);
    function GetShowMethod: TIntProc;
  public
    property AnonMeth: TIntProc read FAnonMeth write SetAnonMeth;
  end;

var
  FormAnonymFirst: TFormAnonymFirst;

implementation

{$R *.dfm}

procedure CallTwice (value: Integer; anIntProc: TIntProc);
begin
  anIntProc (value);
  Inc (value);
  anIntProc (value);
end;

procedure TFormAnonymFirst.btnCallClick(Sender: TObject);
begin
  if Assigned (AnonMeth) then
  begin
    AnonMeth(5);
  end;
end;

procedure TFormAnonymFirst.btnLocalValClick(Sender: TObject);
var
  aNumber: Integer;
begin
  aNumber := 0;
  CallTwice (10,
    procedure (n: Integer)
    begin
      Inc (aNumber, n);
    end);
  Memo1.Lines.Add (IntToStr (aNumber));
end;

procedure TFormAnonymFirst.btnProcParamClick(Sender: TObject);
begin
  CallTwice (48,
    procedure (n: Integer)
    begin
      Memo1.Lines.Add (IntToHex (n, 4));
    end);
  CallTwice (100,
    procedure (n: Integer)
    begin
      Memo1.Lines.Add (FloatToStr(Sqrt(n)));
    end);
end;

procedure TFormAnonymFirst.btnSimpleVarClick(Sender: TObject);
var
  anIntProc: TIntProc;
begin
  anIntProc := procedure (n: Integer)
  begin
    Memo1.Lines.Add (IntToStr (n));
  end;
  anIntProc (22);
  anIntProc (22);
end;

procedure TFormAnonymFirst.btnStoreClick(Sender: TObject);
var
  aNumber: Integer;
begin
  aNumber := 3;
  AnonMeth :=
    procedure (n: Integer)
    begin
      Inc (aNumber, n);
      Memo1.Lines.Add (IntToStr (aNumber));
    end;
end;

function TFormAnonymFirst.GetShowMethod: TIntProc;
var
  x: Integer;
begin
  x := Random (100);
  Memo1.Lines.Add ('New x is ' + IntToStr (x));
  Result := procedure (n: Integer)
  begin
    x := x + n;
    Memo1.Lines.Add (IntToStr (x));
  end;
end;

procedure TFormAnonymFirst.btReturnClick(Sender: TObject);
var
  ip: TIntProc;
begin
  GetShowMethod; // compiles, but probably not what you want

  // call using a te
  // ip := GetShowMethod; // E2010 Incompatible types: 'TIntProc' and 'Procedure of object'
  ip := GetShowMethod();
  ip (3);

  // GetShowMethod(3); // E2034 Too many actual parameters
  GetShowMethod()(3);

  // GetShowMethod.Invoke (3), listed in the book, stopped working in recent versions of the compiler
end;

procedure TFormAnonymFirst.SetAnonMeth(const Value: TIntProc);
begin
  FAnonMeth := Value;
end;

initialization
  Randomize;

end.
