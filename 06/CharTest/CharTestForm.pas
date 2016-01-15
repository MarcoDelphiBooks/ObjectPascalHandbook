unit CharTestForm;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Layouts, FMX.Memo, FMX.Controls.Presentation, FMX.ScrollBox;

type
  TForm1 = class(TForm)
    Memo1: TMemo;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
  private
    { Private declarations }
  public
    procedure Show (const msg: string);
    procedure ShowBool (value: Boolean);
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

{$HIGHCHARUNICODE ON}

uses
  Character;


procedure TForm1.Button1Click(Sender: TObject);
var
  ch1: Char;
begin
  ch1 := 'ù';
  Show ('UpCase ù: ' + UpCase(ch1));
  Show ('ToUpper ù: ' + ch1.ToUpper);
end;

procedure TForm1.Button2Click(Sender: TObject);
var
  str1: string;
begin
  str1 := '1.' + #9 + Char.ConvertFromUtf32 (128) +
    Char.ConvertFromUtf32($1D11E);
  ShowBool (str1.Chars[0].IsNumber);
  ShowBool (str1.Chars[1].IsPunctuation);
  ShowBool (str1.Chars[2].IsWhiteSpace);
  ShowBool (str1.Chars[3].IsControl);
  ShowBool (str1.Chars[4].IsSurrogate);
end;

procedure TForm1.Button3Click(Sender: TObject);
var
  str1: string;
begin
  str1 := #$80;
  Show (str1 + ' - ' + IntToStr (Ord (str1.Chars[0])));
end;

procedure TForm1.Button4Click(Sender: TObject);
var
  str1: string;
begin
  str1 := #$3042#$3044;
  Show (str1 + ' - ' + IntToStr (Ord (str1.Chars[0])) +
    ' - ' + IntToStr (Ord (str1.Chars[1])));
end;

procedure TForm1.Show(const Msg: string);
begin
  Memo1.Lines.Add(Msg);
end;

procedure TForm1.ShowBool(value: Boolean);
begin
  Show(BoolToStr (Value, True));
end;

end.
