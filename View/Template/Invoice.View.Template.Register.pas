unit Invoice.View.Template.Register;

interface

uses
     Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
     Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.ComCtrls, Vcl.ExtCtrls,
     Vcl.DBCtrls, Vcl.StdCtrls, Invoice.Model.Interfaces, frxClass, frxDBSet, Vcl.Mask;

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
          ButtonInsert: TButton;
          ButtonDelete: TButton;
          ButtonEdit: TButton;
          ButtonSave: TButton;
          ButtonCancel: TButton;
          LabelID: TLabel;
          DBEditID: TDBEdit;
          procedure ButtonFindClick(Sender: TObject);
          procedure FormClose(Sender: TObject; var Action: TCloseAction);
          procedure FormShow(Sender: TObject);
          procedure FormCreate(Sender: TObject);
          function GetEntity: iEntity; virtual;
          procedure FormResize(Sender: TObject);
          procedure ButtonPrintClick(Sender: TObject);
          procedure DataSourceDataChange(Sender: TObject; Field: TField);
          procedure ButtonInsertClick(Sender: TObject);
          procedure ButtonDeleteClick(Sender: TObject);
          procedure ButtonEditClick(Sender: TObject);
          procedure ButtonSaveClick(Sender: TObject);
          procedure ButtonCancelClick(Sender: TObject);
          procedure DBGridRecordsTitleClick(Column: TColumn);
     private
          { Private declarations }
          FEntity: iEntity;
          //
          procedure FindRecords;
          procedure ListComboBoxField;
          procedure AutoCreateFields;
     public
          { Public declarations }
     end;

var
     FormTemplateRegister: TFormTemplateRegister;

implementation

{$R *.dfm}

uses Invoice.Controller.DataModule;

procedure TFormTemplateRegister.ButtonCancelClick(Sender: TObject);
begin
     DataSource.DataSet.Cancel;
end;

procedure TFormTemplateRegister.ButtonDeleteClick(Sender: TObject);
begin
     if (MessageDlg('Do you really delete record?', mtConfirmation, [mbYes, mbNo], 0) = mrYES) then
          DataSource.DataSet.Delete;
end;

procedure TFormTemplateRegister.ButtonEditClick(Sender: TObject);
begin
     DataSource.DataSet.Edit;
end;

procedure TFormTemplateRegister.ButtonFindClick(Sender: TObject);
begin
     FindRecords;
     //
     FormResize(Sender);
end;

procedure TFormTemplateRegister.ButtonInsertClick(Sender: TObject);
begin
     DataSource.DataSet.Insert;
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
                         if (DBGridRecords.Columns[aColunm].Alignment = taLeftJustify) then
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

procedure TFormTemplateRegister.ButtonSaveClick(Sender: TObject);
begin
     DataSource.DataSet.Post;
end;

procedure TFormTemplateRegister.DataSourceDataChange(Sender: TObject; Field: TField);
begin
     ButtonInsert.Visible := DataSource.DataSet.Active and (DataSource.DataSet.State = dsBrowse);
     ButtonEdit.Visible := DataSource.DataSet.Active and (DataSource.DataSet.State = dsBrowse) and (DataSource.DataSet.RecordCount > 0);
     ButtonDelete.Visible := DataSource.DataSet.Active and (DataSource.DataSet.State = dsBrowse) and (DataSource.DataSet.RecordCount > 0);
     ButtonSave.Visible := DataSource.DataSet.Active and (DataSource.DataSet.State in [dsInsert, dsEdit]);
     ButtonCancel.Visible := DataSource.DataSet.Active and (DataSource.DataSet.State in [dsInsert, dsEdit]);
     ButtonPrint.Visible := DataSource.DataSet.Active and (DataSource.DataSet.State = dsBrowse) and (DataSource.DataSet.RecordCount > 0);
     //
     TabInfo.TabVisible := DataSource.DataSet.Active and (DataSource.DataSet.State in [dsInsert, dsEdit]);
     TabList.TabVisible := not TabInfo.Visible;
     //
     if TabInfo.TabVisible then
          PageControl.ActivePage := TabInfo
     else
          PageControl.ActivePage := TabList;
