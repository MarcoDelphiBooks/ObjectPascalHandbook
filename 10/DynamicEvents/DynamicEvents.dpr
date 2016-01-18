program DynamicEvents;

uses
  System.StartUpCopy,
  FMX.MobilePreview,
  FMX.Forms,
  DynamicEventsForm in 'DynamicEventsForm.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFormDynamic, FormDynamic);
  Application.Run;
end.
