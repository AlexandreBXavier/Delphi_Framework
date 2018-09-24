unit Invoice.View.Main;

interface

uses
     Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
     Vcl.Controls, Vcl.Forms, Vcl.Dialogs, System.Actions, Vcl.ComCtrls, Vcl.Menus, System.UITypes,
     Vcl.ActnList, Vcl.PlatformDefaultStyleActnCtrls, Vcl.ActnMan, Vcl.ToolWin, Vcl.ActnCtrls,
     Vcl.Ribbon, Vcl.RibbonLunaStyleActnCtrls, Vcl.RibbonSilverStyleActnCtrls;

type
     TFormMain = class(TForm)
          StatusBar: TStatusBar;
          Ribbon: TRibbon;
          RibbonPageMain: TRibbonPage;
          ActionManager: TActionManager;
          ActionProduct: TAction;
          ActionCustomer: TAction;
          ActionOrder: TAction;
          ActionTypePayment: TAction;
          ActionUser: TAction;
          ActionCloseTabSheet: TAction;
          RibbonGroupProduct: TRibbonGroup;
          RibbonGroupSales: TRibbonGroup;
          RibbonGroupUser: TRibbonGroup;
          PageControl: TPageControl;
          TabWelcome: TTabSheet;
          PopupMenu: TPopupMenu;
          CloseTab: TMenuItem;
          ActionChart: TAction;
          procedure FormClose(Sender: TObject; var Action: TCloseAction);
          procedure FormShow(Sender: TObject);
          procedure FormResize(Sender: TObject);
          procedure FormCreate(Sender: TObject);
          procedure ActionProductExecute(Sender: TObject);
          procedure ActionCustomerExecute(Sender: TObject);
          procedure ActionOrderExecute(Sender: TObject);
          procedure ActionTypePaymentExecute(Sender: TObject);
          procedure ActionCloseTabSheetExecute(Sender: TObject);
          procedure ActionUserExecute(Sender: TObject);
          procedure ActionChartExecute(Sender: TObject);
     private
          { Private declarations }
          procedure SetAction(Sender: TObject; nameForm: String);
          procedure SetTitle;
          procedure SetStatus;
     public
          { Public declarations }
     end;

var
     FormMain: TFormMain;

implementation

{$R *.dfm}

uses Invoice.Controller.DataModule, Invoice.Controller.TabForm.Factory, Invoice.Controller.AppInfo.Factory, Invoice.Controller.WinInfo.Factory, Invoice.Controller.IniFile.Factory, Invoice.Controller.Security.Factory, Invoice.Controller.Connection.Factory, Invoice.Controller.Chart.Factory;

procedure TFormMain.ActionChartExecute(Sender: TObject);
begin
     TAction(Sender).Enabled := False;
     //
     TControllerTabFormFactory.New.Default.ShowForm(TabWelcome, 'FormChart');
     //
     TAction(Sender).Enabled := True;
end;

procedure TFormMain.ActionCloseTabSheetExecute(Sender: TObject);
begin
     if (PageControl.ActivePage <> nil) then
          PageControl.ActivePage.Free;
end;

procedure TFormMain.ActionCustomerExecute(Sender: TObject);
begin
     SetAction(Sender, 'FormCustomer');
end;

procedure TFormMain.ActionOrderExecute(Sender: TObject);
begin
     SetAction(Sender, 'FormOrder');
end;

procedure TFormMain.ActionProductExecute(Sender: TObject);
begin
     SetAction(Sender, 'FormProduct');
end;

procedure TFormMain.ActionTypePaymentExecute(Sender: TObject);
begin
     SetAction(Sender, 'FormTypePayment');
end;

procedure TFormMain.ActionUserExecute(Sender: TObject);
begin
     SetAction(Sender, 'FormUser');
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
     if not DataModuleLocal.Connected then
          Application.Terminate;
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
     //
     ActionChartExecute(Sender);
end;

procedure TFormMain.SetAction(Sender: TObject; nameForm: String);
begin
     TAction(Sender).Enabled := False;
     //
     TControllerTabFormFactory.New.Default.ShowForm(TControllerTabFormFactory.New.Default.CreateTab(TAction(Sender), PageControl), nameForm);
     //
     TAction(Sender).Enabled := True;
end;

procedure TFormMain.SetStatus;
begin
     StatusBar.Panels[0].Text := 'Computer: ' + TControllerWinInfoFactory.New.Default.ComputerName;
     StatusBar.Panels[1].Text := 'User: ' + DataModuleLocal.GetUsername;
     StatusBar.Panels[2].Text := 'Version ' + TControllerAppInfoFactory.New.Default.FileVersion;
     StatusBar.Panels[3].Text := 'Welcome to ' + Application.Title;
end;

procedure TFormMain.SetTitle;
begin
     Caption := TControllerAppInfoFactory.New.Default.CompanyName + ' - ' + Application.Title;
     //
     Ribbon.Caption := Caption;
end;

end.
