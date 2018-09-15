object frmDataModule: TfrmDataModule
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 413
  Width = 724
  object FDConnection: TFDConnection
    Params.Strings = (
      'Database=Invoice'
      'User_Name=sa'
      'Password=zoe@2011'
      'Server=177.53.236.135\SQLEXPRESS01'
      'OSAuthent=No'
      'DriverID=MSSQL')
    LoginPrompt = False
    Left = 40
    Top = 24
  end
  object FDGUIxWaitCursor: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 504
    Top = 32
  end
  object FDPhysMSSQLDriverLink: TFDPhysMSSQLDriverLink
    Left = 536
    Top = 32
  end
end
