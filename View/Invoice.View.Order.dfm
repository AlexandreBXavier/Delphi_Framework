object FormOrder: TFormOrder
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Order'
  ClientHeight = 444
  ClientWidth = 691
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
  object PanelBar: TPanel
    Left = 0
    Top = 0
    Width = 691
    Height = 55
    Align = alTop
    TabOrder = 0
    object LabelField: TLabel
      Left = 4
      Top = 11
      Width = 22
      Height = 13
      Caption = 'Field'
    end
    object LabelValue: TLabel
      Left = 119
      Top = 11
      Width = 26
      Height = 13
      Caption = 'Value'
    end
    object ComboBoxField: TComboBox
      Left = 4
      Top = 30
      Width = 109
      Height = 21
      Style = csDropDownList
      TabOrder = 0
    end
    object EditValue: TEdit
      Left = 119
      Top = 30
      Width = 222
      Height = 21
      TabOrder = 1
      TextHint = '<Input Value>'
      OnEnter = ButtonFindClick
    end
    object ButtonFind: TButton
      Left = 347
      Top = 11
      Width = 75
      Height = 40
      Caption = 'Find'
      ImageIndex = 65
      Images = DataModuleLocal.ImageList32_E
      TabOrder = 2
      OnClick = ButtonFindClick
    end
    object ButtonOrder: TButton
      Left = 428
      Top = 11
      Width = 75
      Height = 40
      Caption = 'Order'
      ImageIndex = 98
      Images = DataModuleLocal.ImageList32_E
      TabOrder = 3
      OnClick = ButtonOrderClick
    end
  end
  object PanelGrid: TPanel
    Left = 0
    Top = 55
    Width = 691
    Height = 389
    Align = alClient
    TabOrder = 1
    object DBGridRecords: TDBGrid
      Left = 1
      Top = 1
      Width = 689
      Height = 387
      Align = alClient
      DataSource = DataSource
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnTitleClick = DBGridRecordsTitleClick
    end
  end
  object DataSource: TDataSource
    OnDataChange = DataSourceDataChange
    Left = 632
    Top = 64
  end
end
