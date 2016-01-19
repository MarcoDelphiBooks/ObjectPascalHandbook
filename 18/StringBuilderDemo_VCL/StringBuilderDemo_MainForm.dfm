object Form2: TForm2
  Left = 0
  Top = 0
  Caption = 'Form2'
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
  object btnSBuilder: TButton
    Left = 16
    Top = 111
    Width = 105
    Height = 25
    Caption = 'btnSBuilder'
    TabOrder = 0
    OnClick = btnSBuilderClick
  end
  object gbSize: TGroupBox
    Left = 16
    Top = 8
    Width = 105
    Height = 89
    Caption = 'Size'
    TabOrder = 1
    object rbShort: TRadioButton
      Left = 16
      Top = 24
      Width = 57
      Height = 17
      Caption = 'rbShort'
      Checked = True
      TabOrder = 0
      TabStop = True
    end
    object rbLong: TRadioButton
      Left = 16
      Top = 48
      Width = 57
      Height = 17
      Caption = 'rbLong'
      TabOrder = 1
    end
  end
  object ListBox1: TListBox
    Left = 136
    Top = 16
    Width = 410
    Height = 268
    ItemHeight = 13
    TabOrder = 2
  end
  object btnString: TButton
    Left = 16
    Top = 142
    Width = 105
    Height = 25
    Caption = 'btnString'
    TabOrder = 3
    OnClick = btnStringClick
  end
end
