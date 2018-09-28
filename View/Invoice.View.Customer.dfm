inherited FormCustomer: TFormCustomer
  Caption = 'Form Customer'
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl: TPageControl
    inherited TabList: TTabSheet
      Caption = 'List of Customers'
    end
    inherited TabInfo: TTabSheet
      Caption = 'Details of Customer'
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitHeight = 0
    end
  end
end
