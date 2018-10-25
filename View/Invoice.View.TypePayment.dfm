inherited FormTypePayment: TFormTypePayment
  Caption = 'Form Type of Payment'
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
