object FormDescrAttr: TFormDescrAttr
  Left = 0
  Top = 0
  Caption = 'DescriptionAttributes'
  ClientHeight = 201
  ClientWidth = 578
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
  object ListView1: TListView
    Left = 24
    Top = 16
    Width = 537
    Height = 169
    Columns = <
      item
        Caption = 'ID'
        Width = 150
      end
      item
        AutoSize = True
        Caption = 'Description'
      end>
    TabOrder = 0
    ViewStyle = vsReport
  end
end
