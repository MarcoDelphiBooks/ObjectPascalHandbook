unit ClasshelpersForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm4 = class(TForm)
    Button1: TButton;
    ListBox1: TListBox;
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
  TMylistBox = class helper for TListBox
    function SelText: string;
  end;

  TMyInt = record helper for Integer
    function AsString: string;
  end;

procedure TForm4.Button1Click(Sender: TObject);
var
  n: Integer;
begin
  ShowMessage (ListBox1.SelText);
  n := 3;
  Caption := n.AsString;

  Caption := Integer (12).AsString;
end;

{ TMylistBox }

function TMylistBox.SelText: string;
begin
  Result := Items[ItemIndex];
end;

{ TMyInt }

function TMyInt.AsString: string;
begin
  Result := IntToStr (self);
end;

end.
