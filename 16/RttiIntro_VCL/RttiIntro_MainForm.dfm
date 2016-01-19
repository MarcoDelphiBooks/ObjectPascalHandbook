object FormRttiIntro: TFormRttiIntro
  Left = 0
  Top = 0
  Caption = 'RttiIntro'
  ClientHeight = 379
  ClientWidth = 726
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -14
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 120
  TextHeight = 17
  object btnInfo: TButton
    Left = 9
    Top = 9
    Width = 99
    Height = 33
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Caption = 'btnInfo'
    TabOrder = 0
    OnClick = btnInfoClick
  end
  object Memo1: TMemo
    Left = 116
    Top = 10
    Width = 586
    Height = 359
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Lines.Strings = (
      'Memo1')
    TabOrder = 1
  end
  object btnChange: TButton
    Left = 10
    Top = 51
    Width = 99
    Height = 33
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Caption = 'btnChange'
    TabOrder = 2
    OnClick = btnChangeClick
  end
  object Edit1: TEdit
    Left = 8
    Top = 96
    Width = 101
    Height = 25
    TabOrder = 3
    Text = 'Caption'
  end
end
