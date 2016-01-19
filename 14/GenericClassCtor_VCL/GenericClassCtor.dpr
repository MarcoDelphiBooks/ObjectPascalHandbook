program GenericClassCtor;

uses
  Forms,
  GenericClassCtor_MainForm in 'GenericClassCtor_MainForm.pas' {FormGenericClassCtor},
  GenericClassCtor_Classes in 'GenericClassCtor_Classes.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormGenericClassCtor, FormGenericClassCtor);
  Application.Run;
end.
