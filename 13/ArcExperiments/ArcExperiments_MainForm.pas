unit ArcExperiments_MainForm;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls, FMX.Layouts,
  FMX.Memo, FMX.ScrollBox, FMX.Controls.Presentation;

type
  TForm3 = class(TForm)
    Button1: TButton;
    Memo1: TMemo;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    procedure Log (const strMsg: string);
  end;

var
  Form3: TForm3;

function TheForm: TForm3;

implementation

uses
  Arc_MoreClasses;

{$R *.fmx}

type
  TMySimpleClass = class
  public
    constructor Create();
    destructor Destroy (); override;
    procedure DoSomething(bRaise: Boolean = False);
  public
    class procedure CreateOnly;
    class procedure TryFinally;
    class procedure SetNil;
  end;

function TheForm: TForm3;
begin
  Result := Form3;
end;

{ TMySimpleClass }

constructor TMySimpleClass.Create;
begin
  TheForm.Log(classname + ' created');
end;

class procedure TMySimpleClass.CreateOnly;
var
  MyObj: TMySimpleClass;
begin
  TheForm.Log ('Starting CreateOnly');
  MyObj := TMySimpleClass.Create;
  MyObj.DoSomething;
  TheForm.Log ('Done with CreateOnly');
end;

destructor TMySimpleClass.Destroy;
begin
  TheForm.Log(classname + ' destroyed');
  inherited;
end;


procedure TMySimpleClass.DoSomething (bRaise: Boolean);
begin
  TheForm.Log('Something');
  if bRaise then
    raise Exception.Create('Error Message');
end;

class procedure TMySimpleClass.SetNil;
var
  MyObj: TMySimpleClass;
begin
  TheForm.Log ('Starting SetNil');
  MyObj := TMySimpleClass.Create;
  try try
    MyObj.DoSomething (True); // True => raise;
  except
    TheForm.Log ('Exception handled');
  end;
  finally
    MyObj := nil;
  end;
  TheForm.Log ('Done with SetNil');
end;

class procedure TMySimpleClass.TryFinally;
var
  MyObj: TMySimpleClass;
begin
  TheForm.Log ('Starting TryFinally');
  MyObj := TMySimpleClass.Create;
  try
    MyObj.DoSomething;
  finally
    MyObj.Free;
  end;
  TheForm.Log ('Done with TryFinally');
end;


{ TForm3 }

procedure TForm3.Button1Click(Sender: TObject);
begin
  TMySimpleClass.CreateOnly;
  TheForm.Log ('=====================');
  TMySimpleClass.TryFinally;
//  TheForm.Log ('=====================');
//  TMySimpleClass.SetNil;
end;

procedure TForm3.Button2Click(Sender: TObject);
begin
  TMyComplexClass.CreateOnly;
end;

procedure TForm3.Log(const strMsg: string);
begin
  Memo1.Lines.Add (strMsg);
end;

end.
