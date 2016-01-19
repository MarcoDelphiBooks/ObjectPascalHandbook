program InterceptBaseClass;

uses
  Forms,
  InterceptBaseClass_MainForm in 'InterceptBaseClass_MainForm.pas' {FormIntercept};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormIntercept, FormIntercept);
  Application.Run;
end.
