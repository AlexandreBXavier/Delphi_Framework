unit Invoice.View.TypePayment;

interface

uses
     Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
     Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.ExtCtrls, Vcl.DBCtrls, Vcl.Grids, Vcl.DBGrids,
     Vcl.ComCtrls, Vcl.StdCtrls, Invoice.Model.Interfaces, Invoice.View.Template.Register;

type
     TFormTypePayment = class(TFormTemplateRegister)
          function GetEntity: iEntity; override;
     private
          { Private declarations }
     public
          { Public declarations }
     end;

var
     FormTypePayment: TFormTypePayment;

implementation

{$R *.dfm}

uses Invoice.Controller.DataModule, Invoice.Model.Entity.TypePayment;

{ TFormTypePayment }

function TFormTypePayment.GetEntity: iEntity;
begin
     Result := TModelEntityTypePayment.New(DataModuleLocal.GetConnection);
end;

Initialization

RegisterClass(TFormTypePayment);

Finalization

UnRegisterClass(TFormTypePayment);

end.
