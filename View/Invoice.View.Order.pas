unit Invoice.View.Order;

interface

uses
     Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
     Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls,
     Invoice.Model.Interfaces;

type
     TFormOrder = class(TForm)
          PanelBar: TPanel;
          PanelGrid: TPanel;
          DBGridRecords: TDBGrid;
          DataSource: TDataSource;
          ComboBoxField: TComboBox;
          LabelField: TLabel;
          LabelValue: TLabel;
          EditValue: TEdit;
          ButtonFind: TButton;
          ButtonOrder: TButton;
          procedure FormClose(Sender: TObject; var Action: TCloseAction);
          procedure FormCreate(Sender: TObject);
          procedure FormShow(Sender: TObject);
          procedure DataSourceDataChange(Sender: TObject; Field: TField);
          procedure ButtonFindClick(Sender: TObject);
          procedure DBGridRecordsTitleClick(Column: TColumn);
          procedure FormResize(Sender: TObject);
          procedure ButtonOrderClick(Sender: TObject);
     private
          { Private declarations }
          FEntity: iEntity;
          procedure FindRecords;
          procedure ListComboBoxField;
     public
          { Public declarations }
     end;

var
     FormOrder: TFormOrder;

implementation

{$R *.dfm}

uses Invoice.Controller.DataModule, Invoice.Controller.Facade, Invoice.View.OrderProduct;

procedure TFormOrder.ButtonFindClick(Sender: TObject);
begin
     FindRecords;
     //
     FormResize(Sender);
end;

procedure TFormOrder.ButtonOrderClick(Sender: TObject);
begin
     try
          FormOrderProduct := TFormOrderProduct.Create(Self);
          //
          FormOrderProduct.SetidCustomer(DataSource.DataSet.FieldByName('idCustomer').AsInteger);
          FormOrderProduct.SetnameCustomer(DataSource.DataSet.FieldByName('nameCustomer').AsString);
          //
          FormOrderProduct.ShowModal;
     finally
          FormOrderProduct.Free;
     end;
end;

procedure TFormOrder.DataSourceDataChange(Sender: TObject; Field: TField);
begin
     ButtonOrder.Visible := DataSource.DataSet.Active and (DataSource.DataSet.State = dsBrowse) and (DataSource.DataSet.RecordCount > 0);
end;

procedure TFormOrder.DBGridRecordsTitleClick(Column: TColumn);
begin
     FEntity.OrderBy(Column.FieldName);
end;

procedure TFormOrder.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     if DataSource.DataSet.Active then
          DataSource.DataSet.Close;
     //
     Action := caFree;
end;

procedure TFormOrder.FormCreate(Sender: TObject);
begin
     try
          FEntity := TControllerGeneralFacade.New.EntityFactory.Customer(DataModuleLocal.GetConnection);
          //
          FEntity.List;
          //
          DataSource.DataSet := FEntity.DataSet;
     except
          on E: Exception do
               raise Exception.Create(E.Message);
     end;
end;

procedure TFormOrder.FormResize(Sender: TObject);
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

procedure TFormOrder.FormShow(Sender: TObject);
begin
     if not DataSource.DataSet.Active then
          DataSource.DataSet.Open;
     //
     ListComboBoxField;
end;

procedure TFormOrder.FindRecords;
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

procedure TFormOrder.ListComboBoxField;
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

Initialization

RegisterClass(TFormOrder);

Finalization

UnRegisterClass(TFormOrder);

end.
