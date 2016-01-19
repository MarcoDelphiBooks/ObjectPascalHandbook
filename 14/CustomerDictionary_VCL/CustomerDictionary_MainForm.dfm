object FormCustomerDictionary: TFormCustomerDictionary
  Left = 0
  Top = 0
  Caption = 'CustomerDictionary'
  ClientHeight = 322
  ClientWidth = 604
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object btnPopulate: TButton
    Left = 16
    Top = 8
    Width = 75
    Height = 25
    Caption = 'btnPopulate'
    TabOrder = 0
    OnClick = btnPopulateClick
  end
  object ListView1: TListView
    Left = 16
    Top = 39
    Width = 569
    Height = 266
    Columns = <
      item
        AutoSize = True
        Caption = 'Name'
      end
      item
        AutoSize = True
        Caption = 'ID'
      end
      item
        AutoSize = True
        Caption = 'Country'
      end>
    TabOrder = 1
    ViewStyle = vsReport
    OnSelectItem = ListView1SelectItem
  end
end
