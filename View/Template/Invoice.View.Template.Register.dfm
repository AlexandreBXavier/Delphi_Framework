object FormTemplateRegister: TFormTemplateRegister
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Template of Register'
  ClientHeight = 550
  ClientWidth = 750
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  OnResize = FormResize
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl: TPageControl
    Left = 0
    Top = 57
    Width = 750
    Height = 493
    ActivePage = TabList
    Align = alClient
    Images = DataModuleLocal.ImageListTabs
    TabOrder = 0
    TabPosition = tpBottom
    object TabList: TTabSheet
      Caption = 'List of Records'
      object DBGridRecords: TDBGrid
        Left = 0
        Top = 0
        Width = 742
        Height = 466
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
    end
  end
  object PanelNavigator: TPanel
    Left = 0
    Top = 0
    Width = 750
    Height = 57
    Align = alTop
    TabOrder = 1
    object LabelField: TLabel
      Left = 4
      Top = 11
      Width = 22
      Height = 13
      Caption = 'Field'
    end
    object LabelValue: TLabel
      Left = 155
      Top = 11
      Width = 26
      Height = 13
      Caption = 'Value'
    end
    object ComboBoxField: TComboBox
      Left = 4
      Top = 30
      Width = 145
      Height = 21
      Style = csDropDownList
      TabOrder = 0
    end
    object EditValue: TEdit
      Left = 155
      Top = 30
      Width = 262
      Height = 21
      TabOrder = 1
      TextHint = '<Input Value>'
      OnEnter = ButtonFindClick
    end
    object ButtonFind: TButton
      Left = 423
      Top = 12
      Width = 90
      Height = 40
      Caption = 'Find'
      ImageIndex = 65
      Images = DataModuleLocal.ImageList32_E
      TabOrder = 2
      OnClick = ButtonFindClick
    end
    object ButtonPrint: TButton
      Left = 519
      Top = 11
      Width = 90
      Height = 40
      Caption = 'Print'
      ImageIndex = 58
      Images = DataModuleLocal.ImageList32_E
      TabOrder = 3
      OnClick = ButtonPrintClick
    end
  end
  object DataSource: TDataSource
    OnDataChange = DataSourceDataChange
    Left = 504
    Top = 72
  end
  object frxReportModel: TfrxReport
    Version = '5.3.14'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 43371.406565474540000000
    ReportOptions.LastChange = 43371.463608576390000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 568
    Top = 72
    Datasets = <
      item
        DataSet = frxDBDataset
        DataSetName = 'frxDBDataset'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object MasterData: TfrxMasterData
        FillType = ftBrush
        Height = 26.456710000000000000
        Top = 185.196970000000000000
        Width = 718.110700000000000000
        DataSet = frxDBDataset
        DataSetName = 'frxDBDataset'
        RowCount = 0
        object Line3: TfrxLineView
          Top = 26.456710000000000000
          Width = 718.110700000000000000
          Color = clGray
          Frame.Typ = [ftTop]
        end
      end
      object ReportTitle: TfrxReportTitle
        FillType = ftBrush
        Height = 60.472480000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object MemoTitle: TfrxMemoView
          Align = baWidth
          Top = 1.559060000000000000
          Width = 718.110700000000000000
          Height = 56.692950000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            '[LabelTitle]'
            '[LabelSubTitle]')
          ParentFont = False
          Formats = <
            item
            end
            item
            end>
        end
      end
      object PageHeader: TfrxPageHeader
        FillType = ftBrush
        Height = 22.677180000000000000
        Top = 102.047310000000000000
        Width = 718.110700000000000000
        object DemoMemo: TfrxMemoView
          Align = baBottom
          Top = 3.779542200000000000
          Width = 94.488250000000000000
          Height = 18.897637800000000000
          Visible = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Demo')
          ParentFont = False
          WordWrap = False
        end
        object Line1: TfrxLineView
          Top = 22.677180000000000000
          Width = 714.331170000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
      end
      object PageFooter1: TfrxPageFooter
        FillType = ftBrush
        Height = 22.677180000000000000
        Top = 272.126160000000000000
        Width = 718.110700000000000000
        object Line2: TfrxLineView
          Left = 3.779530000000000000
          Width = 718.110700000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Memo1: TfrxMemoView
          Left = 529.134200000000000000
          Top = 3.779530000000000000
          Width = 185.196970000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            '[<Date>] at [<Time>]')
          ParentFont = False
        end
        object Memo2: TfrxMemoView
          Top = 3.000000000000000000
          Width = 185.196970000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Page [Page]')
          ParentFont = False
        end
      end
    end
  end
  object frxDBDataset: TfrxDBDataset
    UserName = 'frxDBDataset'
    CloseDataSource = False
    OpenDataSource = False
    BCDToCurrency = False
    Left = 536
    Top = 72
  end
end
