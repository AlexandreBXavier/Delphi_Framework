object FormProduct: TFormProduct
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  ClientHeight = 407
  ClientWidth = 672
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = True
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object DBNavigator: TDBNavigator
    Left = 0
    Top = 367
    Width = 672
    Height = 40
    DataSource = DataSource
    Align = alBottom
    TabOrder = 0
    ExplicitTop = 357
    ExplicitWidth = 662
  end
  object PageControl: TPageControl
    Left = 0
    Top = 0
    Width = 672
    Height = 367
    ActivePage = TabList
    Align = alClient
    TabOrder = 1
    ExplicitWidth = 662
    ExplicitHeight = 357
    object TabList: TTabSheet
      Caption = 'List of Records'
      ExplicitWidth = 654
      ExplicitHeight = 329
      object DBGridRecords: TDBGrid
        Left = 0
        Top = 0
        Width = 664
        Height = 339
        Align = alClient
        DataSource = DataSource
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
      end
    end
    object TabInfo: TTabSheet
      Caption = 'Details of Record'
      ImageIndex = 1
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
    end
  end
  object DataSource: TDataSource
    Left = 548
    Top = 16
  end
end
