unit ObjFromIntfMainForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm39 = class(TForm)
    btnSimpleTest: TButton;
    btnRefCountIssue: TButton;
    procedure btnSimpleTestClick(Sender: TObject);
    procedure btnRefCountIssueClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form39: TForm39;

implementation

{$R *.dfm}

type
  ITestIntf = interface (IInterface)
    ['{2A77A244-DC85-46BE-B98E-A9392EF2A7A7}']
    procedure DoSomething;
  end;

  TTestImpl = class (TInterfacedObject, ITestIntf)
  public
    procedure DoSomething;
    procedure DoSomethingElse; // not in interface
    destructor Destroy; override;
  end;

procedure TForm39.btnRefCountIssueClick(Sender: TObject);
var
  intf: ITestIntf;
  original: TObject;
begin
  intf := TTestImpl.Create;
  intf.DoSomething;
  if intf is TObject then
    original := TObject (intf);
  intf := nil;
  if Assigned (original) then
    (original as TTestImpl).DoSomethingElse;
end;

procedure TForm39.btnSimpleTestClick(Sender: TObject);
var
  intf: ITestIntf;
begin
  intf :=  TTestImpl.Create;
  intf.DoSomething;
  (intf as TTestImpl).DoSomethingElse;
end;

{ ITestImpl }

destructor TTestImpl.Destroy;
begin
  ShowMessage ('Freeing object');
  inherited;
end;

procedure TTestImpl.DoSomething;
begin
  ShowMessage ('Doing something');
end;

procedure TTestImpl.DoSomethingElse;
begin
  ShowMessage ('Doing something else');
end;

end.
