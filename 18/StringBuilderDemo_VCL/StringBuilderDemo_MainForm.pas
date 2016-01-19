unit StringBuilderDemo_MainForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TForm2 = class(TForm)
    btnSBuilder: TButton;
    gbSize: TGroupBox;
    rbShort: TRadioButton;
    rbLong: TRadioButton;
    ListBox1: TListBox;
    btnString: TButton;
    procedure btnSBuilderClick(Sender: TObject);
    procedure btnStringClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

const
  maxCount = 1000000; // one million
  strSampleShort = 'This is a sample string';
  strSampleLong = 'This is a slightly longer sample string that should be causing some more trouble in .NET when copied over and over so many times in memory, if you use the String class instead of StringBuilder class';

type
  StringBuilder = TStringBuilder;

procedure TForm2.btnSBuilderClick(Sender: TObject);
var
  aTime: TDateTime;
  i, nPos: Integer;
  strB: StringBuilder;
begin
  aTime := Now;

  // actual code
  strB := StringBuilder.Create;
  if rbShort.Checked then
    strB.Append (strSampleShort)
  else
    strB.Append (strSampleLong);
  for I := 1 to maxCount do
  begin
    nPos := I mod strB.Length;
    strB.Remove(nPos, 1);
    strB.Insert(nPos, strB [(I*2) mod strB.Length]);
  end;
  ListBox1.Items.Add (strB.ToString);
  // end of actual code

  // added
  strB.Free;

  aTime := Now - aTime;
  ListBox1.Items.Add('btnSBuilderClick: ' + FormatDateTime ('ss.zzz', aTime));
end;

procedure TForm2.btnStringClick(Sender: TObject);
var
  aTime: TDateTime;
  i, nPos: Integer;
  str: string;
begin
  aTime := Now;

  // actual code
  if rbShort.Checked then
    str := strSampleShort
  else
    str := strSampleLong;

  for I := 1 to maxCount do
  begin
    nPos := I mod Length (str);
    Delete (str, nPos + 1, 1);
    Insert(str [(I*2) mod Length (str) + 1], str, nPos + 1);
  end;
  ListBox1.Items.Add (str);
  // end of actual code

  aTime := Now - aTime;
  ListBox1.Items.Add('btnStringClick: ' + FormatDateTime ('ss.zzz', aTime));
end;

end.
