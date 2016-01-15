program CharTest;

uses
  System.StartUpCopy,
  FMX.MobilePreview,
  FMX.Forms,
  CharTestForm in 'CharTestForm.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
