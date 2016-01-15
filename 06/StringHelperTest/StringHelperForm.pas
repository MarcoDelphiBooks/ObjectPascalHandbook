unit StringHelperForm;

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

procedure TForm1.Button1Click(Sender: TObject);
var
  str1, str2: string;
  I, nCount: Integer;
begin
  str1 := '';

  // create string
  for I := 1 to 10 do
    str1 := str1 + 'Object ';

  str2:= string.Copy (str1);
  str1 := str2 + 'Pascal ' + str2.Substring (10, 30);
  Show(str1);

  // find substring
  Show('Pascal at: ' +
    str1.IndexOf ('Pascal').ToString);

  // count occurrences
  I := -1;
  nCount := 0;
  repeat
    I := str1.IndexOf('O', I + 1); // search from next element
    if I >= 0 then
      Inc (nCount); // found one
  until I < 0;

  Show('O found: ' +
    nCount.ToString + ' times');
end;

procedure TForm1.Button2Click(Sender: TObject);
var
  str1, str2: string;
  I, nIndex: Integer;
begin
  str1 := '';

  // create string
  for I := 1 to 10 do
    str1 := str1 + 'Object ';

  str2:= string.Copy (str1);
  str1 := str2 + 'Pascal ' + str2.Substring (10, 30);
  Show(str1);

  // single replace
  nIndex := str1.IndexOf ('Pascal');
  str1 := str1.Substring(0, nIndex) + 'Object' +
    str1.Substring(nIndex + ('Pascal').Length);
  Show (str1);

  // multi-replace
  str1 := str1.Replace('O', 'o', [rfReplaceAll]);
  Show (str1);
end;

procedure TForm1.Show(const Msg: string);
begin
  Memo1.Lines.Add(Msg);
end;

end.
