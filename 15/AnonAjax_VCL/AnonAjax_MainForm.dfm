object FormAnonAjax: TFormAnonAjax
  Left = 0
  Top = 0
  Caption = 'AnonAjax'
  ClientHeight = 379
  ClientWidth = 548
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Image1: TImage
    Left = 113
    Top = 250
    Width = 417
    Height = 121
  end
  object btnRead: TButton
    Left = 32
    Top = 24
    Width = 75
    Height = 25
    Caption = 'btnRead'
    TabOrder = 0
    OnClick = btnReadClick
  end
  object Memo1: TMemo
    Left = 113
    Top = 53
    Width = 417
    Height = 190
    TabOrder = 1
  end
  object edUrl: TEdit
    Left = 113
    Top = 26
    Width = 417
    Height = 21
    TabOrder = 2
    Text = 'http://blog.marcocantu.com'
  end
  object btnLinks: TButton
    Left = 32
    Top = 55
    Width = 75
    Height = 25
    Caption = 'btnLinks'
    TabOrder = 3
    OnClick = btnLinksClick
  end
  object btnImages: TButton
    Left = 32
    Top = 88
    Width = 75
    Height = 25
    Caption = 'btnImages'
    TabOrder = 4
    OnClick = btnImagesClick
  end
end
