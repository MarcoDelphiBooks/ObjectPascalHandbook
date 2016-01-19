program FastMMCode;

// warning: this program requires FastMM_FullDebugMode.dll

uses
  FastMM4 in 'FastMM4.pas',
  Forms,
  FastMMForm in 'FastMMForm.pas'; {Form1}

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
