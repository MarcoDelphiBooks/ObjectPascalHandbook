program AnonAjax;

uses
  Forms,
  AnonAjax_MainForm in 'AnonAjax_MainForm.pas' {FormAnonAjax},
  AnonAjax_Thread in 'AnonAjax_Thread.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormAnonAjax, FormAnonAjax);
  Application.Run;
end.
