unit FastMMForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
  TButton.Create (nil);
end;

procedure TForm1.Button2Click(Sender: TObject);
var
  pch1: PChar;
begin
  GetMem (pch1, 5);
  GetWindowText(Handle, pch1, Length(Caption));
  ShowMessage (pch1);
  FreeMem (pch1);
end;

initialization
  // ReportMemoryLeaksOnShutdown := True;
  // Win32MajorVersion
end.
