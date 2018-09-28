unit Invoice.View.Template.Register;

interface

uses
     Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
     Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.ComCtrls, Vcl.ExtCtrls,
     Vcl.DBCtrls, Vcl.StdCtrls, Invoice.Model.Interfaces, frxClass, frxDBSet;

type
     TFormTemplateRegister = class(TForm)
          PageControl: TPageControl;
          TabList: TTabSheet;
          DBGridRecords: TDBGrid;
          TabInfo: TTabSheet;
          DataSource: TDataSource;
          PanelNavigator: TPanel;
          ComboBoxField: TComboBox;
          LabelField: TLabel;
          EditValue: TEdit;
          LabelValue: TLabel;
          ButtonFind: TButton;
          frxReportModel: TfrxReport;
          frxDBDataset: TfrxDBDataset;
          ButtonPrint: TButton;
          procedure ButtonFindClick(Sender: TObject);
          procedure FormClose(Sender: TObject; var Action: TCloseAction);
          procedure FormShow(Sender: TObject);
          procedure FormCreate(Sender: TObject);
          function GetEntity: iEntity; virtual;
          procedure FormResize(Sender: TObject);
          procedure ButtonPrintClick(Sender: TObject);
          procedure DataSourceDataChange(Sender: TObject; Field: TField);
     private
          { Private declarations }
          FEntity: iEntity;
          //
          procedure FindRecords;
          procedure ListComboBoxField;
     public
          { Public declarations }
     end;

var
     FormTemplateRegister: TFormTemplateRegister;

implementation

{$R *.dfm}

uses Invoice.Controller.DataModule;

procedure TFormTemplateRegister.ButtonFindClick(Sender: TObject);
begin
     FindRecords;
     //
     FormResize(Sender);
end;

procedure TFormTemplateRegister.ButtonPrintClick(Sender: TObject);
var
     aLimit: Extended;
     aCount: Extended;
     aWidth: Extended;
     aPercent: Extended;
     aColunm: Integer;
     nameColunm: String;
     infoColunm: String;
     ReportCabecalho: TfrxPageHeader;
     MasterData: TfrxMasterData;
begin
     aCount := 0;
     //
     frxDBDataset.DataSource := DataSource;
     //
     frxReportModel.Variables['LabelTitle'] := QuotedStr(Application.Title);
     frxReportModel.Variables['LabelSubTitle'] := QuotedStr(Caption);
     //
     if not TfrxMemoView(frxReportModel.FindObject('DemoMemo')).Visible then
     begin
          aLimit := frxReportModel.Pages[0].Width - 250;
          //
          for aColunm := 0 to DBGridRecords.Columns.Count - 1 do
          begin
               if (DBGridRecords.Columns[aColunm].FieldName <> '') and DataSource.DataSet.Fields[aColunm].Visible then
               begin
                    nameColunm := 'LBMemo' + intToStr(aColunm);
                    infoColunm := 'DBMemo' + intToStr(aColunm);
                    //
                    aPercent := (DBGridRecords.Columns[aColunm].Width / DBGridRecords.Width) * 100;
                    aWidth := (aLimit / 100) * aPercent;
                    //
                    if (TfrxPageHeader(frxReportModel.FindObject('PageHeader')) <> nil) then
                    begin
                         ReportCabecalho := TfrxPageHeader(frxReportModel.FindObject('PageHeader'));
                         //
                         if (TfrxMemoView(frxReportModel.FindObject(nameColunm)) = nil) then
                         begin
                              with TfrxMemoView.Create(ReportCabecalho) do
                              begin
                                   CreateUniqueName;
                                   Name := nameColunm;
                                   Left := aColunm;
                              end;
                         end;
                         //
                         TfrxMemoView(frxReportModel.FindObject(nameColunm)).Assign(TfrxMemoView(frxReportModel.FindObject('DemoMemo')));
                         TfrxMemoView(frxReportModel.FindObject(nameColunm)).Memo.Clear;
                         TfrxMemoView(frxReportModel.FindObject(nameColunm)).Memo.Add(DBGridRecords.Columns[aColunm].Title.Caption);
                         TfrxMemoView(frxReportModel.FindObject(nameColunm)).Font.Style := [fsBold];
                         TfrxMemoView(frxReportModel.FindObject(nameColunm)).Visible := True;
                         //
                         TfrxMemoView(frxReportModel.FindObject(nameColunm)).Left := aCount;
                         TfrxMemoView(frxReportModel.FindObject(nameColunm)).Width := aWidth;
                         //
                         if (DBGridRecords.Columns[aColunm].Alignment  = taLeftJustify) then
                              TfrxMemoView(frxReportModel.FindObject(nameColunm)).HAlign := TfrxHAlign(0)
                         else if (DBGridRecords.Columns[aColunm].Alignment = taRightJustify) then
                              TfrxMemoView(frxReportModel.FindObject(nameColunm)).HAlign := TfrxHAlign(1)
                         else if (DBGridRecords.Columns[aColunm].Alignment = taCenter) then
                              TfrxMemoView(frxReportModel.FindObject(nameColunm)).HAlign := TfrxHAlign(2)
                         else
                              TfrxMemoView(frxReportModel.FindObject(nameColunm)).HAlign := TfrxHAlign(0);
                    end;
                    //
                    if (TfrxMasterData(frxReportModel.FindObject('MasterData')) <> nil) then
                    begin
                         MasterData := TfrxMasterData(frxReportModel.FindObject('MasterData'));
                         //
                         if (TfrxMemoView(frxReportModel.FindObject(infoColunm)) = nil) then
                         begin
                              with TfrxMemoView.Create(MasterData) do
                              begin
                                   CreateUniqueName;
                                   Name := infoColunm;
                                   Left := aColunm;
                              end;
                         end;
                         //
                         TfrxMemoView(frxReportModel.FindObject(infoColunm)).Assign(TfrxMemoView(frxReportModel.FindObject('DemoMemo')));
                         TfrxMemoView(frxReportModel.FindObject(infoColunm)).Memo.Clear;
                         TfrxMemoView(frxReportModel.FindObject(infoColunm)).DataSet := frxDBDataset;
                         TfrxMemoView(frxReportModel.FindObject(infoColunm)).DataField := DBGridRecords.Columns[aColunm].FieldName;
                         TfrxMemoView(frxReportModel.FindObject(infoColunm)).Font.Style := [];
                         TfrxMemoView(frxReportModel.FindObject(infoColunm)).Visible := True;
                         //
                         TfrxMemoView(frxReportModel.FindObject(infoColunm)).Left := aCount;
                         TfrxMemoView(frxReportModel.FindObject(infoColunm)).Width := aWidth;
                         //
                         if (DBGridRecords.Columns[aColunm].Alignment = taLeftJustify) then
                              TfrxMemoView(frxReportModel.FindObject(infoColunm)).HAlign := TfrxHAlign(0)
                         else if (DBGridRecords.Columns[aColunm].Alignment = taRightJustify) then
                              TfrxMemoView(frxReportModel.FindObject(infoColunm)).HAlign := TfrxHAlign(1)
                         else if (DBGridRecords.Columns[aColunm].Alignment = taCenter) then
                              TfrxMemoView(frxReportModel.FindObject(infoColunm)).HAlign := TfrxHAlign(2)
                         else
                              TfrxMemoView(frxReportModel.FindObject(infoColunm)).HAlign := TfrxHAlign(0);
                    end;
                    //
                    aCount := aCount + aWidth;
               end;
          end;
     end;
     //
     frxReportModel.ShowReport(True);
