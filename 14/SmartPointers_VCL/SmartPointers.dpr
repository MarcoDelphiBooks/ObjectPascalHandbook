program SmartPointers;

uses
  Forms,
  SmartPointers_MainForm in 'SmartPointers_MainForm.pas' {FormSmartPointers},
  SmartPointerClass in 'SmartPointerClass.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormSmartPointers, FormSmartPointers);
  Application.Run;
end.
