program OperatorsOver;

uses
  System.StartUpCopy,
  FMX.MobilePreview,
  FMX.Forms,
  OperatorsOverForm in 'OperatorsOverForm.pas' {Form1},
  OperatorsTypes in 'OperatorsTypes.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
