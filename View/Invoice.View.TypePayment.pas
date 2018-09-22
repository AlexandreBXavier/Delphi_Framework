unit Invoice.View.TypePayment;

interface

uses
     Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
     Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.ExtCtrls, Vcl.DBCtrls, Vcl.Grids, Vcl.DBGrids,
     Vcl.ComCtrls, Vcl.StdCtrls, Invoice.Model.Interfaces, Invoice.View.Template.Register;

type
     TFormTypePayment = class(TFormTemplateRegister)
          procedure FormCreate(Sender: TObject);
     private
          { Private declarations }
          FEntity: iEntity;
     public
          { Public declarations }
     end;

var
     FormTypePayment: TFormTypePayment;

implementation

{$R *.dfm}

uses Invoice.Controller.DataModule, Invoice.Model.Entity.TypePayment;

procedure TFormTypePayment.FormCreate(Sender: TObject);
begin
     try
          FEntity := TModelEntityTypePayment.New(DataModuleLocal.GetConnection);
          //
          FEntity.List;
          //
          DataSource.DataSet := FEntity.DataSet;
     except
          on E: Exception do
               raise Exception.Create(E.Message);
     end;
end;

Initialization

RegisterClass(TFormTypePayment);

Finalization

UnRegisterClass(TFormTypePayment);

end.