end;

procedure TFormTemplateRegister.DataSourceDataChange(Sender: TObject; Field: TField);
begin
     ButtonPrint.Visible := DataSource.DataSet.Active and (DataSource.DataSet.RecordCount > 0);
end;

procedure TFormTemplateRegister.FindRecords;
begin
     try
          if (EditValue.Text <> '') then
               FEntity.ListWhere(ComboBoxField.Text + ' = ' + QuotedStr(EditValue.Text))
          else
               FEntity.ListWhere(ComboBoxField.Text + ' IS NOT NULL');
          //
          DataSource.DataSet := FEntity.DataSet;
          //
          DataSource.DataSet.Open;
     except
          on E: Exception do
               raise Exception.Create(E.Message);
     end;
end;

procedure TFormTemplateRegister.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     if DataSource.DataSet.Active then
          DataSource.DataSet.Close;
     //
     Action := caFree;
end;

procedure TFormTemplateRegister.FormCreate(Sender: TObject);
begin
     FEntity := GetEntity;
     //
     try
          FEntity.List;
          //
          DataSource.DataSet := FEntity.DataSet;
     except
          on E: Exception do
               raise Exception.Create(E.Message);
     end;
end;

procedure TFormTemplateRegister.FormResize(Sender: TObject);
var
     aCount: Integer;
     aSizeGrid: Integer;
     aSizeColunm: Integer;
begin
     if DataSource.DataSet.Active then
     begin
          aSizeGrid := DBGridRecords.Width - 40;
          aSizeColunm := 0;
          //
          for aCount := 0 to DBGridRecords.Columns.Count - 1 do
          begin
               if (DBGridRecords.Columns.Items[aCount].Width > 100) then
                    DBGridRecords.Columns.Items[aCount].Width := 100;
               //
               aSizeColunm := aSizeColunm + DBGridRecords.Columns.Items[aCount].Width;
          end;
          //
          if (aSizeGrid >= aSizeColunm) then
               DBGridRecords.Columns.Items[1].Width := DBGridRecords.Columns.Items[1].Width + (aSizeGrid - aSizeColunm)
          else
               DBGridRecords.Columns.Items[1].Width := DBGridRecords.Columns.Items[1].Width - (aSizeColunm - aSizeGrid);
     end;
end;

procedure TFormTemplateRegister.FormShow(Sender: TObject);
begin
     if not DataSource.DataSet.Active then
          DataSource.DataSet.Open;
     //
     ListComboBoxField;
end;

function TFormTemplateRegister.GetEntity: iEntity;
begin
     Result := FEntity;
end;

procedure TFormTemplateRegister.ListComboBoxField;
begin
     ComboBoxField.Items.Clear;
     //
     if (DataSource.DataSet.Fields.Count > 0) then
     begin
          DataSource.DataSet.Fields.GetFieldNames(ComboBoxField.Items);
          //
          ComboBoxField.ItemIndex := 1;
     end;
end;

end.
