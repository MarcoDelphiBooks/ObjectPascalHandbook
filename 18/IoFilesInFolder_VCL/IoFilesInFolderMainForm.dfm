object FormIoFiles: TFormIoFiles
  Left = 0
  Top = 0
  Caption = 'IoFilesInFolder'
  ClientHeight = 373
  ClientWidth = 620
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
  object lblFileInfo: TLabel
    Left = 208
    Top = 296
    Width = 46
    Height = 13
    Caption = 'lblFileInfo'
  end
  object btnSubfolders: TButton
    Left = 32
    Top = 88
    Width = 153
    Height = 25
    Caption = 'btnSubfolders'
    TabOrder = 0
    OnClick = btnSubfoldersClick
  end
  object edBaseFolder: TEdit
    Left = 32
    Top = 40
    Width = 153
    Height = 21
    TabOrder = 1
  end
  object btnPasFiles: TButton
    Left = 32
    Top = 128
    Width = 153
    Height = 25
    Caption = 'btnPasFiles'
    TabOrder = 2
    OnClick = btnPasFilesClick
  end
  object ListBox1: TListBox
    Left = 208
    Top = 40
    Width = 393
    Height = 241
    ItemHeight = 13
    TabOrder = 3
    OnClick = ListBox1Click
  end
  object btnFilterFolders: TButton
    Left = 32
    Top = 168
    Width = 153
    Height = 25
    Caption = 'btnFilterFolders'
    TabOrder = 4
    OnClick = btnFilterFoldersClick
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 354
    Width = 620
    Height = 19
    Panels = <>
    SimplePanel = True
  end
  object btnFilterPasDpr: TButton
    Left = 32
    Top = 208
    Width = 153
    Height = 25
    Caption = 'btnFilterPasDpr'
    TabOrder = 6
    OnClick = btnFilterPasDprClick
  end
end
