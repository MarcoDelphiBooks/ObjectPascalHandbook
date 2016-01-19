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
    ListBox1: TListBox;
    Memo1: TMemo;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
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
  TListBoxHelper = class helper for TListBox
    function ItemIndexValue: string;
  end;

  TMemoHelper = class helper for TMemo
    procedure Add (const Text: string); virtual;
  end;

  TMyMemo = class (TMemo)
    procedure Add (const Text: string); override;
  end;

function TListBoxHelper.ItemIndexValue: string;
begin
  Result := '';
  if ItemIndex >= 0 then
    Result := Items [ItemIndex];
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  if ListBox1.ItemIndex > 0 then
    Show (ListBox1.Items[ListBox1.ItemIndex]);
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  Show (ListBox1.ItemIndexValue);
end;

procedure TForm1.Show(const Text: string);
begin
  Memo1.Add (Text);
end;

{ TMemoHelper }

procedure TMemoHelper.Add(const Text: string);
begin
  Lines.Add(Text);
end;

{ TMyMemo }

procedure TMyMemo.Add(const Text: string);
begin
  Add (Text + ' ' + TimeToStr (Now));
end;

end.
