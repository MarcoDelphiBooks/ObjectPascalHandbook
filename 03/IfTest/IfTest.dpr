program IfTest;

uses
  System.StartUpCopy,
  FMX.MobilePreview,
  FMX.Forms,
  IfTestForm in 'IfTestForm.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
