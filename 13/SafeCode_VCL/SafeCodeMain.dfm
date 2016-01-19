object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'SafeCode'
  ClientHeight = 275
  ClientWidth = 549
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object btnConstructor: TButton
    Left = 24
    Top = 32
    Width = 153
    Height = 25
    Caption = 'Constructor Failure'
    TabOrder = 0
    OnClick = btnConstructorClick
  end
  object btnMixed: TButton
    Left = 24
    Top = 72
    Width = 153
    Height = 25
    Caption = 'Mixed Interfaces'
    TabOrder = 1
    OnClick = btnMixedClick
  end
  object btnRelease: TButton
    Left = 24
    Top = 112
    Width = 153
    Height = 25
    Caption = 'Extra Release'
    TabOrder = 2
    OnClick = btnReleaseClick
  end
  object btnCast: TButton
    Left = 24
    Top = 152
    Width = 153
    Height = 25
    Caption = 'Unsafe Cast'
    TabOrder = 3
    OnClick = btnCastClick
  end
  object btnTryF: TButton
    Left = 248
    Top = 32
    Width = 137
    Height = 25
    Caption = 'try-finally'
    TabOrder = 4
    OnClick = btnTryFClick
  end
end
