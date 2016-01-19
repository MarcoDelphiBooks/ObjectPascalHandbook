object Form30: TForm30
  Left = 0
  Top = 0
  Caption = 'GenericTypeFunc'
  ClientHeight = 315
  ClientWidth = 537
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object btnShowInfo: TButton
    Left = 8
    Top = 8
    Width = 97
    Height = 25
    Caption = 'btnShowInfo'
    TabOrder = 0
    OnClick = btnShowInfoClick
  end
  object Memo1: TMemo
    Left = 111
    Top = 8
    Width = 418
    Height = 299
    TabOrder = 1
  end
  object btnExperiments: TButton
    Left = 8
    Top = 39
    Width = 97
    Height = 25
    Caption = 'btnExperiments'
    TabOrder = 2
    OnClick = btnExperimentsClick
  end
end
