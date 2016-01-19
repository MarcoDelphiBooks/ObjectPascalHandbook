program RttiIntro;

uses
  Forms,
  RttiIntro_MainForm in 'RttiIntro_MainForm.pas' {FormRttiIntro};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormRttiIntro, FormRttiIntro);
  Application.Run;
end.
