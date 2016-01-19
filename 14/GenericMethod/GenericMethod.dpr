program GenericMethod;

uses
  System.StartUpCopy,
  FMX.MobilePreview,
  FMX.Forms,
  GenericForm in 'GenericForm.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
