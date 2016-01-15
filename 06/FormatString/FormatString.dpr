program FormatString;

uses
  System.StartUpCopy,
  FMX.MobilePreview,
  FMX.Forms,
  FormatStringForm in 'FormatStringForm.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
