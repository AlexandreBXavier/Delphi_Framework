unit Invoice.View.Template.Register;

interface

uses
     Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
     Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
     Vcl.ComCtrls, Vcl.ExtCtrls, Vcl.DBCtrls;

type
     TFormTemplateRegister = class(TForm)
          PageControl: TPageControl;
          TabList: TTabSheet;
          DBGridRecords: TDBGrid;
          TabInfo: TTabSheet;
          DataSource: TDataSource;
          DBNavigator: TDBNavigator;
          procedure FormClose(Sender: TObject; var Action: TCloseAction);
     private
          { Private declarations }
     public
          { Public declarations }
     end;

var
     FormTemplateRegister: TFormTemplateRegister;

implementation

{$R *.dfm}

uses Invoice.Controller.DataModule;

procedure TFormTemplateRegister.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     DataSource.DataSet.Close;
     //
     Action := caFree;
end;

end.
