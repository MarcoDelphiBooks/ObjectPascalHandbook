unit SafeCodeMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm1 = class(TForm)
    btnConstructor: TButton;
    btnMixed: TButton;
    btnRelease: TButton;
    btnCast: TButton;
    btnTryF: TButton;
    procedure btnConstructorClick(Sender: TObject);
    procedure btnMixedClick(Sender: TObject);
    procedure btnReleaseClick(Sender: TObject);
    procedure btnCastClick(Sender: TObject);
    procedure btnTryFClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses
  CantuMemTest;

{$R *.dfm}

type
  TUnsafeDesctructor = class
  private
    aList: TList;
  public
    constructor Create (positiveNumber: Integer);
    destructor Destroy; override;
    procedure Show;
  end;

  IMyInterface = interface
    procedure Show;
    function GetAnother: IMyInterface;
    procedure SetAnother (value: IMyInterface);
    property Another: IMyInterface read GetAnother write SetAnother;
  end;

  TMyIntfObject = class (TInterfacedObject, IMyInterface)
  private
    FAnother: IMyInterface;
  public
    procedure Show;
    function GetAnother: IMyInterface;
    procedure SetAnother (value: IMyInterface);
    destructor Destroy; override;
  end;

  procedure ShowThat (anIntf: IMyInterface);
  begin
    anIntf.Show;
  end;

procedure TForm1.btnCastClick(Sender: TObject);
var
  list: TList;
begin
  list := TList.Create;
  try
    list.Add(Pointer(Sender));
    list.Add(Pointer (23422));
//    (TObject(list[1]) as TButton).Caption := 'ouch';
//    if TObject(list[1]) is TButton then
//      TButton(list[1]).Caption := 'ouch';
    if IsPointerToObject (list[1]) then
      (TObject(list[1]) as TButton).Caption := 'ouch';
    if IsPointerToObject (list[0]) then
      (TObject(list[0]) as TButton).Caption := 'ouch';
  finally
    list.Free;
  end;
end;

procedure TForm1.btnConstructorClick(Sender: TObject);
var
  anObj: TUnsafeDesctructor;
begin
  anObj := TUnsafeDesctructor.Create (-10);
  try

  finally
    anObj.Free;
  end;
end;

{ TUnsafeDesctructor }

constructor TUnsafeDesctructor.Create(positiveNumber: Integer);
begin
  inherited Create;

  if positiveNumber <= 0 then
    raise Exception.Create ('Not a positive number');
  aList := TList.Create;
  aList.Add (Pointer(positiveNumber)); // don't do this!
end;

destructor TUnsafeDesctructor.Destroy;
begin
  // uncomment to fix the program
  // if assigned (aList) then
    aList.Clear;
  aList.Free;
  inherited;
end;

procedure TUnsafeDesctructor.Show;
begin
  ShowMessage ('show');
  alist.Add (Self);
end;

{ TMyIntfObject }

destructor TMyIntfObject.Destroy;
begin
  ShowMessage ('TMyIntfObject.Destroy');
  inherited;
end;

function TMyIntfObject.GetAnother: IMyInterface;
begin
  Result := FAnother;
end;

procedure TMyIntfObject.SetAnother(value: IMyInterface);
begin
  FAnother := value;
end;

procedure TMyIntfObject.Show;
begin
  ShowMessage ('whatever...');
end;

procedure TForm1.btnMixedClick(Sender: TObject);
var
  anIntf: IMyInterface;
  // anObj: TMyIntfObject;
begin
//  anObj := TMyIntfObject.Create;
  anIntf  := TMyIntfObject.Create;
//  try
    ShowThat (anIntf);
//  finally
//    anObj.Free;
//  end;
end;

procedure TForm1.btnReleaseClick(Sender: TObject);
var
  anIntf, anIntf2: IMyInterface;
begin
  anIntf := TMyIntfObject.Create;
  anIntf2 := TMyIntfObject.Create;

  anIntf.Another := anIntf2;
  anIntf2.Another := anIntf;
  anIntf.Show;

  anIntf2.Another := nil;
  anIntf := nil;
end;

type
  TAClass = class
    whatever: string;
  public
    constructor Create;
  end;

procedure TForm1.btnTryFClick(Sender: TObject);
var
  a1, a2: TAClass;
begin
  a1 := TAClass.Create;
  try
    a2 := TAClass.Create;
    try
      a1.whatever := 'one';
      a2.whatever := 'two';
    finally
     a2.Free;
    end;
  finally
     a1.Free;
  end;
end;

{ TAClass }

constructor TAClass.Create;
begin
  inherited Create;

end;

end.
