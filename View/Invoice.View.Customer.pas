unit Invoice.View.Customer;

interface

uses
     Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
     Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.ComCtrls, Vcl.ExtCtrls,
     Vcl.DBCtrls, Invoice.Model.Interfaces;

type
     TFormCustomer = class(TForm)
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
          FCustomer: iEntity;
     public
          { Public declarations }
     end;

var
     FormCustomer: TFormCustomer;

implementation

{$R *.dfm}

uses Invoice.Controller.DataModule, Invoice.Model.Entity.Customer, Invoice.Controller.Connection.Factory;

procedure TFormCustomer.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     Action := caFree;
end;

procedure TFormCustomer.FormCreate(Sender: TObject);
begin
     try
          FCustomer := TModelEntityCustomer.New(DataModuleLocal.GetConnection);
     except
          on E: Exception do
               raise Exception.Create(E.Message);
     end;
end;

procedure TFormCustomer.FormDestroy(Sender: TObject);
begin
     FreeAndNil(FCustomer);
end;

procedure TFormCustomer.FormShow(Sender: TObject);
begin
     try
          FCustomer.List(DataSource);
     except
          on E: Exception do
               raise Exception.Create(E.Message);
     end;
end;

Initialization

RegisterClass(TFormCustomer);

Finalization

UnRegisterClass(TFormCustomer);

end.
