object FormSmartPointers: TFormSmartPointers
  Left = 0
  Top = 0
  Caption = 'SmartPointers'
  ClientHeight = 361
  ClientWidth = 525
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object btnLeak: TButton
    Left = 72
    Top = 30
    Width = 113
    Height = 25
    Caption = 'btnLeak'
    TabOrder = 0
    OnClick = btnLeakClick
  end
  object btnSmart: TButton
    Left = 72
    Top = 72
    Width = 113
    Height = 25
    Caption = 'btnSmart'
    TabOrder = 1
    OnClick = btnSmartClick
  end
  object btnSmartShort: TButton
    Left = 72
    Top = 112
    Width = 113
    Height = 25
    Caption = 'btnSmartShort'
    TabOrder = 2
    OnClick = btnSmartShortClick
  end
  object btnImplicitCreate: TButton
    Left = 72
    Top = 152
    Width = 113
    Height = 25
    Caption = 'btnImplicitCreate'
    TabOrder = 3
    OnClick = btnImplicitCreateClick
  end
  object Memo1: TMemo
    Left = 232
    Top = 32
    Width = 249
    Height = 289
    TabOrder = 4
  end
end
