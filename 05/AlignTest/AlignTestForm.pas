unit AlignTestForm;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Layouts, FMX.Memo, FMX.Controls.Presentation, FMX.ScrollBox;

type
  TForm1 = class(TForm)
    Memo1: TMemo;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    procedure Show (const msg: string);
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

{$ALIGN 16}
type
  TMyRecord16 = record
    c: AnsiChar;
    w: Word;
    b: Boolean;
    I: Integer;
    d: Double;
  end;

{$ALIGN 4}
type
  TMyRecord4 = record
    c: AnsiChar;
    w: Word;
    b: Boolean;
    I: Integer;
    d: Double;
  end;

{$ALIGN 1}
type
  TMyRecord1 = record
    c: AnsiChar;
    w: Word;
    b: Boolean;
    I: Integer;
    d: Double;
  end;

procedure TForm1.Button1Click(Sender: TObject);
var
  MyRec1: TMyRecord1;
  MyRec4: TMyRecord4;
  MyRec16: TMyRecord16;
begin
  Show ('ALIGN 1 -- sizeof: ' + IntToStr (sizeof(TMyRecord1)));
  Show ('c: ' + IntToStr (Integer(@MyRec1.c) - Integer(@MyRec1)) +
    ' w: ' + IntToStr (Integer(@MyRec1.w) - Integer(@MyRec1)) +
    ' b: ' + IntToStr (Integer(@MyRec1.b) - Integer(@MyRec1)) +
    ' i: ' + IntToStr (Integer(@MyRec1.i) - Integer(@MyRec1)) +
    ' d: ' + IntToStr (Integer(@MyRec1.d) - Integer(@MyRec1)));

  Show ('ALIGN 4 -- sizeof: ' + IntToStr (sizeof(TMyRecord4)));
  Show ('c: ' + IntToStr (Integer(@MyRec4.c) - Integer(@MyRec4)) +
    ' w: ' + IntToStr (Integer(@MyRec4.w) - Integer(@MyRec4)) +
    ' b: ' + IntToStr (Integer(@MyRec4.b) - Integer(@MyRec4)) +
    ' i: ' + IntToStr (Integer(@MyRec4.i) - Integer(@MyRec4)) +
    ' d: ' + IntToStr (Integer(@MyRec4.d) - Integer(@MyRec4)));

  Show ('ALIGN 16 -- sizeof: ' + IntToStr (sizeof(TMyRecord16)));
  Show ('c: ' + IntToStr (Integer(@MyRec16.c) - Integer(@MyRec16)) +
    ' w: ' + IntToStr (Integer(@MyRec16.w) - Integer(@MyRec16)) +
    ' b: ' + IntToStr (Integer(@MyRec16.b) - Integer(@MyRec16)) +
    ' i: ' + IntToStr (Integer(@MyRec16.i) - Integer(@MyRec16)) +
    ' d: ' + IntToStr (Integer(@MyRec16.d) - Integer(@MyRec16)));
end;

procedure TForm1.Show(const msg: string);
begin
  Memo1.Lines.Add(msg);
end;

end.
