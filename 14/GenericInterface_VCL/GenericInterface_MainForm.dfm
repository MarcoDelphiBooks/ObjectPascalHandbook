object FormGenericInterface: TFormGenericInterface
  Left = 0
  Top = 0
  Caption = 'GenericInterface'
  ClientHeight = 292
  ClientWidth = 570
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object btnValue: TButton
    Left = 16
    Top = 8
    Width = 97
    Height = 25
    Caption = 'btnValue'
    TabOrder = 0
    OnClick = btnValueClick
  end
  object Memo1: TMemo
    Left = 128
    Top = 8
    Width = 241
    Height = 276
    TabOrder = 1
  end
  object btnValueButton: TButton
    Left = 16
    Top = 104
    Width = 97
    Height = 25
    Caption = 'btnValueButton'
    TabOrder = 2
    OnClick = btnValueButtonClick
  end
  object btnIValue: TButton
    Left = 16
    Top = 40
    Width = 97
    Height = 25
    Caption = 'btnIValue'
    TabOrder = 3
    OnClick = btnIValueClick
  end
  object ScrollBox1: TScrollBox
    Left = 376
    Top = 8
    Width = 185
    Height = 276
    TabOrder = 4
  end
end
