program AnonymFirst;

uses
  Forms,
  AnonymFirst_MainForm in 'AnonymFirst_MainForm.pas' {FormAnonymFirst};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormAnonymFirst, FormAnonymFirst);
  Application.Run;
end.
