unit TypeInfoForm;

interface

uses
  System.SysUtils, System.RTTI, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.ListView.Types, FMX.ListView, FMX.TabControl, FMX.StdCtrls;

type
  TFormTypeInfo = class(TForm)
    TabControl1: TTabControl;
    TabItem1: TTabItem;
    TabItem2: TTabItem;
    TabItem3: TTabItem;
    LVProperties: TListView;
    LVMethods: TListView;
    LVFields: TListView;
    ToolBar1: TToolBar;
    SpeedButton1: TSpeedButton;
    LabelType: TLabel;
  private
    { Private declarations }
  public
    procedure Clear;
    procedure ShowTypeDetails (typename: string);
  end;

var
  FormTypeInfo: TFormTypeInfo;

implementation

{$R *.fmx}

uses
  System.TypInfo;

{ TFormTypeInfo }

procedure TFormTypeInfo.Clear;
begin
  LVProperties.Items.Clear;
  LVMethods.Items.Clear;
  LVFields.Items.Clear;
end;

function VisibilityToken (mv: TMemberVisibility): string;
begin
  case mv of
    mvPrivate: Result := '[pri]';
    mvProtected: Result := '[pro]';
    mvPublic: Result := '[pub]';
    mvPublished: Result := '[pbl]';
  else
    Result := '[und]';
  end;
end;

procedure TFormTypeInfo.ShowTypeDetails(typename: string);
var
  aContext: TRttiContext;
  aType: TRttiType;
  aProperty: TRttiProperty;
  aMethod: TRttiMethod;
  aField: TRttiField;
begin
  aType := aContext.FindType(typename);
  if not Assigned(aType) then
    Exit;

  LabelType.Text := aType.QualifiedName;
  for aProperty in atype.GetProperties do
    FormTypeInfo.LVProperties.Items.Add.Text := aProperty.Name +
      ': ' + aProperty.PropertyType.Name + ' ' +
      VisibilityToken (aProperty.Visibility);
  for aMethod in atype.GetMethods do
    LVMethods.Items.Add.Text := aMethod.Name + ' ' +
      VisibilityToken (aMethod.Visibility);
  for aField in aType.GetFields do
    LVFields.Items.Add.Text := aField.Name + ': ' +
      aField.FieldType.Name + ' ' +
      VisibilityToken (aField.Visibility);

end;

end.
