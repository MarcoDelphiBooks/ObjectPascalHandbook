program AlignTest;

uses
  System.StartUpCopy,
  FMX.MobilePreview,
  FMX.Forms,
  AlignTestForm in 'AlignTestForm.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
