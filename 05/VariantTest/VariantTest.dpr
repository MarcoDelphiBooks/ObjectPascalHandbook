program VariantTest;

uses
  System.StartUpCopy,
  FMX.MobilePreview,
  FMX.Forms,
  VariantTestForm in 'VariantTestForm.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
