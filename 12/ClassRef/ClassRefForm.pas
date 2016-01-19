unit ClassRefForm;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Layouts, FMX.Memo, FMX.Controls.Presentation, FMX.Edit;

type
  TControlClass = class of TControl;


  TForm1 = class(TForm)
    GroupBox1: TGroupBox;
    RadioButtonButton: TRadioButton;
    RadioButtonRadio: TRadioButton;
    RadioButtonEdit: TRadioButton;
    Layout1: TLayout;
    procedure RadioButtonRadioChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Layout1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Single);
    procedure RadioButtonButtonChange(Sender: TObject);
    procedure RadioButtonEditChange(Sender: TObject);
  private
    FControlType: TControlClass;
    FControlNo: Integer;
  end;

var
  Form1: TForm1;


implementation

{$R *.fmx}

procedure TForm1.FormCreate(Sender: TObject);
begin
  FControlType := TButton;
  FControlNo := 0;
end;

procedure TForm1.Layout1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Single);
var
  NewCtrl: TControl;
  NewName: String;
begin
  // create the control
  NewCtrl := FControlType.Create (Self);
  // hide it temporarily, to avoid flickering
  NewCtrl.Visible := False;
  // set parent and position
  NewCtrl.Parent := Layout1;
  NewCtrl.Position.X := X;
  NewCtrl.Position.Y := Y;
  // compute the unique name (and text)
  Inc (FControlNo);
  NewName := FControlType.ClassName + FControlNo.ToString;
  Delete (NewName, 1, 1);
  NewCtrl.Name := NewName;
  // now show it
  NewCtrl.Visible := True;
end;

procedure TForm1.RadioButtonButtonChange(Sender: TObject);
begin
  FControlType := TButton;
end;

procedure TForm1.RadioButtonRadioChange(Sender: TObject);
begin
  FControlType := TRadioButton;
end;

procedure TForm1.RadioButtonEditChange(Sender: TObject);
begin
  FControlType := TEdit;
end;

end.
