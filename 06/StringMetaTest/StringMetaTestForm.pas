unit StringMetaTestForm;

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
    procedure FormCreate(Sender: TObject);
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

{$ZEROBASEDSTRINGS ON}

var
  MyStr1, MyStr2: string;

procedure TForm1.Button1Click(Sender: TObject);
var
  str1: string;
begin
  str1 := 'F' + string.Create ('o', 2);

  Show ('SizeOf: ' + SizeOf (str1).ToString);
  Show ('Length: ' + str1.Length.ToString);
  Show ('StringElementSize: ' +
    StringElementSize (str1).ToString);
  Show ('StringRefCount: ' +
    StringRefCount (str1).ToString);
  Show ('StringCodePage: ' +
    StringCodePage (str1).ToString);
  if StringCodePage (str1) = DefaultUnicodeCodePage then
    Show ('Is Unicode');
  Show ('Size in bytes: ' +
    (Length (str1) * StringElementSize (str1)).ToString);
  Show ('ByteLength: ' +
    ByteLength (str1).ToString);
end;

function StringStatus (const Str: string): string;
begin
  Result := 'Addr: ' +
    IntToStr (Integer (Str)) +
    ', Len: ' +
    IntToStr (Length (Str)) +
    ', Ref: ' +
    IntToStr (PInteger (Integer (Str) - 8)^) +
    ', Val: ' + Str;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  Show ('MyStr1 - ' + StringStatus (MyStr1));
  Show ('MyStr2 - ' + StringStatus (MyStr2));
  MyStr1 [1] := 'a';
  Show ('Change 2nd char');
  Show ('MyStr1 - ' + StringStatus (MyStr1));
  Show ('MyStr2 - ' + StringStatus (MyStr2));
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  MyStr1 := string.Create(['H', 'e', 'l', 'l', 'o']);
  MyStr2 := MyStr1;
end;

procedure TForm1.Show(const Msg: string);
begin
  Memo1.Lines.Add(Msg);
end;

end.
