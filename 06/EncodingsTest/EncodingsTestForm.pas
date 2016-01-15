unit EncodingsTestForm;

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
  Utf8string: TBytes;
  Utf16string: string;
  UniBytes: TBytes;
  AByte: Byte;
begin
  // process Utf8data
  SetLength (Utf8string, 3);
  Utf8string[0] := Ord ('a'); // single byte ANSI char < 128
  Utf8string[1] := $c9; // double byte reversed latin a
  Utf8string[2] := $90;

  Utf16string := TEncoding.UTF8.GetString(Utf8string);
  Show ('Unicode: ' + Utf16string);

  Show ('Utf8 bytes:');
  for AByte in Utf8String do
    Show (AByte.ToString);

  Show ('Utf16 bytes:');
  UniBytes := TEncoding.Unicode.GetBytes (Utf16string);
  for AByte in UniBytes do
    Show (AByte.ToString);

  // error: cannot use char > 128
  Utf8string[0] := Ord ('à');
  Utf16string := TEncoding.UTF8.GetString(Utf8string);
  Show ('Wrong high ANSI: ' + Utf16string);
  // try different conversion
  Utf16string := TEncoding.ANSI.GetString(Utf8string);
  Show ('Wrong double byte: ' + Utf16string);
end;

procedure TForm1.Button2Click(Sender: TObject);
var
  Utf8string: TBytes;
  Utf16string: string;
  I: Integer;
begin
  Utf16string := 'This is my nice string with à and Æ';
  Show ('Initial: ' + Utf16string);

  Utf8string := TEncoding.UTF8.GetBytes(Utf16string);
  for I := 0 to High(Utf8string) do
    if Utf8string[I] = Ord('i') then
      Utf8string[I] := Ord('I');
  Utf16string := TEncoding.UTF8.GetString(Utf8string);
  Show ('Final: ' + Utf16string);
end;

procedure TForm1.Show(const Msg: string);
begin
  Memo1.Lines.Add(Msg);
end;

end.
