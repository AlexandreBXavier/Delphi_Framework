unit Invoice.View.Customer;

interface

uses
     Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
     Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.ComCtrls, Vcl.ExtCtrls,
     Vcl.DBCtrls;

type
     TFormCustomer = class(TForm)
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
     FormCustomer: TFormCustomer;

implementation

{$R *.dfm}

procedure TFormCustomer.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     Action := caFree;
end;

Initialization

RegisterClass(TFormCustomer);

Finalization

UnRegisterClass(TFormCustomer);

end.
