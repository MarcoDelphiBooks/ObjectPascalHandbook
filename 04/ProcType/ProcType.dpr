program ProcType;

uses
  System.StartUpCopy,
  FMX.MobilePreview,
  FMX.Forms,
  ProcTypeForm in 'ProcTypeForm.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
