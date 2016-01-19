program CustomerDictionary;

uses
  Forms,
  CustomerDictionary_MainForm in 'CustomerDictionary_MainForm.pas' {FormCustomerDictionary},
  CustomerClasses in 'CustomerClasses.pas',
  CustomerDataModule in 'CustomerDataModule.pas' {DataModule1: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormCustomerDictionary, FormCustomerDictionary);
  Application.CreateForm(TDataModule1, DataModule1);
  Application.Run;
end.
