program Strings101;

uses
  System.StartUpCopy,
  FMX.MobilePreview,
  FMX.Forms,
  Strings101Form in 'Strings101Form.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
