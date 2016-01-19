program ListDemoMd2005;

uses
  Forms,
  ListForm in 'ListForm.pas' {Form1},
  Dates in 'Dates.pas';

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
