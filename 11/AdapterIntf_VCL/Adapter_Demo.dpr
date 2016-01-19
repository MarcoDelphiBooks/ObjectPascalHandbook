program Adapter_Demo;

uses
  Forms,
  mainform in 'mainform.pas' {FormAdapter},
  adapter_intf in 'adapter_intf.pas';

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TFormAdapter, FormAdapter);
  Application.Run;
end.
