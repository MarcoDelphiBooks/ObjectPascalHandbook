unit LargeStringForm;

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

uses
  Diagnostics;

const
  MaxLoop = 2000000; // two million

function TimeCode (nLoops: Integer; proc: TProc): string;
var
  t1: TStopwatch;
  I: Integer;
begin
  t1 := TStopwatch.StartNew;
  for I := 1 to nLoops do
    proc;
  t1.Stop;
  Result := t1.ElapsedMilliseconds.toString;
end;

procedure TForm1.Button1Click(Sender: TObject);
var
  str1, str2: string;
begin
  str1 := 'Marco ';
  str2 := 'Cantu ';
  Show ('Concatenation: ' +
    TimeCode (MaxLoop,
      procedure ()
      begin
        str1 := str1 + str2;
      end));
  Show('Length: ' + str1.Length.ToString);
end;

procedure TForm1.Button2Click(Sender: TObject);
var
  str1, str2: string;
  sBuilder: TStringBuilder;
begin
  str1 := 'Marco ';
  str2 := 'Cantu ';
  sBuilder := TStringBuilder.Create (str1);
  try
    Show ('StringBuilder: ' +
      TimeCode (MaxLoop,
        procedure ()
        begin
          sBuilder.Append(str2);
        end));
    str1 := sBuilder.ToString;
  finally
    sBuilder.Free;
  end;
  Show('Length: ' + IntToStr (str1.Length));
end;

procedure TForm1.Show(const Msg: string);
begin
  Memo1.Lines.Add(Msg);
end;

end.
