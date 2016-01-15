unit ShowUnicodeForm;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, System.Rtti,
  FMX.ListView.Types, FMX.ListView, FMX.TabControl, FMX.Grid, FMX.Layouts,
  FMX.StdCtrls, FMX.ListView.Appearances, FMX.ListView.Adapters.Base,
  FMX.Controls.Presentation;

type
  TForm2 = class(TForm)
    ToolBar1: TToolBar;
    StatusBar1: TStatusBar;
    StringGrid1: TStringGrid;
    StringColumn1: TStringColumn;
    StringColumn2: TStringColumn;
    StringColumn3: TStringColumn;
    StringColumn4: TStringColumn;
    StringColumn5: TStringColumn;
    StringColumn6: TStringColumn;
    StringColumn7: TStringColumn;
    StringColumn8: TStringColumn;
    StringColumn9: TStringColumn;
    StringColumn10: TStringColumn;
    StringColumn11: TStringColumn;
    StringColumn12: TStringColumn;
    StringColumn13: TStringColumn;
    StringColumn14: TStringColumn;
    StringColumn15: TStringColumn;
    StringColumn16: TStringColumn;
    TabControl1: TTabControl;
    TabItem1: TTabItem;
    TabItem2: TTabItem;
    ListView1: TListView;
    BackBtn: TSpeedButton;
    Label1: TLabel;
    Label2: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure ListView1ItemClick(const Sender: TObject;
      const AItem: TListViewItem);
    procedure BackBtnClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.fmx}

uses
  StrUtils, Character;

// helper function
function GetCharDescr (nChar: Integer): string;
begin
  if Char(nChar).IsControl then
    Result := 'Char #' + IntToStr (nChar) + ' [  ]'
  else
    Result := 'Char #' + IntToStr (nChar) + ' [' + Char (nChar) + ']';
end;

procedure TForm2.FormCreate(Sender: TObject);
var
  I: Integer;
  ListItem: TListViewItem;
begin
  for I := 0 to 255 do // (256 pages) * 256 characters each
  begin
    ListItem := ListView1.Items.Add;
    ListItem.Tag := I;
    if (I < 216) or (I > 223) then
      ListItem.Text :=
        GetCharDescr(I*256) + '/' + GetCharDescr(I*256+255)
    else
      ListItem.Text := 'Surrogate Code Points';
  end;
end;

procedure TForm2.ListView1ItemClick(const Sender: TObject;
  const AItem: TListViewItem);
var
  I, nStart: Integer;
begin
  nStart := AItem.Tag  * 256;
  for I := 0 to 255 do
  begin
    StringGrid1.Cells [I mod 16, I div 16] :=
      IfThen (not Char(I + nStart).IsControl, Char (I + nStart), '');
  end;
  TabControl1.ActiveTab := TabItem2;
  BackBtn.Visible := True;
  Label1.Text := AItem.Text;
end;

procedure TForm2.BackBtnClick(Sender: TObject);
begin
  TabControl1.ActiveTab := TabItem1;
  BackBtn.Visible := False;
  Label1.Text := 'Unicode';
end;

end.
