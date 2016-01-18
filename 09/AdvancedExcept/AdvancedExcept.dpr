program AdvancedExcept;

uses
  System.StartUpCopy,
  FMX.MobilePreview,
  FMX.Forms,
  ExceptionForm in 'ExceptionForm.pas' {FormExceptions};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFormExceptions, FormExceptions);
  Application.Run;
end.
