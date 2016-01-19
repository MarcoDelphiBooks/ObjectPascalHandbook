program SystemObject;

uses
  Forms,
  SystemObject_MainForm in 'SystemObject_MainForm.pas' {FormSystemObject};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormSystemObject, FormSystemObject);
  Application.Run;
end.
