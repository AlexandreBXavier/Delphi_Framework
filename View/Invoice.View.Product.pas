unit Invoice.View.Product;

interface

uses
     Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
     Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.ComCtrls, Vcl.ExtCtrls,
     Vcl.DBCtrls;

type
     TFormProduct = class(TForm)
          DBNavigator: TDBNavigator;
          PageControl: TPageControl;
          TabList: TTabSheet;
          TabInfo: TTabSheet;
          DataSource: TDataSource;
          DBGridRecords: TDBGrid;
          procedure FormClose(Sender: TObject; var Action: TCloseAction);
     private
          { Private declarations }
     public
          { Public declarations }
     end;

var
     FormProduct: TFormProduct;

implementation

{$R *.dfm}

procedure TFormProduct.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     Action := caFree;
end;

Initialization

RegisterClass(TFormProduct);

Finalization

UnRegisterClass(TFormProduct);

end.
