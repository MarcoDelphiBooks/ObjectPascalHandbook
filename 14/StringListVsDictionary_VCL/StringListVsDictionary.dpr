program StringListVsDictionary;

uses
  Vcl.Forms,
  ListDictionary_MainForm in 'ListDictionary_MainForm.pas' {FormLists};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormLists, FormLists);
  Application.Run;
end.
