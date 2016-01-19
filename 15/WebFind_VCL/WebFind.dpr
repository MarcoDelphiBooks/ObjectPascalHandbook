program WebFind;

uses
  Forms,
  WebFindF in 'WebFindF.pas' {Form1},
  FindTh in 'FindTh.pas';

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
