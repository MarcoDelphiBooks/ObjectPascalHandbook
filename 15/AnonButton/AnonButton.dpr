program AnonButton;

uses
  System.StartUpCopy,
  FMX.MobilePreview,
  FMX.Forms,
  AnonButtonForm in 'AnonButtonForm.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
