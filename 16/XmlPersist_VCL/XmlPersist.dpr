program XmlPersist;

uses
  Forms,
  XmlPersist_MainForm in 'XmlPersist_MainForm.pas' {FormXmlPersist},
  XmlPersistAttrib_Classes in 'XmlPersistAttrib_Classes.pas',
  TrivialXmlWriter in 'TrivialXmlWriter.pas',
  XmlPersistPublish_Classes in 'XmlPersistPublish_Classes.pas',
  XmlPersistRtti_Classes in 'XmlPersistRtti_Classes.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormXmlPersist, FormXmlPersist);
  Application.Run;
end.
