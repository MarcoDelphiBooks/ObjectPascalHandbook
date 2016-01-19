object Form39: TForm39
  Left = 0
  Top = 0
  Caption = 'ObjFromIntf'
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
  object btnSimpleTest: TButton
    Left = 56
    Top = 48
    Width = 185
    Height = 25
    Caption = 'btnSimpleTest'
    TabOrder = 0
    OnClick = btnSimpleTestClick
  end
  object btnRefCountIssue: TButton
    Left = 56
    Top = 88
    Width = 185
    Height = 25
    Caption = 'btnRefCountIssue'
    TabOrder = 1
    OnClick = btnRefCountIssueClick
  end
end
