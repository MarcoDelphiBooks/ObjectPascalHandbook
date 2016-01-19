object FormLeakTest: TFormLeakTest
  Left = 0
  Top = 0
  Caption = 'LeakTest'
  ClientHeight = 141
  ClientWidth = 274
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Button1: TButton
    Left = 48
    Top = 32
    Width = 177
    Height = 25
    Caption = 'GetMem'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 48
    Top = 72
    Width = 177
    Height = 25
    Caption = 'Create TButton'
    TabOrder = 1
    OnClick = Button2Click
  end
end
