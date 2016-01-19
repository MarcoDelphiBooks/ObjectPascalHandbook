program TypesList;

uses
  System.StartUpCopy,
  FMX.MobilePreview,
  FMX.Forms,
  TypesForm in 'TypesForm.pas' {Form1},
  TypeInfoForm in 'TypeInfoForm.pas' {FormTypeInfo};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TFormTypeInfo, FormTypeInfo);
  Application.Run;
end.
