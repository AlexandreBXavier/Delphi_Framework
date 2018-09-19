unit Invoice.View.Main;

interface

uses
     Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
     Vcl.Controls, Vcl.Forms, Vcl.Dialogs, System.Actions, Vcl.ActnList, Vcl.Menus, System.UITypes,
     System.ImageList, Vcl.ImgList, Vcl.ComCtrls, Vcl.PlatformDefaultStyleActnCtrls, Vcl.ActnMan,
     Vcl.ToolWin, Vcl.ActnCtrls, Vcl.Ribbon, Vcl.RibbonLunaStyleActnCtrls, Vcl.RibbonSilverStyleActnCtrls,
     Vcl.OleCtrls, SHDocVw, Vcl.AppEvnts;

type
     TFormMain = class(TForm)
          StatusBar: TStatusBar;
          Ribbon: TRibbon;
          RibbonPageMain: TRibbonPage;
          RibbonGroupProduct: TRibbonGroup;
          ActionManager: TActionManager;
          ActionProduct: TAction;
          ImageList32_E: TImageList;
          ImageList32_D: TImageList;
          ActionCustomer: TAction;
          ActionOrder: TAction;
          ActionTypePayment: TAction;
          RibbonGroup1: TRibbonGroup;
          PageControl: TPageControl;
          TabWelcome: TTabSheet;
          ImageListTabs: TImageList;
          WebBrowser: TWebBrowser;
          ApplicationEvents: TApplicationEvents;
          procedure FormClose(Sender: TObject; var Action: TCloseAction);
          procedure FormShow(Sender: TObject);
          procedure FormResize(Sender: TObject);
          procedure FormCreate(Sender: TObject);
          procedure ActionProductExecute(Sender: TObject);
          procedure ActionCustomerExecute(Sender: TObject);
          procedure ActionOrderExecute(Sender: TObject);
          procedure ActionTypePaymentExecute(Sender: TObject);
          procedure ApplicationEventsException(Sender: TObject; E: Exception);
     private
          { Private declarations }
          FServerName: String;
          FDatabaseName: String;
          FUserName: String;
          FUserPassword: String;
          //
          procedure SetTitle;
          procedure SetStatus;
          procedure SetWebPage(WebAddress: String);
          procedure SetConfig;
     public
          { Public declarations }
     end;

var
     FormMain: TFormMain;

implementation

{$R *.dfm}

uses Invoice.Controller.TabForm.Factory, Invoice.Controller.AppInfo.Factory, Invoice.Controller.WinInfo.Factory, Invoice.Controller.IniFile.Factory, Invoice.Controller.Security.Factory;

procedure TFormMain.ActionCustomerExecute(Sender: TObject);
begin
     TAction(Sender).Enabled := False;
     //
     TControllerTabFormFactory.New.Default.ShowForm(TControllerTabFormFactory.New.Default.CreateTab(TAction(Sender), PageControl), 'FormCustomer');
     //
     TAction(Sender).Enabled := True;
end;

procedure TFormMain.ActionOrderExecute(Sender: TObject);
begin
     TAction(Sender).Enabled := False;
     //
     TControllerTabFormFactory.New.Default.ShowForm(TControllerTabFormFactory.New.Default.CreateTab(TAction(Sender), PageControl), 'FormOrder');
     //
     TAction(Sender).Enabled := True;
end;

procedure TFormMain.ActionProductExecute(Sender: TObject);
begin
     TAction(Sender).Enabled := False;
     //
     TControllerTabFormFactory.New.Default.ShowForm(TControllerTabFormFactory.New.Default.CreateTab(TAction(Sender), PageControl), 'FormProduct');
     //
     TAction(Sender).Enabled := True;
end;

procedure TFormMain.ActionTypePaymentExecute(Sender: TObject);
begin
     TAction(Sender).Enabled := False;
     //
     TControllerTabFormFactory.New.Default.ShowForm(TControllerTabFormFactory.New.Default.CreateTab(TAction(Sender), PageControl), 'FormTypePayment');
     //
     TAction(Sender).Enabled := True;
end;

procedure TFormMain.ApplicationEventsException(Sender: TObject; E: Exception);
begin
     TControllerSecurityFactory.New.Default.AddLog(E.Message);
end;

procedure TFormMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     if (MessageDlg('Do you really want to close?', mtConfirmation, [mbYes, mbNo], 0) = mrYES) then
          Action := caFree
     else
          Action := caNone;
end;

procedure TFormMain.FormCreate(Sender: TObject);
begin
     SetWebPage(TControllerAppInfoFactory.New.Default.LegalTrademarks);
     //
     SetConfig;
end;

procedure TFormMain.FormResize(Sender: TObject);
begin
     StatusBar.Panels[3].Width := Width - (StatusBar.Panels[0].Width + StatusBar.Panels[1].Width + StatusBar.Panels[2].Width);
end;

procedure TFormMain.FormShow(Sender: TObject);
begin
     SetTitle;
     //
     SetStatus;
end;

procedure TFormMain.SetStatus;
begin
     StatusBar.Panels[0].Text := 'Computer: ' + TControllerWinInfoFactory.New.Default.ComputerName;
     StatusBar.Panels[1].Text := 'User: ' + TControllerWinInfoFactory.New.Default.UserName;
     StatusBar.Panels[2].Text := 'Version ' + TControllerAppInfoFactory.New.Default.FileVersion;
     StatusBar.Panels[3].Text := 'Welcome to ' + Application.Title;
end;

procedure TFormMain.SetTitle;
begin
     Caption := TControllerAppInfoFactory.New.Default.CompanyName + ' - ' + Application.Title;
     //
     Ribbon.Caption := Caption;
end;

procedure TFormMain.SetWebPage(WebAddress: String);
begin
     WebBrowser.Navigate(WebAddress);
end;

procedure TFormMain.SetConfig;
begin
     FServerName := TControllerIniFileFactory.New.Default.InputKey('Server', 'ServerName', '<Server Name>', False);
     FDatabaseName := TControllerIniFileFactory.New.Default.InputKey('Server', 'DatabaseName', '<Database Name>', False);
     FUserName := TControllerIniFileFactory.New.Default.InputKey('Server', 'UserName', '<User Name>', False);
     FUserPassword := TControllerIniFileFactory.New.Default.InputKey('Server', 'UserPassword', '<User Password>', True);
end;

end.
