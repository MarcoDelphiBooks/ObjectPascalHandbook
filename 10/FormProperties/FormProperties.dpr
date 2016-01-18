program FormProperties;

uses
  System.StartUpCopy,
  FMX.Forms,
  FormPropertiesForm in 'FormPropertiesForm.pas' {FormProp};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFormProp, FormProp);
  Application.Run;
end.
