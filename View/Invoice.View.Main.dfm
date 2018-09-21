object FormMain: TFormMain
  Left = 0
  Top = 0
  BorderStyle = bsSingle
  Caption = 'FormMain'
  ClientHeight = 610
  ClientWidth = 810
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnResize = FormResize
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object StatusBar: TStatusBar
    Left = 0
    Top = 591
    Width = 810
    Height = 19
    Panels = <
      item
        Alignment = taCenter
        Width = 200
      end
      item
        Alignment = taCenter
        Width = 150
      end
      item
        Alignment = taCenter
        Width = 150
      end
      item
        Width = 150
      end>
  end
  object Ribbon: TRibbon
    Left = 0
    Top = 0
    Width = 810
    Height = 143
    ActionManager = ActionManager
    ShowHelpButton = False
    Tabs = <
      item
        Caption = 'Registration'
        Page = RibbonPageMain
      end>
    DesignSize = (
      810
      143)
    StyleName = 'Ribbon - Silver'
    object RibbonPageMain: TRibbonPage
      Left = 0
      Top = 50
      Width = 809
      Height = 93
      Caption = 'Registration'
      Index = 0
      object RibbonGroupProduct: TRibbonGroup
        Left = 4
        Top = 3
        Width = 121
        Height = 86
        ActionManager = ActionManager
        Caption = 'Group of Product'
        GroupIndex = 0
      end
      object RibbonGroup1: TRibbonGroup
        Left = 127
        Top = 3
        Width = 108
        Height = 86
        ActionManager = ActionManager
        Caption = 'Group of Sales'
        GroupIndex = 1
      end
    end
  end
  object PageControl: TPageControl
    Left = 0
    Top = 143
    Width = 810
    Height = 448
    ActivePage = TabWelcome
    Align = alClient
    Images = DataModuleLocal.ImageListTabs
    PopupMenu = PopupMenu
    TabOrder = 2
    object TabWelcome: TTabSheet
      Caption = 'Welcome'
      object WebBrowser: TWebBrowser
        Left = 0
        Top = 0
        Width = 802
        Height = 419
        Align = alClient
        TabOrder = 0
        ExplicitHeight = 420
        ControlData = {
          4C000000E45200004E2B00000000000000000000000000000000000000000000
          000000004C000000000000000000000001000000E0D057007335CF11AE690800
          2B2E12620A000000000000004C0000000114020000000000C000000000000046
          8000000000000000000000000000000000000000000000000000000000000000
          00000000000000000100000000000000000000000000000000000000}
      end
    end
  end
  object ActionManager: TActionManager
    ActionBars = <
      item
        Items = <
          item
            Action = ActionCustomer
            Caption = '&Customers'
            ImageIndex = 24
            CommandProperties.ButtonSize = bsLarge
          end
          item
            Action = ActionProduct
            Caption = '&Products'
            ImageIndex = 9
            CommandProperties.ButtonSize = bsLarge
          end>
        ActionBar = RibbonGroupProduct
      end
      item
        Items = <
          item
            Action = ActionOrder
            Caption = '&Orders'
            ImageIndex = 97
            CommandProperties.ButtonSize = bsLarge
          end
          item
            Action = ActionTypePayment
            Caption = '&Type of Payments'
            ImageIndex = 129
            CommandProperties.ButtonSize = bsLarge
          end>
        ActionBar = RibbonGroup1
      end>
    DisabledImages = DataModuleLocal.ImageList32_D
    Images = DataModuleLocal.ImageList32_E
    Left = 280
    Top = 64
    StyleName = 'Ribbon - Silver'
    object ActionProduct: TAction
      Caption = 'Products'
      ImageIndex = 9
      OnExecute = ActionProductExecute
    end
    object ActionCustomer: TAction
      Caption = 'Customers'
      ImageIndex = 24
      OnExecute = ActionCustomerExecute
    end
    object ActionOrder: TAction
      Caption = 'Orders'
      ImageIndex = 97
      OnExecute = ActionOrderExecute
    end
    object ActionTypePayment: TAction
      Caption = 'Type of Payments'
      ImageIndex = 129
      OnExecute = ActionTypePaymentExecute
    end
    object ActionCloseTabSheet: TAction
      Caption = 'CloseTab'
      ImageIndex = 8
      OnExecute = ActionCloseTabSheetExecute
    end
  end
  object PopupMenu: TPopupMenu
    Images = DataModuleLocal.ImageListTabs
    Left = 308
    Top = 64
    object CloseTab: TMenuItem
      Action = ActionCloseTabSheet
      Caption = 'Close Tab'
      ImageIndex = 2
    end
  end
end
