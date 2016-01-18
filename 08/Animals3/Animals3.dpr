program Animals3;

uses
  System.StartUpCopy,
  FMX.MobilePreview,
  FMX.Forms,
  AnimalsForm in 'AnimalsForm.pas' {Form1},
  AnimalsClasses in 'AnimalsClasses.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
