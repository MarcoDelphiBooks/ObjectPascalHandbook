program EncodingsTest;

uses
  System.StartUpCopy,
  FMX.MobilePreview,
  FMX.Forms,
  EncodingsTestForm in 'EncodingsTestForm.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
