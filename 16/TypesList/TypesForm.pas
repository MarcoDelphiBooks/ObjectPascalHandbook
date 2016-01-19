unit TypesForm;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Layouts, FMX.Memo, FMX.ListBox, FMX.ListView.Types, FMX.ListView,
  FMX.ListView.Appearances, FMX.ListView.Adapters.Base,
  FMX.Controls.Presentation;

type
  TForm1 = class(TForm)
    btnTypesList: TButton;
    ListView1: TListView;
    procedure btnTypesListClick(Sender: TObject);
    procedure ListView1ItemClick(const Sender: TObject;
      const AItem: TListViewItem);
  private
    { Private declarations }
  public
  end;

var
  Form1: TForm1;



implementation

{$R *.fmx}

uses
  System.Rtti, TypeInfoForm;

procedure TForm1.btnTypesListClick(Sender: TObject);
var
  aContext: TRttiContext;
  theTypes: TArray<TRttiType>;
  sList: TStringList;
  aType: TRttiType;
  sTypeName: string;
begin
  ListView1.Items.Clear;
  sList := TStringList.Create;
  try
    theTypes := aContext.GetTypes;
    for aType in theTypes do
      if aType.IsInstance then
        sList.Add(aType.QualifiedName);
    sList.Sort;
    ListView1.BeginUpdate;
    try
      for sTypeName in sList do
        (ListView1.Items.Add).Text := sTypeName;
    finally
      ListView1.EndUpdate;
    end;
  finally
    sList.Free;
  end;
end;

procedure TForm1.ListView1ItemClick(const Sender: TObject;
  const AItem: TListViewItem);
begin
  FormTypeInfo.Clear;
  FormTypeInfo.ShowTypeDetails(AItem.Text);
  FormTypeInfo.Show;
end;

end.
