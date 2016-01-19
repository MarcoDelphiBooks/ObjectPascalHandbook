object FormReaderWriter: TFormReaderWriter
  Left = 0
  Top = 0
  Caption = 'ReaderWriter'
  ClientHeight = 376
  ClientWidth = 577
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 32
    Top = 16
    Width = 39
    Height = 13
    Caption = 'Streams'
  end
  object Label2: TLabel
    Left = 200
    Top = 16
    Width = 33
    Height = 13
    Caption = 'Strings'
  end
  object Label3: TLabel
    Left = 360
    Top = 21
    Width = 19
    Height = 13
    Caption = 'XML'
  end
  object btnWrite: TButton
    Left = 32
    Top = 40
    Width = 129
    Height = 25
    Caption = 'btnWrite'
    TabOrder = 0
    OnClick = btnWriteClick
  end
  object btnRead: TButton
    Left = 32
    Top = 80
    Width = 129
    Height = 25
    Caption = 'btnRead'
    TabOrder = 1
    OnClick = btnReadClick
  end
  object btnWriteAndRead: TButton
    Left = 200
    Top = 40
    Width = 121
    Height = 25
    Caption = 'btnWriteAndRead'
    TabOrder = 2
    OnClick = btnWriteAndReadClick
  end
  object Memo1: TMemo
    Left = 32
    Top = 128
    Width = 441
    Height = 217
    TabOrder = 3
  end
  object btnXmlCorrect: TButton
    Left = 360
    Top = 40
    Width = 113
    Height = 25
    Caption = 'btnXmlCorrect'
    TabOrder = 4
    OnClick = btnXmlCorrectClick
  end
  object btnXmlUnbalanced: TButton
    Left = 360
    Top = 80
    Width = 113
    Height = 25
    Caption = 'btnXmlUnbalanced'
    TabOrder = 5
    OnClick = btnXmlUnbalancedClick
  end
  object btnClassic: TButton
    Left = 479
    Top = 126
    Width = 90
    Height = 25
    Caption = 'btnClassic'
    TabOrder = 6
    OnClick = btnClassicClick
  end
end
