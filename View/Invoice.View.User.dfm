inherited FormUser: TFormUser
  Caption = 'Form User'
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl: TPageControl
    inherited TabList: TTabSheet
      Caption = 'List of Users'
    end
    inherited TabInfo: TTabSheet
      Caption = 'Details of User'
      ExplicitTop = 24
      ExplicitHeight = 361
    end
  end
end
