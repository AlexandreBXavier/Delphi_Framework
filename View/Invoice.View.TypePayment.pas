unit Invoice.View.TypePayment;

interface

uses
     Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
     Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.ComCtrls, Vcl.ExtCtrls,
     Vcl.DBCtrls;

type
     TfrmTypePayment = class(TForm)
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
     frmTypePayment: TfrmTypePayment;

implementation

{$R *.dfm}

procedure TfrmTypePayment.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     Action := caFree;
end;

Initialization

RegisterClass(TfrmTypePayment);

Finalization

UnRegisterClass(TfrmTypePayment);

end.
