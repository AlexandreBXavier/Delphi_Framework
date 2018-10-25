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
      ExplicitHeight = 0
    end
  end
  inherited DataSource: TDataSource
    Left = 524
  end
  inherited frxReportModel: TfrxReport
    Datasets = <
      item
        DataSet = frxDBDataset
        DataSetName = 'frxDBDataset'
      end>
    Variables = <>
    Style = <>
    inherited Page1: TfrxReportPage
      inherited ReportTitle: TfrxReportTitle
        inherited MemoTitle: TfrxMemoView
          Formats = <
            item
            end
            item
            end>
        end
      end
    end
  end
end
