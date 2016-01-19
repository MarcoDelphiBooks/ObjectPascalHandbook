program Covariant;

uses
  Vcl.Forms,
  Covariant_MainForm in 'Covariant_MainForm.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
