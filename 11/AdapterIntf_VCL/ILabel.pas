unit ILabel;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, adapter_intf;

type
  TLabel = class(StdCtrls.TLabel, ITextAndValue)
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

{ TILabel }

function TLabel.GetText: string;
begin
  Result := Caption;
end;

function TLabel.GetValue: Integer;
begin
  Result := StrToIntDef (Caption, 0);
end;

procedure TLabel.SetText(const Value: string);
begin
  Caption := Value;
end;

procedure TLabel.SetValue(const Value: Integer);
begin
  Caption := IntToStr (Value);
end;

end.
