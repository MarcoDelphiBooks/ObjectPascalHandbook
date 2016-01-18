program NumbersEnumerator;

uses
  System.StartUpCopy,
  FMX.MobilePreview,
  FMX.Forms,
  NumbersEnumerator_MainForm in 'NumbersEnumerator_MainForm.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
