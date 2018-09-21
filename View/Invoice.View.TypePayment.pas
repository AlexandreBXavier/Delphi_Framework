unit Invoice.View.TypePayment;

interface

uses
     Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
     Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.ComCtrls, Vcl.ExtCtrls,
     Vcl.DBCtrls, Invoice.Model.Interfaces;

type
     TFormTypePayment = class(TForm)
          DBNavigator: TDBNavigator;
          PageControl: TPageControl;
          TabList: TTabSheet;
          TabInfo: TTabSheet;
          DataSource: TDataSource;
          DBGridRecords: TDBGrid;
          procedure FormClose(Sender: TObject; var Action: TCloseAction);
          procedure FormCreate(Sender: TObject);
          procedure FormDestroy(Sender: TObject);
          procedure FormShow(Sender: TObject);
     private
          { Private declarations }
          FTypePayment: iEntity;
     public
          { Public declarations }
     end;

var
     FormTypePayment: TFormTypePayment;

implementation

{$R *.dfm}

uses Invoice.Controller.DataModule, Invoice.Model.Entity.TypePayment, Invoice.Controller.Connection.Factory;

procedure TFormTypePayment.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     Action := caFree;
end;

procedure TFormTypePayment.FormCreate(Sender: TObject);
begin
     try
          FTypePayment := TModelEntityTypePayment.New(DataModuleLocal.GetConnection);
     except
          on E: Exception do
               raise Exception.Create(E.Message);
     end;
end;

procedure TFormTypePayment.FormDestroy(Sender: TObject);
begin
     FreeAndNil(FTypePayment);
end;

procedure TFormTypePayment.FormShow(Sender: TObject);
begin
     try
          FTypePayment.List(DataSource);
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
