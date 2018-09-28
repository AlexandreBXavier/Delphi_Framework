unit Invoice.View.User;

interface

uses
     Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
     Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.ExtCtrls, Vcl.DBCtrls, Vcl.Grids, Vcl.DBGrids,
     Vcl.ComCtrls, Vcl.StdCtrls, Invoice.Model.Interfaces, Invoice.View.Template.Register;

type
     TFormUser = class(TFormTemplateRegister)
          function GetEntity: iEntity; override;
     private
          { Private declarations }
     public
          { Public declarations }
     end;

var
     FormUser: TFormUser;

implementation

{$R *.dfm}

uses Invoice.Controller.DataModule, Invoice.Model.Entity.User;

function TFormUser.GetEntity: iEntity;
begin
     Result := TModelEntityUser.New(DataModuleLocal.GetConnection);
end;

Initialization

RegisterClass(TFormUser);

Finalization

UnRegisterClass(TFormUser);

end.
