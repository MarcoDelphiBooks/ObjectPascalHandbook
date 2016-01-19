program ReaderWriter;

uses
  Forms,
  ReaderWriter_MainForm in 'ReaderWriter_MainForm.pas' {FormReaderWriter};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormReaderWriter, FormReaderWriter);
  Application.Run;
end.
