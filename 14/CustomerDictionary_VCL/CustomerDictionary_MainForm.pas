unit CustomerDictionary_MainForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, CustomerClasses, ComCtrls;

type
  TFormCustomerDictionary = class(TForm)
    btnPopulate: TButton;
    ListView1: TListView;
    procedure FormCreate(Sender: TObject);
    procedure btnPopulateClick(Sender: TObject);
    procedure ListView1SelectItem(Sender: TObject; Item: TListItem;
      Selected: Boolean);
  private
    CustDict: TCustomerDictionary;
  public
    { Public declarations }
  end;

var
  FormCustomerDictionary: TFormCustomerDictionary;

implementation

uses
  CustomerDataModule, strUtils;

{$R *.dfm}

procedure TFormCustomerDictionary.btnPopulateClick(Sender: TObject);
var
  custkey: TCustomerKey;
  listItem: TListItem;
begin
  DataModule1.ClientDataSet1.Active := True;
  CustDict.LoadFromDataSet(DataModule1.ClientDataSet1);

  for custkey in CustDict.Keys do
  begin
    listItem := ListView1.Items.Add;
    listItem.Caption := custkey.Company;
    listItem.SubItems.Add(FloatTOStr (custkey.CustNo));
    listItem.Data := custkey;
  end;
end;

procedure TFormCustomerDictionary.FormCreate(Sender: TObject);
begin
  CustDict := TCustomerDictionary.Create;
end;

procedure TFormCustomerDictionary.ListView1SelectItem(Sender: TObject;
  Item: TListItem; Selected: Boolean);
var
  aCustomer: TCustomer;
begin
  aCustomer := CustDict.Items [Item.data];
  Item.SubItems.Add(IfThen (aCustomer.State <> '',
    aCustomer.State + ', ' + aCustomer.Country, aCustomer.Country));
end;

end.
