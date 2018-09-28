unit Invoice.View.Product;

interface

uses
     Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
     Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.ExtCtrls, Vcl.DBCtrls, Vcl.Grids, Vcl.DBGrids,
     Vcl.ComCtrls, Invoice.Model.Interfaces, Invoice.View.Template.Register,
  Vcl.StdCtrls;

type
     TFormProduct = class(TFormTemplateRegister)
          function GetEntity: iEntity; override;
     private
          { Private declarations }
     public
          { Public declarations }
     end;

var
     FormProduct: TFormProduct;

implementation

{$R *.dfm}

uses Invoice.Controller.DataModule, Invoice.Model.Entity.Product;

function TFormProduct.GetEntity: iEntity;
begin
     Result := TModelEntityProduct.New(DataModuleLocal.GetConnection);
end;

Initialization

RegisterClass(TFormProduct);

Finalization

UnRegisterClass(TFormProduct);

end.
