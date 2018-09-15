object frmProduct: TfrmProduct
  Left = 0
  Top = 0
  Caption = 'frmProduct'
  ClientHeight = 480
  ClientWidth = 640
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
  object DBNavigator: TDBNavigator
    Left = 0
    Top = 440
    Width = 640
    Height = 40
    DataSource = DataSource
    Align = alBottom
    TabOrder = 0
  end
  object PageControl: TPageControl
    Left = 0
    Top = 0
    Width = 640
    Height = 440
    ActivePage = TabSheetList
    Align = alClient
    TabOrder = 1
    object TabSheetList: TTabSheet
      Caption = 'List of Records'
      object DBGridRecords: TDBGrid
        Left = 0
        Top = 0
        Width = 632
        Height = 412
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
    object TabSheet2: TTabSheet
      Caption = 'Details of Record'
      ImageIndex = 1
    end
  end
  object DataSource: TDataSource
    Left = 548
    Top = 16
  end
end
