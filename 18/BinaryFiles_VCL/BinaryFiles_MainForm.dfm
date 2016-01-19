object FormBinary: TFormBinary
  Left = 0
  Top = 0
  Caption = 'BinaryFiles'
  ClientHeight = 390
  ClientWidth = 663
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
  object btnWrite: TButton
    Left = 16
    Top = 24
    Width = 201
    Height = 25
    Caption = 'Write Binary'
    TabOrder = 0
    OnClick = btnWriteClick
  end
  object btnRead: TButton
    Left = 16
    Top = 64
    Width = 201
    Height = 25
    Caption = 'Read Binary'
    TabOrder = 1
    OnClick = btnReadClick
  end
  object Memo1: TMemo
    Left = 232
    Top = 24
    Width = 417
    Height = 353
    TabOrder = 2
  end
  object btnWriteRecord: TButton
    Left = 16
    Top = 120
    Width = 201
    Height = 25
    Caption = 'Write Record'
    TabOrder = 3
    OnClick = btnWriteRecordClick
  end
  object btnReadRecord: TButton
    Left = 16
    Top = 159
    Width = 201
    Height = 25
    Caption = 'Read Record'
    TabOrder = 4
    OnClick = btnReadRecordClick
  end
end
