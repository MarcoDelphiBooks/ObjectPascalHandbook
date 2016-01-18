unit DynamicEventsForm;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Layouts, FMX.Memo, FMX.Controls.Presentation;

type
  TFormDynamic = class(TForm)
    btnTest: TButton;
    procedure btnTestClick(Sender: TObject);
    procedure FormMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Single);
  private
    FCounter: Integer;
  public
    procedure btnTest2Click(Sender: TObject);
    procedure btnNewClick(Sender: TObject);
  end;

var
  FormDynamic: TFormDynamic;

implementation

{$R *.fmx}

procedure TFormDynamic.btnNewClick(Sender: TObject);
begin
  ShowMessage ('You selected ' + (Sender as TButton).Text)
end;

procedure TFormDynamic.btnTest2Click(Sender: TObject);
begin
  ShowMessage ('Test message, again');
end;

procedure TFormDynamic.btnTestClick(Sender: TObject);
begin
  ShowMessage ('Test message');
  btnTest.OnClick := btnTest2Click;
end;

procedure TFormDynamic.FormMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Single);
var
  AButton: TButton;
begin
  AButton := TButton.Create(Self);
  AButton.Parent := Self;
  AButton.SetBounds(X, Y, 100, 40);
  Inc (FCounter);
  AButton.Text := 'Button' + IntToStr (FCounter);
  AButton.OnClick := btnNewClick;
end;

end.
