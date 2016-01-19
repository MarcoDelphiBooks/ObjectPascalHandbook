unit InterfaceForm;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Layouts, FMX.Memo;

type
  TForm1 = class(TForm)
    Memo1: TMemo;
    btnMix: TButton;
    btnIntfOnly: TButton;
    procedure btnMixClick(Sender: TObject);
    procedure btnIntfOnlyClick(Sender: TObject);
  private
    { Private declarations }
  public
    procedure Show (const msg: string);
  end;

var
  Form1: TForm1;


type
  IMyInterface = interface
    ['{F7BEADFD-ED10-4048-BB0C-5B232CF3F272}']
    procedure Show;
  end;

  TMyIntfObject = class (TInterfacedObject, IMyInterface)
  public
    procedure Show;
  end;


implementation

{$R *.fmx}

procedure ShowThat (anIntf: IMyInterface);
begin
  anIntf.Show;
end;

procedure TForm1.btnMixClick(Sender: TObject);
var
  anObj: TMyIntfObject;
begin
  anObj := TMyIntfObject.Create;
  try
    ShowThat (anObj);
  finally
    anObj.Free;
  end;
end;

procedure TForm1.btnIntfOnlyClick(Sender: TObject);
var
  anObj: IMyInterface;
begin
  anObj := TMyIntfObject.Create;
  ShowThat (anObj);
end;

procedure TForm1.Show(const Msg: string);
begin
  Memo1.Lines.Add(Msg);
end;

{ TMyIntfObject }

procedure TMyIntfObject.Show;
begin
  Form1.Show('Showing');
end;

initialization
  // check we are not leaking objects
  ReportMemoryLeaksOnShutdown := True;

end.
