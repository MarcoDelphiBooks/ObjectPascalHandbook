program NestedTypes;

uses
  System.StartUpCopy,
  FMX.MobilePreview,
  FMX.Forms,
  NestedTypesForm in 'NestedTypesForm.pas' {Form1},
  NestedClass in 'NestedClass.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
