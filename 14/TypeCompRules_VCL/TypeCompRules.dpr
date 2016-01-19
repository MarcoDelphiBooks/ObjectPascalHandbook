program TypeCompRules;

uses
  Forms,
  TypeCompRules_MainForm in 'TypeCompRules_MainForm.pas' {Form30},
  TypeCompRules_OtherUnit in 'TypeCompRules_OtherUnit.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm30, Form30);
  Application.Run;
end.
