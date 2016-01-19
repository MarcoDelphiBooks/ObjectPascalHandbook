program IoFilesInFolder;

uses
  Forms,
  IoFilesInFolderMainForm in 'IoFilesInFolderMainForm.pas' {FormIoFiles};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormIoFiles, FormIoFiles);
  Application.Run;
end.
