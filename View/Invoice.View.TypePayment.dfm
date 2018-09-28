inherited FormTypePayment: TFormTypePayment
  Caption = 'Form Type of Payment'
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl: TPageControl
    inherited TabList: TTabSheet
      Caption = 'List of Type of Payments'
    end
    inherited TabInfo: TTabSheet
      Caption = 'Details of Type of Payment'
    end
  end
  inherited PanelNavigator: TPanel
    inherited EditValue: TEdit
      OnEnter = ButtonFindClick
    end
  end
end
