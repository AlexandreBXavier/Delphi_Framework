object frmMain: TfrmMain
  Left = 0
  Top = 0
  BorderStyle = bsSingle
  Caption = 'frmMain'
  ClientHeight = 610
  ClientWidth = 810
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object MainMenu: TMainMenu
    Left = 16
    Top = 8
  end
  object ActionList: TActionList
    Left = 128
    Top = 8
    object ActionProduct: TAction
      Caption = 'Products'
      OnExecute = ActionProductExecute
    end
  end
  object ImageList: TImageList
    Left = 72
    Top = 8
  end
end
