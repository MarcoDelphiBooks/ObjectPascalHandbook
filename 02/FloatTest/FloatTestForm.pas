unit FloatTestForm;

interface

// running this program raises an exception by design

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Layouts, FMX.Memo, FMX.Controls.Presentation, FMX.ScrollBox;

type
  TForm1 = class(TForm)
    Memo1: TMemo;
    Button1: TButton;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    procedure Show (const msg: string);
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

uses
  Character;

procedure TForm1.Button1Click(Sender: TObject);
var
  s1: Single;
begin
  s1 := 0.5 * 0.2;
  Show (s1.ToString);
end;

procedure TForm1.Button2Click(Sender: TObject);
var
  d1: Double;
begin
  d1 := 0.5 * 0.2;
  Show (d1.ToString);
end;

procedure TForm1.Show(const msg: string);
begin
  Memo1.Lines.Add(msg);
end;

end.
