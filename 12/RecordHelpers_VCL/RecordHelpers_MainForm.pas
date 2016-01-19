unit RecordHelpers_MainForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm4 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form4: TForm4;

implementation

{$R *.dfm}

type
  TIntHelper = record helper for Integer
    function ToString: string;
  end;

  TByteHelper = record helper for Byte
    function ToString: string;
  end;


procedure TForm4.Button1Click(Sender: TObject);
var
  s1: string;
begin
  // with a variable
  s1 := 'Hello';
  if s1.Contains('ll') then
    ShowMessage (s1.Substring(1));

  // with a constant
  Left := 'Hello'.Length;

  // chaining
  Caption := ClassName.Length.ToString;
end;

procedure TForm4.Button2Click(Sender: TObject);
begin
  // Caption := 4.ToString;
  Caption := Integer(4).ToString;
  Caption := 400000.ToString;
end;

{ TIntHelper }

function TIntHelper.ToString: string;
begin
  Result := IntToStr (self);
end;

{ TShortHelper }

function TByteHelper.ToString: string;
begin
  Result := IntToStr (self);
end;

end.
