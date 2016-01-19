program ControlHelper;

uses
  System.StartUpCopy,
  FMX.MobilePreview,
  FMX.Forms,
  HelperForm in 'HelperForm.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
