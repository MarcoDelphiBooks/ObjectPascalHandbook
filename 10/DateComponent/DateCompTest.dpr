program DateCompTest;

uses
  System.StartUpCopy,
  FMX.MobilePreview,
  FMX.Forms,
  DateCompTestForm in 'DateCompTestForm.pas' {FormDate};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFormDate, FormDate);
  Application.Run;
end.
