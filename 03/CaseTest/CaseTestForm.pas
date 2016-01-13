unit CaseTestForm;

interface

// running this program raises an exception by design

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Layouts, FMX.Memo, FMX.Edit, FMX.EditBox, FMX.NumberBox,
  FMX.Controls.Presentation, FMX.ScrollBox;

type
  TForm1 = class(TForm)
    Memo1: TMemo;
    Button1: TButton;
    Edit1: TEdit;
    Button3: TButton;
    NumberBox1: TNumberBox;
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
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
  number: Integer;
  aText: string;
begin
  number := Trunc(NumberBox1.Value);
  case number of
    1: aText := 'One';
    2: aText := 'Two';
    3: aText := 'Three';
  end;
  if aText <> '' then
    Show(aText);
end;

procedure TForm1.Button3Click(Sender: TObject);
var
  aChar: Char;
  aText: string;
begin
  /// multiple nested if statements
  if Edit1.Text.Length > 0 then
  begin
    aChar := Edit1.Text.Chars[0];

    case aChar of
      '+' : aText := 'Plus sign';
      '-' : aText := 'Minus sign';
      '*', '/': aText := 'Multiplication or division';
      '0'..'9': aText := 'Number';
      'a'..'z': aText := 'Lowercase character';
      'A'..'Z': aText := 'Uppercase character';
      #12032..#12255: aText := 'Kangxi Radical';
    else
      aText := 'Other character: ' + aChar;
    end;

    Show(aText);
  end;
end;

procedure TForm1.Show(const msg: string);
begin
  Memo1.Lines.Add(msg);
end;

end.
