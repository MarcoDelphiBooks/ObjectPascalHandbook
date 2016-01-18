program ViewDates;

uses
  System.StartUpCopy,
  FMX.MobilePreview,
  FMX.Forms,
  ViewDatesForm in 'ViewDatesForm.pas' {DateForm},
  Dates in 'Dates.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TDateForm, DateForm);
  Application.Run;
end.
