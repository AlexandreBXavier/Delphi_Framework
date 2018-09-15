unit Invoice.View.Main;

interface

uses
     Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
     Vcl.Controls, Vcl.Forms, Vcl.Dialogs, System.Actions, Vcl.ActnList, Vcl.Menus, System.UITypes,
     System.ImageList, Vcl.ImgList;

type
     TfrmMain = class(TForm)
          MainMenu: TMainMenu;
          ActionList: TActionList;
          ActionProduct: TAction;
          ImageList: TImageList;
          procedure FormClose(Sender: TObject; var Action: TCloseAction);
          procedure FormShow(Sender: TObject);
    procedure ActionProductExecute(Sender: TObject);
     private
          { Private declarations }
     public
          { Public declarations }
     end;

var
     frmMain: TfrmMain;

implementation

{$R *.dfm}

uses Invoice.Model.DataModule, Invoice.View.Product;

procedure TfrmMain.ActionProductExecute(Sender: TObject);
begin
     frmProduct := TfrmProduct.Create(Self);
     //
     frmProduct.ShowModal;
end;

procedure TfrmMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     if (MessageDlg('Do you really want to close?', mtConfirmation, [mbYes, mbNo], 0) = mrYES) then
          Action := caFree
     else
          Action := caNone;
end;

procedure TfrmMain.FormShow(Sender: TObject);
begin
     Caption := frmDataModule.GetAppInfo('CompanyName') + ' - ' + Application.Title;
end;

end.
