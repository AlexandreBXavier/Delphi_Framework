unit Invoice.View.Product;

interface

uses
     Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
     Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.ExtCtrls, Vcl.DBCtrls, Vcl.Grids, Vcl.DBGrids,
     Vcl.ComCtrls, Vcl.StdCtrls, frxClass, frxDBSet, Vcl.Mask, Invoice.View.Template.Register,
     Invoice.Model.Interfaces;

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

uses Invoice.Controller.DataModule, Invoice.Controller.Facade;

function TFormProduct.GetEntity: iEntity;
begin
     Result := TControllerGeneralFacade.New.EntityFactory.Product(DataModuleLocal.GetConnection);
end;

Initialization

RegisterClass(TFormProduct);

Finalization

UnRegisterClass(TFormProduct);

end.
