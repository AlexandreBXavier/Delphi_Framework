inherited FormProduct: TFormProduct
  Caption = 'Form Product'
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl: TPageControl
    ExplicitHeight = 389
    inherited TabList: TTabSheet
      Caption = 'List of Products'
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 699
      ExplicitHeight = 361
    end
    inherited TabInfo: TTabSheet
      Caption = 'Details of Product'
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 699
      ExplicitHeight = 361
    end
  end
  inherited DBNavigator: TDBNavigator
    Hints.Strings = ()
    ExplicitTop = 389
    ExplicitWidth = 707
  end
end
