unit FormPropertiesForm;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls;

type
  TFormProp = class(TForm)
    LabelStatus: TLabel;
    ToolBarStatus: TToolBar;
    procedure FormMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Single);
  private
    FClicks: Integer;
    procedure SetClicks(const Value: Integer);
    procedure SetStatusText(const Value: string);
    function GetStatusText: string;
    { Private declarations }
  public
    property Clicks: Integer
      read FClicks write SetClicks;
    property StatusText: string read GetStatusText write SetStatusText;
  end;

var
  FormProp: TFormProp;

implementation

{$R *.fmx}

{ TForm11 }

procedure TFormProp.FormMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Single);
begin
  Clicks := Clicks + 1;
end;

function TFormProp.GetStatusText: string;
begin
  Result := LabelStatus.Text
end;

procedure TFormProp.SetClicks(const Value: Integer);
begin
  FClicks := Value;
  StatusText := FClicks.ToString + ' clicks';
end;

procedure TFormProp.SetStatusText(const Value: string);
begin
  LabelStatus.Text := Value;
end;

end.
