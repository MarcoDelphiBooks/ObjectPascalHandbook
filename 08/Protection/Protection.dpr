program Protection;

uses
  System.StartUpCopy,
  FMX.MobilePreview,
  FMX.Forms,
  ProtectionForm in 'ProtectionForm.pas' {Form1},
  TestClass in 'TestClass.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
