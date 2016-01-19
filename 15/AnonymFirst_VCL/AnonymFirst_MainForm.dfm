object FormAnonymFirst: TFormAnonymFirst
  Left = 0
  Top = 0
  Caption = 'AnonymFirst'
  ClientHeight = 310
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
  object btnSimpleVar: TButton
    Left = 8
    Top = 8
    Width = 114
    Height = 25
    Caption = 'btnSimpleVar'
    TabOrder = 0
    OnClick = btnSimpleVarClick
  end
  object Memo1: TMemo
    Left = 136
    Top = 8
    Width = 409
    Height = 273
    TabOrder = 1
  end
  object btnProcParam: TButton
    Left = 8
    Top = 40
    Width = 114
    Height = 25
    Caption = 'btnProcParam'
    TabOrder = 2
    OnClick = btnProcParamClick
  end
  object btnLocalVal: TButton
    Left = 8
    Top = 72
    Width = 114
    Height = 25
    Caption = 'btnLocalVal'
    TabOrder = 3
    OnClick = btnLocalValClick
  end
  object btnStore: TButton
    Left = 8
    Top = 120
    Width = 114
    Height = 25
    Caption = 'btnStore'
    TabOrder = 4
    OnClick = btnStoreClick
  end
  object btnCall: TButton
    Left = 8
    Top = 152
    Width = 114
    Height = 25
    Caption = 'btnCall'
    TabOrder = 5
    OnClick = btnCallClick
  end
  object btnNoParen: TButton
    Left = 8
    Top = 184
    Width = 114
    Height = 25
    Caption = 'btnNoParen'
    TabOrder = 6
  end
  object btReturn: TButton
    Left = 8
    Top = 248
    Width = 114
    Height = 25
    Caption = 'btReturn'
    TabOrder = 7
    OnClick = btReturnClick
  end
end
