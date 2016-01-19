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

  TJumperImpl = class (TAggregatedObject, IJumper)
  private
    FPos: Integer;
  public
    function Jump: string;
    function Walk: string;
    procedure SetPos (Value: Integer);
    function GetPos: Integer;
    property Position: Integer Read GetPos Write SetPos;
  end;

  TMyJumper = class (TInterfacedObject, IJumper)
  private
    FJumpImpl: TJumperImpl;
  public
    constructor Create;
    destructor Destroy; override;
    property Jumper: TJumperImpl
      read FJumpImpl implements IJumper;
  end;

  TAthlete = class (TInterfacedObject, IWalker, IJumper)
  private
    FJumpImpl: TJumperImpl;
  public
    constructor Create;
    destructor Destroy; override;

    function Run: string; virtual;
    function Walk1: string; virtual;
    function IWalker.Walk = Walk1;
    procedure SetPos (Value: Integer);
    function GetPos: Integer;

    property Jumper: TJumperImpl
      read FJumpImpl implements IJumper;
  end;


implementation

{$R *.fmx}

procedure TForm1.Button1Click(Sender: TObject);
var
  Intf: IWalker;
begin
  Intf := TRunner.Create;
  Intf.Position := 0;
  Show (Intf.Walk);
  Show (Intf.Run);
  Show (Intf.Run);
end;

procedure TForm1.Button2Click(Sender: TObject);
var
  Intf: IJumper;
begin
  Intf := TMyJumper.Create;
  Intf.Position := 0;
  Show (Intf.Walk);
  Show (Intf.Jump);
  Show (Intf.Walk);
end;

procedure TForm1.Button3Click(Sender: TObject);
var
  Intf: IWalker;
begin
  Intf := TAthlete.Create;
  Intf.Position := 0;
  Show (Intf.Walk);
  Show (Intf.Run);
  Show ((Intf as IJumper).Jump);
end;

procedure TForm1.Button4Click(Sender: TObject);
var
  Intf: IInterface;
  WalkIntf: IWalker;
begin
  Intf := TAthlete.Create;
  if Supports (Intf, IWalker, WalkIntf) then
    Show (WalkIntf.Walk);

  if Intf.QueryInterface (IWalker, WalkIntf) = S_OK then
    Show (WalkIntf.Walk);
end;

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
  Result := FPos.ToString + ': Run';
end;

procedure TRunner.SetPos(Value: Integer);
begin
  FPos := Value;
end;

function TRunner.Walk: string;
begin
  Inc (FPos);
  Result := FPos.ToString + ': Walk';
end;

{ TJumperImpl }

function TJumperImpl.GetPos: Integer;
begin
  Result := FPos;
end;

function TJumperImpl.Jump: string;
begin
  Inc (FPos, 3);
  Result := FPos.ToString + ': Jump';
end;

procedure TJumperImpl.SetPos(Value: Integer);
begin
  FPos := Value;
end;

function TJumperImpl.Walk: string;
begin
  Inc (FPos);
  Result := FPos.ToString + ': Walk';
end;

{ TMyJumper }

constructor TMyJumper.Create;
begin
  FJumpImpl := TJumperImpl.Create (self);
end;

destructor TMyJumper.Destroy;
begin
  FJumpImpl.Free;
  inherited;
end;

{ TAthlete }

constructor TAthlete.Create;
begin
  FJumpImpl := TJumperImpl.Create (self);
end;

destructor TAthlete.Destroy;
begin
  FJumpImpl.Free;
  inherited;
end;

function TAthlete.GetPos: Integer;
begin
  Result := FJumpImpl.Position;
end;

function TAthlete.Run: string;
begin
  FJumpImpl.Position := FJumpImpl.Position + 2;
  Result := IntToStr (FJumpImpl.Position) + ': Run';
end;

procedure TAthlete.SetPos(Value: Integer);
begin
  FJumpImpl.Position := Value;
end;

function TAthlete.Walk1: string;
begin
  FJumpImpl.Position := FJumpImpl.Position + 1;
  Result := IntToStr (FJumpImpl.Position) + ': Walk';
end;

initialization
  // check we are not leaking objects
  ReportMemoryLeaksOnShutdown := True;

end.
