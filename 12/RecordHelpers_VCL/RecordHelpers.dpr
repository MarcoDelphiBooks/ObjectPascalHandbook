program RecordHelpers;

uses
  Vcl.Forms,
  RecordHelpers_MainForm in 'RecordHelpers_MainForm.pas' {Form4};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm4, Form4);
  Application.Run;
end.
