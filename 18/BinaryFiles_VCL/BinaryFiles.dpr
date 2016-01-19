program BinaryFiles;

uses
  Forms,
  BinaryFiles_MainForm in 'BinaryFiles_MainForm.pas' {FormBinary};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormBinary, FormBinary);
  Application.Run;
end.
