program DescriptionAttribute;

uses
  Forms,
  DescriptionAttribute_MainForm in 'DescriptionAttribute_MainForm.pas' {FormDescrAttr},
  DescriptionAttribute_Classes in 'DescriptionAttribute_Classes.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormDescrAttr, FormDescrAttr);
  Application.Run;
end.
