object Form2: TForm2
  Left = 0
  Top = 0
  Caption = 'KeyValue'
  ClientHeight = 273
  ClientWidth = 393
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Button1: TButton
    Left = 32
    Top = 32
    Width = 113
    Height = 25
    Caption = 'Set KeyValue'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 32
    Top = 64
    Width = 113
    Height = 25
    Caption = 'Change Value'
    TabOrder = 1
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 32
    Top = 96
    Width = 113
    Height = 25
    Caption = 'Get KeyValue'
    TabOrder = 2
    OnClick = Button3Click
  end
end
