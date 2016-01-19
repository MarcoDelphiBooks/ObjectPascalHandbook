object FormAdapter: TFormAdapter
  Left = 205
  Top = 118
  Caption = 'AdapterDemo'
  ClientHeight = 333
  ClientWidth = 591
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object ILabel1: TLabel
    Left = 184
    Top = 64
    Width = 35
    Height = 13
    Caption = 'ILabel1'
  end
  object Label1: TLabel
    Left = 184
    Top = 32
    Width = 32
    Height = 13
    Caption = 'Label1'
  end
  object Label2: TLabel
    Left = 192
    Top = 200
    Width = 32
    Height = 13
    Caption = 'Label2'
  end
  object Label3: TLabel
    Left = 248
    Top = 200
    Width = 32
    Height = 13
    Caption = 'Label3'
  end
  object Label4: TLabel
    Left = 312
    Top = 200
    Width = 32
    Height = 13
    Caption = 'Label4'
  end
  object Button1: TButton
    Left = 24
    Top = 32
    Width = 75
    Height = 25
    Caption = 'all to 50'
    TabOrder = 0
    OnClick = Button1Click
  end
  object IEdit1: TEdit
    Left = 184
    Top = 96
    Width = 121
    Height = 21
    TabOrder = 1
    Text = 'IEdit1'
  end
  object IProgressBar1: TProgressBar
    Left = 184
    Top = 144
    Width = 150
    Height = 16
    TabOrder = 2
  end
  object Button2: TButton
    Left = 24
    Top = 80
    Width = 75
    Height = 25
    Caption = 'class names'
    TabOrder = 3
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 24
    Top = 120
    Width = 75
    Height = 25
    Caption = 'change edit'
    TabOrder = 4
    OnClick = Button3Click
  end
  object Edit1: TEdit
    Left = 360
    Top = 64
    Width = 121
    Height = 21
    TabOrder = 5
    Text = 'Edit1'
  end
end
