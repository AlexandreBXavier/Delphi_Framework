unit Invoice.View.TypePayment;

interface

uses
     Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
     Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.ExtCtrls, Vcl.DBCtrls, Vcl.Grids, Vcl.DBGrids,
     Vcl.ComCtrls, Vcl.StdCtrls, frxClass, frxDBSet, Vcl.Mask, Invoice.View.Template.Register,
     Invoice.Controller.Interfaces;

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

uses Invoice.Controller.DataModule, Invoice.Controller.Facade;

{ TFormTypePayment }

function TFormTypePayment.GetEntity: iEntity;
begin
     Result := TControllerGeneralFacade.New.EntityFactory.TypePayment(DataModuleLocal.GetConnection);
end;

Initialization

RegisterClass(TFormTypePayment);

Finalization

UnRegisterClass(TFormTypePayment);

end.
