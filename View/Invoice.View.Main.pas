unit Invoice.View.Main;

interface

uses
     Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
     Vcl.Controls, Vcl.Forms, Vcl.Dialogs, System.Actions, Vcl.ActnList, Vcl.Menus, System.UITypes,
     System.ImageList, Vcl.ImgList, Invoice.Model.Windows.Interfaces, Invoice.Model.Windows;

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
          FModelWindows: iModelWindows;
          procedure SetModelWindows(const Value: iModelWindows);
          procedure SetTitle;
     public
          { Public declarations }
          property ModelWindows: iModelWindows read FModelWindows write SetModelWindows;
     end;

var
     frmMain: TfrmMain;

implementation

{$R *.dfm}

uses Invoice.View.Product;

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
     SetTitle;
end;

procedure TfrmMain.SetModelWindows(const Value: iModelWindows);
begin
     FModelWindows := Value;
end;

procedure TfrmMain.SetTitle;
begin
     ModelWindows := TModelWindows.Create;
     //
     Caption := ModelWindows.GetAppInfo('CompanyName') + ' - ' + Application.Title;
end;

end.
