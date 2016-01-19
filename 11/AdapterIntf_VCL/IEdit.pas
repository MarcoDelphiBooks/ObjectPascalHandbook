unit IEdit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, adapter_intf;

type
  TEdit = class(StdCtrls.TEdit, ITextAndValue)
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

{ TIEdit }

function TEdit.GetText: string;
begin
  Result := Text;
end;

function TEdit.GetValue: Integer;
begin
  Result := StrToIntDef (Text, 0);
end;

procedure TEdit.SetText(const Value: string);
begin
  Text := Value;
end;

procedure TEdit.SetValue(const Value: Integer);
begin
  Text := IntToStr (Value);
end;

end.
