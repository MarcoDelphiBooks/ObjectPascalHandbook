program GenericInterface;

uses
  Forms,
  GenericInterface_MainForm in 'GenericInterface_MainForm.pas' {FormGenericInterface};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormGenericInterface, FormGenericInterface);
  Application.Run;
end.
