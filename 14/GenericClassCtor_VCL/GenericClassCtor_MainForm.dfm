object FormGenericClassCtor: TFormGenericClassCtor
  Left = 0
  Top = 0
  Caption = 'GenericClassCtor'
  ClientHeight = 290
  ClientWidth = 554
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object btnInt: TButton
    Left = 24
    Top = 16
    Width = 75
    Height = 25
    Caption = 'btnInt'
    TabOrder = 0
    OnClick = btnIntClick
  end
  object Memo1: TMemo
    Left = 120
    Top = 18
    Width = 417
    Height = 247
    TabOrder = 1
  end
  object btnString: TButton
    Left = 24
    Top = 48
    Width = 75
    Height = 25
    Caption = 'btnString'
    TabOrder = 2
    OnClick = btnStringClick
  end
  object btnSequence: TButton
    Left = 24
    Top = 232
    Width = 75
    Height = 25
    Caption = 'btnSequence'
    TabOrder = 3
    OnClick = btnSequenceClick
  end
end
