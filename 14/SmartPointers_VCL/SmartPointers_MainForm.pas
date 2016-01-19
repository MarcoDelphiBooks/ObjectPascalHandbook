unit SmartPointers_MainForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TFormSmartPointers = class(TForm)
    btnLeak: TButton;
    btnSmart: TButton;
    btnSmartShort: TButton;
    btnImplicitCreate: TButton;
    Memo1: TMemo;
    procedure btnLeakClick(Sender: TObject);
    procedure btnSmartClick(Sender: TObject);
    procedure btnSmartShortClick(Sender: TObject);
    procedure btnImplicitCreateClick(Sender: TObject);
    procedure Log (const strMsg: string);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormSmartPointers: TFormSmartPointers;

implementation

uses
  SmartPointerClass;

{$R *.dfm}

procedure TFormSmartPointers.btnImplicitCreateClick(Sender: TObject);
var
  smartP: TSmartPointer<TStringList>;
begin
//  smartP.Create;
  smartP.Value.Add('foo');
  Log ('Count: ' + IntToStr (smartP.Value.Count));
end;

procedure TFormSmartPointers.btnLeakClick(Sender: TObject);
var
  sl: TStringList;
begin
  // memory leak
  sl := TStringList.Create;
  sl.Add('foo');
  Log ('Count: ' + IntToStr (sl.Count));
end;

procedure TFormSmartPointers.btnSmartClick(Sender: TObject);
var
  sl: TStringList;
  smartP: TSmartPointer<TStringList>;
begin
  sl := TStringList.Create;
  smartP := sl;
  sl.Add('foo');
  Log ('Count: ' + IntToStr (sl.Count));
end;

procedure TFormSmartPointers.btnSmartShortClick(Sender: TObject);
var
  smartP: TSmartPointer<TStringList>;
begin
  smartP := TStringList.Create;
  smartP.Value.Add('foo');
  TStringList(smartP).Add('foo2');
  Log ('Count: ' + IntToStr (TStringList(smartP).Count));
end;

procedure TFormSmartPointers.Log(const strMsg: string);
begin
  Memo1.Lines.Add (strMsg);
end;

initialization
  ReportMemoryLeaksOnShutdown := True;

end.
