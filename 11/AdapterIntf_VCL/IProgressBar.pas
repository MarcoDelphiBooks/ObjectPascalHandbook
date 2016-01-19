unit IProgressBar;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, adapter_intf;

type
  TProgressBar = class(ComCtrls.TProgressBar, ITextAndValue)
  private
    { Private declarations }
  protected
    procedure SetText(const Value: string);
    procedure SetValue(const Value: Integer);
    function GetText: string;
    function GetValue: Integer;
  public
    { Public declarations }
  published
    { Published declarations }
  end;

implementation

{ TIProgressBar }

function TProgressBar.GetText: string;
begin
  Result := IntToStr (Position);
end;

function TProgressBar.GetValue: Integer;
begin
  Result := Position;
end;

procedure TProgressBar.SetText(const Value: string);
begin
  Position := StrToIntDef (Value, 0);
end;

procedure TProgressBar.SetValue(const Value: Integer);
begin
  Position := Value;
end;

end.
