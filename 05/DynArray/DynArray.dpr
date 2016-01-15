program DynArray;

uses
  System.StartUpCopy,
  FMX.MobilePreview,
  FMX.Forms,
  DynArrayForm in 'DynArrayForm.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
