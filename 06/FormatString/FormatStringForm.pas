unit FormatStringForm;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Layouts, FMX.Memo, FMX.Edit, FMX.Controls.Presentation, FMX.ScrollBox;

type
  TForm1 = class(TForm)
    Memo1: TMemo;
    Button1: TButton;
    Button2: TButton;
    Edit1: TEdit;
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
  Diagnostics;

const
  MaxLoop = 5000000; // five million


procedure TForm1.Button1Click(Sender: TObject);
begin
  Edit1.Text := 'Value %d, Align %4d, Fill %4.4d';
end;

procedure TForm1.Button2Click(Sender: TObject);
var
  strFmt: string;
  n1, n2, n3: Integer;
begin
  strFmt := Edit1.Text;
  n1 := 8;
  n2 := 16;
  n3 := 256;

  Show (Format ('Format string: %s', [strFmt]));
  Show (Format ('Input data: [%d, %d, %d]', [n1, n2, n3]));
  Show (Format ('Output: %s', [Format (strFmt, [n1, n2, n3])]));
  Show (''); // blank line
end;

procedure TForm1.Show(const Msg: string);
begin
  Memo1.Lines.Add(Msg);
end;

end.
