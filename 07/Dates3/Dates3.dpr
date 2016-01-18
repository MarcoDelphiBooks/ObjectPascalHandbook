program Dates3;

uses
  System.StartUpCopy,
  FMX.MobilePreview,
  FMX.Forms,
  DatesForm in 'DatesForm.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
