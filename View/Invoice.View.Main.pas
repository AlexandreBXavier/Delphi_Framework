unit Invoice.View.Main;

interface

uses
     Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
     Vcl.Controls, Vcl.Forms, Vcl.Dialogs, System.Actions, Vcl.ActnList, Vcl.Menus, System.UITypes,
     System.ImageList, Vcl.ImgList, Vcl.ComCtrls;

type
     TfrmMain = class(TForm)
          MainMenu: TMainMenu;
          ActionList: TActionList;
          ActionProduct: TAction;
          ImageList: TImageList;
          StatusBar: TStatusBar;
          procedure FormClose(Sender: TObject; var Action: TCloseAction);
          procedure FormShow(Sender: TObject);
          procedure ActionProductExecute(Sender: TObject);
          procedure FormResize(Sender: TObject);
          procedure FormCreate(Sender: TObject);
     private
          { Private declarations }
          FServerName: String;
          FDatabaseName: String;
          FUserName: String;
          FUserPassword: String;
          //
          procedure SetTitle;
          procedure SetStatus;
          procedure SetConfig;
     public
          { Public declarations }
     end;

var
     frmMain: TfrmMain;

implementation

{$R *.dfm}

uses Invoice.View.Product, Invoice.Controller.AppInfo.Factory, Invoice.Controller.WinInfo.Factory, Invoice.Controller.IniFile.Factory;

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

procedure TfrmMain.FormCreate(Sender: TObject);
begin
     SetConfig;
end;

procedure TfrmMain.FormResize(Sender: TObject);
begin
     StatusBar.Panels[3].Width := Width - (StatusBar.Panels[0].Width + StatusBar.Panels[1].Width + StatusBar.Panels[2].Width);
end;

procedure TfrmMain.FormShow(Sender: TObject);
begin
     SetTitle;
     //
     SetStatus;
end;

procedure TfrmMain.SetStatus;
begin
     StatusBar.Panels[0].Text := 'Computer: ' + TControllerWinInfoFactory.New.Default.ComputerName;
     StatusBar.Panels[1].Text := 'User: ' + TControllerWinInfoFactory.New.Default.UserName;
     StatusBar.Panels[2].Text := 'Version ' + TControllerAppInfoFactory.New.Default.FileVersion;
     StatusBar.Panels[3].Text := 'Welcome to ' + Application.Title;
end;

procedure TfrmMain.SetTitle;
begin
     Caption := TControllerAppInfoFactory.New.Default.CompanyName + ' - ' + Application.Title;
end;

procedure TfrmMain.SetConfig;
begin
     FServerName := TControllerIniFileFactory.New.Default.InputKey('Server', 'ServerName', '<Server Name>', False);
     FDatabaseName := TControllerIniFileFactory.New.Default.InputKey('Server', 'DatabaseName', '<Database Name>', False);
     FUserName := TControllerIniFileFactory.New.Default.InputKey('Server', 'UserName', '<User Name>', False);
     FUserPassword := TControllerIniFileFactory.New.Default.InputKey('Server', 'UserPassword', '<User Password>', True);
end;

end.
