program CodePoints;

uses
  System.StartUpCopy,
  FMX.MobilePreview,
  FMX.Forms,
  CodePointsForm in 'CodePointsForm.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
