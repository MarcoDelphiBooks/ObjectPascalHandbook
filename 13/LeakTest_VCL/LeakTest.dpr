program LeakTest;

uses
  Forms,
  LeakTestForm in 'LeakTestForm.pas' {FormLeakTest};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormLeakTest, FormLeakTest);
  Application.Run;
end.
