unit NestedTypesForm;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Layouts, FMX.Memo, FMX.Controls.Presentation, FMX.ScrollBox;

type
  TForm1 = class(TForm)
    Memo1: TMemo;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    procedure Show (const msg: string);
  end;

var
  Form1: TForm1;

// display function for secondary unit
procedure Show (const msg: string);

implementation

{$R *.fmx}

uses
  NestedClass;

procedure Show (const msg: string);
begin
  if Assigned (Form1) then
    Form1.Show(msg);
end;

procedure TForm1.Button1Click(Sender: TObject);
var
  One: TOne;
begin
  One := TOne.Create;
  One.Hello;
  One.Free;
end;

procedure TForm1.Show(const Msg: string);
begin
  Memo1.Lines.Add(Msg);
end;

end.
