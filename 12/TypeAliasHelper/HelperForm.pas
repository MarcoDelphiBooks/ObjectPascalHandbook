unit HelperForm;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Layouts, FMX.Memo, FMX.ListBox;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Memo1: TMemo;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    procedure Show (const Text: string);
  end;

var
  Form1: TForm1;



implementation

{$R *.fmx}

type
  MyInt = type Integer;

  TMyIntHelper = record helper for MyInt
    function AsString: string;
  end;

procedure TForm1.Button1Click(Sender: TObject);
var
  mi: MyInt;
begin
  mi := 10;
  Show (mi.asString);
  //Show (mi.toString);
  Show (Integer(mi).ToString)
end;

procedure TForm1.Show(const Text: string);
begin
  Memo1.Lines.Add (Text);
end;

{ TMyIntHelper }

function TMyIntHelper.AsString: string;
begin
  Result := IntToStr (self);
end;

end.
