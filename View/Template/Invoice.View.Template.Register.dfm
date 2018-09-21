object FormTemplateRegister: TFormTemplateRegister
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Template of Register'
  ClientHeight = 429
  ClientWidth = 707
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl: TPageControl
    Left = 0
    Top = 0
    Width = 707
    Height = 389
    ActivePage = TabList
    Align = alClient
    TabOrder = 0
    ExplicitHeight = 249
    object TabList: TTabSheet
      Caption = 'List of Records'
      ExplicitWidth = 664
      ExplicitHeight = 339
      object DBGridRecords: TDBGrid
        Left = 0
        Top = 0
        Width = 699
        Height = 361
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
      ExplicitHeight = 253
    end
  end
  object DBNavigator: TDBNavigator
    Left = 0
    Top = 389
    Width = 707
    Height = 40
    DataSource = DataSource
    Align = alBottom
    TabOrder = 1
    ExplicitTop = 367
    ExplicitWidth = 672
  end
  object DataSource: TDataSource
    Left = 548
    Top = 16
  end
end
