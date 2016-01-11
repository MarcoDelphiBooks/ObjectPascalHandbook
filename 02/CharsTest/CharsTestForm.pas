unit CharsTestForm;

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
  ch: Char;
begin
  ch := 'a';
  Show (BoolToStr(ch.IsLetter, True));
  Show (ch.ToUpper);
end;

procedure TForm1.Button2Click(Sender: TObject);
var
  ch: Char;
  str1: string;
begin
  ch := 'a';
  Show (ch);
  Inc (ch, 100);
  Show (ch);

  str1 := '';
  for ch := #32 to #1024 do
    str1 := str1 + ch;
  Show (str1)
end;

procedure TForm1.Show(const msg: string);
begin
  Memo1.Lines.Add(msg);
end;

end.
