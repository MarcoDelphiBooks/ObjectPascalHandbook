unit IfTestForm;

interface

// running this program raises an exception by design

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Layouts, FMX.Memo, FMX.Edit, FMX.Controls.Presentation, FMX.ScrollBox;

type
  TForm1 = class(TForm)
    Memo1: TMemo;
    Button1: TButton;
    CheckBox1: TCheckBox;
    Button2: TButton;
    Edit1: TEdit;
    Button3: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
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
  isChecked: Boolean;
begin
  isChecked := CheckBox1.IsChecked;
  if isChecked then
    Show ('Checkbox is checked');
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  // if-then-else statement
  if CheckBox1.IsChecked then
    Show ('Checkbox is checked')
  else
    Show ('Checkbox is not checked');
end;

procedure TForm1.Button3Click(Sender: TObject);
var
  aChar: Char;
begin
  /// multiple nested if statements
  if Edit1.Text.Length > 0 then
  begin
    aChar := Edit1.Text.Chars[0];

    // checks for a lowercase char (two conditions)
    if (aChar >= 'a') and (aChar <= 'z') then
      Show ('char is lowercase');

    // follow up conditions
    if aChar <= Char(47) then
      Show ('char is lower symbol')
    else if (aChar >= '0') and (aChar <= '9') then
      Show ('char is a number')
    else
      Show ('char is not a number or lower symbol');
  end;
end;

procedure TForm1.Show(const msg: string);
begin
  Memo1.Lines.Add(msg);
end;

end.
