program IntfConstraint;

uses
  Forms,
  IntfConstraint_MainForm in 'IntfConstraint_MainForm.pas' {FormIntfConstraint};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormIntfConstraint, FormIntfConstraint);
  Application.Run;
end.
