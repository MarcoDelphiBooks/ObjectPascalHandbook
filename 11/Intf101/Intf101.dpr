program Intf101;

uses
  System.StartUpCopy,
  FMX.MobilePreview,
  FMX.Forms,
  InterfaceForm in 'InterfaceForm.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
