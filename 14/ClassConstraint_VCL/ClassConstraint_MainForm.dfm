object Form30: TForm30
  Left = 0
  Top = 0
  Caption = 'ClassContraint'
  ClientHeight = 292
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
  object Memo1: TMemo
    Left = 104
    Top = 8
    Width = 433
    Height = 273
    TabOrder = 0
  end
  object create: TButton
    Left = 8
    Top = 8
    Width = 75
    Height = 25
    Caption = 'create'
    TabOrder = 1
    OnClick = createClick
  end
  object wrong: TButton
    Left = 8
    Top = 40
    Width = 75
    Height = 25
    Caption = 'wrong'
    TabOrder = 2
    OnClick = wrongClick
  end
  object Button1: TButton
    Left = 8
    Top = 72
    Width = 75
    Height = 25
    Caption = 'virtual'
    TabOrder = 3
    OnClick = Button1Click
  end
end
