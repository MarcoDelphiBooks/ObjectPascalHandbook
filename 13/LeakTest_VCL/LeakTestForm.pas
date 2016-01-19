unit LeakTestForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TFormLeakTest = class(TForm)
    Button1: TButton;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormLeakTest: TFormLeakTest;

implementation

{$R *.dfm}

var
  GlobalPointer: Pointer;

procedure TFormLeakTest.Button1Click(Sender: TObject);
var
  p: Pointer;
begin
  GetMem (p, 100);
end;

procedure TFormLeakTest.Button2Click(Sender: TObject);
begin
  TButton.Create (nil);
end;

procedure TFormLeakTest.FormCreate(Sender: TObject);
begin
  // global allocation
  GetMem (GlobalPointer, 200);
  RegisterExpectedMemoryLeak(GlobalPointer);
end;

initialization
  ReportMemoryLeaksOnShutdown := True;
end.
