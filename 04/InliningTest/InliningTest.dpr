program InliningTest;

uses
  System.StartUpCopy,
  FMX.MobilePreview,
  FMX.Forms,
  InliningTestForm in 'InliningTestForm.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
