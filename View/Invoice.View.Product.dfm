inherited FormProduct: TFormProduct
  Caption = 'Form Product'
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl: TPageControl
    inherited TabList: TTabSheet
      Caption = 'List of Products'
    end
    inherited TabInfo: TTabSheet
      Caption = 'Details of Product'
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitHeight = 0
    end
  end
  inherited DataSource: TDataSource
    Left = 524
  end
end
