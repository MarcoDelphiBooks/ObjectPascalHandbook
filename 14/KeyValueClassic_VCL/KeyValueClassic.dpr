program KeyValueClassic;

uses
  Forms,
  KeyValueForm in 'KeyValueForm.pas' {Form2},
  KeyValueCode in 'KeyValueCode.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm2, Form2);
  Application.Run;
end.
