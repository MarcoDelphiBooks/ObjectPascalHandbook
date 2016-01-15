program RecordsTest;

uses
  System.StartUpCopy,
  FMX.MobilePreview,
  FMX.Forms,
  RecordsTestForm in 'RecordsTestForm.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
