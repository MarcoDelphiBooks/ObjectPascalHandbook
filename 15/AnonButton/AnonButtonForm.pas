unit AnonButtonForm;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Layouts, FMX.Memo, FMX.Controls.Presentation, FMX.ScrollBox;

type
  TAnonNotif = reference to procedure (Sender: TObject);

  // interceptor class
  TButton = class (FMX.StdCtrls.TButton)
  private
    FAnonClick: TAnonNotif;
    procedure SetAnonClick(const Value: TAnonNotif);
  public
    procedure Click; override;
  public
    property AnonClick: TAnonNotif
      read FAnonClick write SetAnonClick;
  end;

type
  TForm1 = class(TForm)
    Memo1: TMemo;
    btnAssign: TButton;
    btnInvoke: TButton;
    btnKeepRef: TButton;
    procedure btnAssignClick(Sender: TObject);
    procedure btnKeepRefClick(Sender: TObject);
  private
    { Private declarations }
  public
    procedure Show (const msg: string);
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

procedure TButton.SetAnonClick(const Value: TAnonNotif);
begin
  FAnonClick := Value;
end;

procedure TButton.Click;
begin
  if Assigned (FAnonClick) then
    FAnonClick (self);
  inherited;
end;

procedure TForm1.btnAssignClick(Sender: TObject);
begin
  btnInvoke.AnonClick :=
    procedure (Sender: TObject)
    begin
      ShowMessage ((Sender as TButton).Text);
    end;
end;

procedure TForm1.btnKeepRefClick(Sender: TObject);
var
  aCompRef: TComponent;
begin
  aCompRef := Sender as TComponent;
  btnInvoke.AnonClick :=
    procedure (Sender: TObject)
    begin
      ShowMessage ((Sender as TButton).Text +
        ' assigned by ' + aCompRef.Name);
    end;
end;

procedure TForm1.Show(const Msg: string);
begin
  Memo1.Lines.Add(Msg);
end;

end.
