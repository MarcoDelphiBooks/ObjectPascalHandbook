object FormIntercept: TFormIntercept
  Left = 0
  Top = 0
  Caption = 'InterceptBaseClass'
  ClientHeight = 616
  ClientWidth = 743
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -14
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  DesignSize = (
    743
    616)
  PixelsPerInch = 120
  TextHeight = 17
  object btnUse: TButton
    Left = 31
    Top = 31
    Width = 138
    Height = 33
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Caption = 'btnUse'
    TabOrder = 0
    OnClick = btnUseClick
  end
  object btnIntercept: TButton
    Left = 31
    Top = 78
    Width = 138
    Height = 33
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Caption = 'btnIntercept'
    TabOrder = 1
    OnClick = btnInterceptClick
  end
  object btnDisconnect: TButton
    Left = 31
    Top = 126
    Width = 138
    Height = 32
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Caption = 'btnDisconnect'
    TabOrder = 2
    OnClick = btnDisconnectClick
  end
  object Memo1: TMemo
    Left = 199
    Top = 31
    Width = 514
    Height = 535
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 3
  end
end
