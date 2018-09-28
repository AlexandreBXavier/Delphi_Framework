unit Invoice.View.Customer;

interface

uses
     Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
     Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.ExtCtrls, Vcl.DBCtrls, Vcl.Grids, Vcl.DBGrids,
     Vcl.ComCtrls, Invoice.Model.Interfaces, Invoice.View.Template.Register,
  Vcl.StdCtrls;

type
     TFormCustomer = class(TFormTemplateRegister)
          function GetEntity: iEntity; override;
     private
          { Private declarations }
     public
          { Public declarations }
     end;

var
     FormCustomer: TFormCustomer;

implementation

{$R *.dfm}

uses Invoice.Controller.DataModule, Invoice.Model.Entity.Customer;

function TFormCustomer.GetEntity: iEntity;
begin
     Result := TModelEntityCustomer.New(DataModuleLocal.GetConnection);
end;

Initialization

RegisterClass(TFormCustomer);

Finalization

UnRegisterClass(TFormCustomer);

end.
