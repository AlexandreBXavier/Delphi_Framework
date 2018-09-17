unit Invoice.View.Main;

interface

uses
     Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
     Vcl.Controls, Vcl.Forms, Vcl.Dialogs, System.Actions, Vcl.ActnList, Vcl.Menus, System.UITypes,
     System.ImageList, Vcl.ImgList, Vcl.ComCtrls, Vcl.PlatformDefaultStyleActnCtrls, Vcl.ActnMan,
     Vcl.ToolWin, Vcl.ActnCtrls, Vcl.Ribbon, Vcl.RibbonLunaStyleActnCtrls, Vcl.RibbonSilverStyleActnCtrls;

type
     TfrmMain = class(TForm)
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
          procedure FormClose(Sender: TObject; var Action: TCloseAction);
          procedure FormShow(Sender: TObject);
          procedure FormResize(Sender: TObject);
          procedure FormCreate(Sender: TObject);
          procedure ActionProductExecute(Sender: TObject);
          procedure ActionCustomerExecute(Sender: TObject);
          procedure ActionOrderExecute(Sender: TObject);
          procedure ActionTypePaymentExecute(Sender: TObject);
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
          procedure SetTabSheet(Sender: TObject; NameForm: String);
          procedure SetTabSheetWithForm(aTabSheet: TTabSheet; NameForm: String);
     public
          { Public declarations }
     end;

var
     frmMain: TfrmMain;

implementation

{$R *.dfm}

uses Invoice.View.Product, Invoice.Controller.AppInfo.Factory, Invoice.Controller.WinInfo.Factory, Invoice.Controller.IniFile.Factory;

procedure TfrmMain.SetTabSheet(Sender: TObject; NameForm: String);
var
     aTabSheet: TTabSheet;
     TabName: String;
begin
     TAction(Sender).Enabled := False;
     //
     TabName := 'Tab' + TAction(Sender).Name;
     //
     aTabSheet := PageControl.FindComponent(TabName) as TTabSheet;
     //
     if not Assigned(aTabSheet) then
     begin
          aTabSheet := TTabSheet.Create(PageControl);
          aTabSheet.Name := TabName;
          aTabSheet.Caption := TAction(Sender).Caption;
          aTabSheet.PageControl := PageControl;
          aTabSheet.ImageIndex := 0;
          aTabSheet.Hint := '';
     end;
     //
     SetTabSheetWithForm(aTabSheet, NameForm);
     //
     PageControl.ActivePage := aTabSheet;
     //
     TAction(Sender).Enabled := True;
end;

procedure TfrmMain.SetTabSheetWithForm(aTabSheet: TTabSheet; NameForm: String);
var
     NewForm: TFormClass;
     aForm: TForm;
begin
     if (aTabSheet.Hint = '') and (NameForm <> '') then
     begin
          NewForm := TFormClass(FindClass('T' + NameForm));
          //
          aForm := NewForm.Create(Self);
          aForm.Parent := aTabSheet;
          aForm.BorderStyle := bsNone;
          aForm.Align := alClient;
          aForm.Visible := True;
          //
          aTabSheet.Hint := NameForm;
     end;
end;

procedure TfrmMain.ActionCustomerExecute(Sender: TObject);
begin
     SetTabSheet(Sender, '');
end;

procedure TfrmMain.ActionOrderExecute(Sender: TObject);
begin
     SetTabSheet(Sender, '');
end;

procedure TfrmMain.ActionProductExecute(Sender: TObject);
begin
     SetTabSheet(Sender, 'frmProduct');
end;

procedure TfrmMain.ActionTypePaymentExecute(Sender: TObject);
begin
     SetTabSheet(Sender, '');
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
     //
     RegisterClass(TfrmProduct);
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
     //
     Ribbon.Caption := Caption;
end;

procedure TfrmMain.SetConfig;
begin
     FServerName := TControllerIniFileFactory.New.Default.InputKey('Server', 'ServerName', '<Server Name>', False);
     FDatabaseName := TControllerIniFileFactory.New.Default.InputKey('Server', 'DatabaseName', '<Database Name>', False);
     FUserName := TControllerIniFileFactory.New.Default.InputKey('Server', 'UserName', '<User Name>', False);
     FUserPassword := TControllerIniFileFactory.New.Default.InputKey('Server', 'UserPassword', '<User Password>', True);
end;

end.
