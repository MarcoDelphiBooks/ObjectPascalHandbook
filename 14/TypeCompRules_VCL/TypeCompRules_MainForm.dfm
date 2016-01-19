object Form30: TForm30
  Left = 0
  Top = 0
  Caption = 'TypeCompRules'
  ClientHeight = 215
  ClientWidth = 604
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Button1: TButton
    Left = 40
    Top = 75
    Width = 75
    Height = 25
    Caption = 'arrays'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 40
    Top = 106
    Width = 75
    Height = 25
    Caption = 'generics'
    TabOrder = 1
    OnClick = Button2Click
  end
  object btnGlobal: TButton
    Left = 40
    Top = 168
    Width = 75
    Height = 25
    Caption = 'global'
    TabOrder = 2
    OnClick = btnGlobalClick
  end
  object Memo1: TMemo
    Left = 152
    Top = 24
    Width = 425
    Height = 169
    Lines.Strings = (
      'Memo1')
    TabOrder = 3
  end
  object btnOtherUnit: TButton
    Left = 40
    Top = 137
    Width = 75
    Height = 25
    Caption = 'btnOtherUnit'
    TabOrder = 4
    OnClick = btnOtherUnitClick
  end
  object Button3: TButton
    Left = 40
    Top = 24
    Width = 97
    Height = 25
    Caption = 'btnTypeCheck'
    TabOrder = 5
    OnClick = Button3Click
  end
end
