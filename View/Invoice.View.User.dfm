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
