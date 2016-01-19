program StaticCallBack;

uses
  Forms,
  CallBackForm in 'CallBackForm.pas' {FormCallBack};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormCallBack, FormCallBack);
  Application.Run;
end.
