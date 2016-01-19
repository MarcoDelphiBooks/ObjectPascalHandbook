program ArcExperiments;

uses
  System.StartUpCopy,
  FMX.Forms,
  ArcExperiments_MainForm in 'ArcExperiments_MainForm.pas' {Form3},
  Arc_MoreClasses in 'Arc_MoreClasses.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm3, Form3);
  Application.Run;
end.