end;

procedure TFormTemplateRegister.DBGridRecordsTitleClick(Column: TColumn);
begin
     FEntity.OrderBy(Column.FieldName);
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
     TabInfo.TabVisible := False;
     TabList.TabVisible := True;
     //
     PageControl.ActivePage := TabList;
     //
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
     //
     AutoCreateFields;
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

procedure TFormTemplateRegister.AutoCreateFields;
var
     LocalCount: Integer;
     Line: Integer;
     Colunm: Integer;
     LookupDataSource: TDataSource;
     LocalLabel: TLabel;
     LocalEdit: TDBEdit;
     LocalCheckBox: TDBCheckBox;
     LocalLookupComboBox: TDBLookupComboBox;
begin
     if (DataSource.DataSet.FieldCount > 0) then
     begin
          Line := DBEditID.Top;
          Colunm := DBEditID.Left + DBEditID.Width + 10;
          //
          DBEditID.DataField := DataSource.DataSet.Fields[0].FieldName;
          //
          for LocalCount := 1 to DataSource.DataSet.FieldCount - 1 do
          begin
               if DataSource.DataSet.Fields[LocalCount].Visible and (DataSource.DataSet.Fields[LocalCount].ProviderFlags <> []) then
               begin
                    if (DataSource.DataSet.Fields[LocalCount].LookupDataSet <> Nil) then
                    begin
                         LookupDataSource := TDataSource.Create(Self);
                         LookupDataSource.Name := 'srcLookup' + DataSource.DataSet.Fields[LocalCount].FieldName;
                         LookupDataSource.DataSet := DataSource.DataSet.Fields[LocalCount].LookupDataSet;
                         //
                         LocalLookupComboBox := TDBLookupComboBox.Create(Self);
                         LocalLookupComboBox.Name := 'DBLookup' + DataSource.DataSet.Fields[LocalCount].FieldName;
                         LocalLookupComboBox.Parent := TabInfo;
                         LocalLookupComboBox.Top := Line;
                         LocalLookupComboBox.Left := Colunm;
                         LocalLookupComboBox.DataSource := DataSource;
                         LocalLookupComboBox.DataField := DataSource.DataSet.Fields[LocalCount].FieldName;
                         LocalLookupComboBox.Width := DataSource.DataSet.Fields[LocalCount].DisplayWidth * 6;
                         LocalLookupComboBox.ListSource := LookupDataSource;
                         LocalLookupComboBox.KeyField := DataSource.DataSet.Fields[LocalCount].LookupKeyFields;
                         LocalLookupComboBox.ListField := DataSource.DataSet.Fields[LocalCount].LookupResultField;
                         //
                         if DataSource.DataSet.Fields[LocalCount].ReadOnly then
                         begin
                              LocalLookupComboBox.ShowHint := False;
                              LocalLookupComboBox.Hint := '';
                              LocalLookupComboBox.ReadOnly := True;
                              LocalLookupComboBox.Color := DBEditID.Color;
                         end
                         else
                         begin
                              LocalLookupComboBox.ShowHint := True;
                              LocalLookupComboBox.Hint := 'Informe ' + DataSource.DataSet.Fields[LocalCount].DisplayLabel;
                              LocalLookupComboBox.ReadOnly := False;
                              LocalLookupComboBox.Color := ComboBoxField.Color;
                         end;
                         //
                         LocalLabel := TLabel.Create(Self);
                         LocalLabel.Name := 'Label' + DataSource.DataSet.Fields[LocalCount].FieldName;
                         LocalLabel.Parent := TabInfo;
                         LocalLabel.Top := Line - 15;
                         LocalLabel.Left := Colunm;
                         LocalLabel.Caption := DataSource.DataSet.Fields[LocalCount].DisplayLabel;
                         LocalLabel.Width := DataSource.DataSet.Fields[LocalCount].DisplayWidth * 6;
                         LocalLabel.Hint := '';
                         LocalLabel.ShowHint := False;
                         LocalLabel.FocusControl := LocalLookupComboBox;
                         LocalLabel.StyleElements := [seClient, seBorder];
                         //
                         Colunm := Colunm + LocalLookupComboBox.Width + 10;
                    end
                    else
                    begin
                         if DataSource.DataSet.Fields[LocalCount].DataType in [TFieldType.ftInteger, TFieldType.ftString, TFieldType.ftCurrency] then
                         begin
                              LocalEdit := TDBEdit.Create(Self);
                              LocalEdit.Name := 'DBEdit' + DataSource.DataSet.Fields[LocalCount].FieldName;
                              LocalEdit.Parent := TabInfo;
                              LocalEdit.Top := Line;
                              LocalEdit.Left := Colunm;
                              LocalEdit.DataSource := DataSource;
                              LocalEdit.DataField := DataSource.DataSet.Fields[LocalCount].FieldName;
                              LocalEdit.MaxLength := DataSource.DataSet.Fields[LocalCount].DisplayWidth;
                              LocalEdit.Width := DataSource.DataSet.Fields[LocalCount].DisplayWidth * 6;
                              //
                              if DataSource.DataSet.Fields[LocalCount].ReadOnly then
                              begin
                                   LocalEdit.ShowHint := False;
                                   LocalEdit.Hint := '';
                                   LocalEdit.ReadOnly := True;
                                   LocalEdit.Color := DBEditID.Color;
                              end
                              else
                              begin
                                   LocalEdit.ShowHint := True;
                                   LocalEdit.Hint := 'Informe ' + DataSource.DataSet.Fields[LocalCount].DisplayLabel;
                                   LocalEdit.ReadOnly := False;
                                   LocalEdit.Color := ComboBoxField.Color;
                              end;
                              //
                              LocalLabel := TLabel.Create(Self);
                              LocalLabel.Name := 'Label' + DataSource.DataSet.Fields[LocalCount].FieldName;
                              LocalLabel.Parent := TabInfo;
                              LocalLabel.Top := Line - 15;
                              LocalLabel.Left := Colunm;
                              LocalLabel.Caption := DataSource.DataSet.Fields[LocalCount].DisplayLabel;
                              LocalLabel.Width := DataSource.DataSet.Fields[LocalCount].DisplayWidth * 6;
                              LocalLabel.Hint := '';
                              LocalLabel.ShowHint := False;
                              LocalLabel.FocusControl := LocalEdit;
                              LocalLabel.StyleElements := [seClient, seBorder];
                              //
                              Colunm := Colunm + LocalEdit.Width + 10;
                         end
                         else if DataSource.DataSet.Fields[LocalCount].DataType in [TFieldType.ftBoolean] then
                         begin
                              LocalCheckBox := TDBCheckBox.Create(Self);
                              LocalCheckBox.Name := 'DBCheckBox' + DataSource.DataSet.Fields[LocalCount].FieldName;
                              LocalCheckBox.Parent := TabInfo;
                              LocalCheckBox.Top := Line;
                              LocalCheckBox.Left := Colunm;
                              LocalCheckBox.DataSource := DataSource;
                              LocalCheckBox.DataField := DataSource.DataSet.Fields[LocalCount].FieldName;
                              LocalCheckBox.Caption := DataSource.DataSet.Fields[LocalCount].DisplayLabel;
                              LocalCheckBox.Width := (Length(DataSource.DataSet.Fields[LocalCount].DisplayLabel) * 6) + 10;
                              //
                              if DataSource.DataSet.Fields[LocalCount].ReadOnly then
                              begin
                                   LocalCheckBox.ShowHint := False;
                                   LocalEdit.Hint := '';
                                   LocalEdit.ReadOnly := True;
                              end
                              else
                              begin
                                   LocalCheckBox.ShowHint := True;
                                   LocalEdit.Hint := 'Informe ' + DataSource.DataSet.Fields[LocalCount].DisplayLabel;
                                   LocalEdit.ReadOnly := False;
                              end;
                              //
                              Colunm := Colunm + LocalCheckBox.Width + 10;
                         end;
                    end;
                    //
                    if (Colunm > 600) then
                    begin
                         Colunm := DBEditID.Left;
                         Line := Line + 40;
                    end;
               end;
          end;
     end;
end;

end.
