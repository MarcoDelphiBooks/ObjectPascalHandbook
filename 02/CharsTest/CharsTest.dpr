program CharsTest;

uses
  System.StartUpCopy,
  FMX.MobilePreview,
  FMX.Forms,
  CharsTestForm in 'CharsTestForm.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
