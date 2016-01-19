program ClassRef;

uses
  System.StartUpCopy,
  FMX.MobilePreview,
  FMX.Forms,
  ClassRefForm in 'ClassRefForm.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
