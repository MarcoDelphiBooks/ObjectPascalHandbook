program FloatTest;

uses
  System.StartUpCopy,
  FMX.MobilePreview,
  FMX.Forms,
  FloatTestForm in 'FloatTestForm.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
