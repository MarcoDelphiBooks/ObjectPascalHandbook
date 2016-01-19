unit InterfaceForm;

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
  private
    { Private declarations }
  public
    procedure Show (const msg: string);
  end;

var
  Form1: TForm1;


type
  IWalker = interface
    ['{0876F200-AAD3-11D2-8551-CCA30C584521}']
    function Walk: string;
    function Run: string;
    procedure SetPos (Value: Integer);
    function GetPos: Integer;

    property Position: Integer
      read GetPos write SetPos;
  end;

  IJumper = interface
    ['{0876F201-AAD3-11D2-8551-CCA30C584521}']
    function Jump: string;
    function Walk: string;
    procedure SetPos (Value: Integer);
    function GetPos: Integer;

    property Position: Integer
      read GetPos write SetPos;
  end;

  TRunner = class (TInterfacedObject, IWalker)
  private
    FPos: Integer;
  public
    function Walk: string;
    function Run: string;
    procedure SetPos (Value: Integer);
    function GetPos: Integer;
  end;

  TJumperImpl = class (TInterfacedObject, IJumper)
  private
    FPos: Integer;
  public
    function Jump: string;
    function Walk: string;
    procedure SetPos (Value: Integer);
    function GetPos: Integer;
  end;


implementation

{$R *.fmx}

procedure TForm1.Show(const Msg: string);
begin
  Memo1.Lines.Add(Msg);
end;


{ TRunner }

function TRunner.GetPos: Integer;
begin
  Result := FPos;
end;

function TRunner.Run: string;
begin
  Inc (FPos, 2);
end;

procedure TRunner.SetPos(Value: Integer);
begin
  FPos := Value;
end;

function TRunner.Walk: string;
begin
  Inc (FPos);
end;

{ TJumperImpl }

function TJumperImpl.GetPos: Integer;
begin
  Result := FPos;
end;

function TJumperImpl.Jump: string;
begin
  Inc (FPos, 3);
end;

procedure TJumperImpl.SetPos(Value: Integer);
begin
  FPos := Value;
end;

function TJumperImpl.Walk: string;
begin
  Inc (FPos);
end;

initialization
  // check we are not leaking objects
  ReportMemoryLeaksOnShutdown := True;

end.
