unit Invoice.View.Product;

interface

uses
     Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
     Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.ComCtrls, Vcl.ExtCtrls,
     Vcl.DBCtrls, Invoice.Model.Interfaces;

type
     TFormProduct = class(TForm)
          DBNavigator: TDBNavigator;
          PageControl: TPageControl;
          TabList: TTabSheet;
          TabInfo: TTabSheet;
          DataSource: TDataSource;
          DBGridRecords: TDBGrid;
          procedure FormClose(Sender: TObject; var Action: TCloseAction);
          procedure FormCreate(Sender: TObject);
          procedure FormShow(Sender: TObject);
          procedure FormDestroy(Sender: TObject);
     private
          { Private declarations }
          FProduct: iEntity;
     public
          { Public declarations }
     end;

var
     FormProduct: TFormProduct;

implementation

{$R *.dfm}

uses Invoice.Controller.DataModule, Invoice.Model.Entity.Product, Invoice.Controller.Connection.Factory;

procedure TFormProduct.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     Action := caFree;
end;

procedure TFormProduct.FormCreate(Sender: TObject);
begin
     try
          FProduct := TModelEntityProduct.New(DataModuleLocal.GetConnection);
     except
          on E: Exception do
               raise Exception.Create(E.Message);
     end;
end;

procedure TFormProduct.FormDestroy(Sender: TObject);
begin
     FreeAndNil(FProduct);
end;

procedure TFormProduct.FormShow(Sender: TObject);
begin
     try
          FProduct.List(DataSource);
     except
          on E: Exception do
               raise Exception.Create(E.Message);
     end;
end;

Initialization

RegisterClass(TFormProduct);

Finalization

UnRegisterClass(TFormProduct);

end.
