unit Invoice.View.Product;

interface

uses
     Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
     Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.ExtCtrls, Vcl.DBCtrls, Vcl.Grids, Vcl.DBGrids,
     Vcl.ComCtrls, Invoice.Model.Interfaces, Invoice.View.Template.Register;

type
     TFormProduct = class(TFormTemplateRegister)
          procedure FormCreate(Sender: TObject);
          procedure FormShow(Sender: TObject);
     private
          { Private declarations }
          FEntity: iEntity;
     public
          { Public declarations }
     end;

var
     FormProduct: TFormProduct;

implementation

{$R *.dfm}

uses Invoice.Controller.DataModule, Invoice.Model.Entity.Product;

procedure TFormProduct.FormCreate(Sender: TObject);
begin
     try
          FEntity := TModelEntityProduct.New(DataModuleLocal.GetConnection);
     except
          on E: Exception do
               raise Exception.Create(E.Message);
     end;
end;

procedure TFormProduct.FormShow(Sender: TObject);
begin
     try
          FEntity.List(DataSource);
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
