program Invoice;

uses
  Vcl.Themes,
  Vcl.Styles,
  Vcl.Forms,
  Vcl.Dialogs,
  System.Classes,
  System.SysUtils,
  Winapi.Windows,
  Invoice.View.Chart in 'View\Invoice.View.Chart.pas' {FormChart},
  Invoice.View.SplashScreen in 'View\Invoice.View.SplashScreen.pas' {FormSplashScreen},
  Invoice.View.Template.Register in 'View\Template\Invoice.View.Template.Register.pas' {FormTemplateRegister},
  Invoice.View.LogIn in 'View\Invoice.View.LogIn.pas' {FormLogin},
  Invoice.View.Main in 'View\Invoice.View.Main.pas' {FormMain},
  Invoice.View.Order in 'View\Invoice.View.Order.pas' {FormOrder},
  Invoice.View.OrderProduct in 'View\Invoice.View.OrderProduct.pas' {FormOrderProduct},
  Invoice.View.Product in 'View\Invoice.View.Product.pas' {FormProduct},
  Invoice.View.Customer in 'View\Invoice.View.Customer.pas' {FormCustomer},
  Invoice.View.TypePayment in 'View\Invoice.View.TypePayment.pas' {FormTypePayment},
  Invoice.View.User in 'View\Invoice.View.User.pas' {FormUser},
  Invoice.Controller.DataModule in 'Controller\Invoice.Controller.DataModule.pas' {DataModuleLocal: TDataModule},
  Invoice.Controller.Interfaces in 'Controller\Invoice.Controller.Interfaces.pas',
  Invoice.Controller.AppInfo.Default in 'Controller\Info\Invoice.Controller.AppInfo.Default.pas',
  Invoice.Controller.AppInfo.Factory in 'Controller\Info\Invoice.Controller.AppInfo.Factory.pas',
  Invoice.Controller.WinInfo.Default in 'Controller\Info\Invoice.Controller.WinInfo.Default.pas',
  Invoice.Controller.WinInfo.Factory in 'Controller\Info\Invoice.Controller.WinInfo.Factory.pas',
  Invoice.Controller.IniFile.Default in 'Controller\Info\Invoice.Controller.IniFile.Default.pas',
  Invoice.Controller.IniFile.Factory in 'Controller\Info\Invoice.Controller.IniFile.Factory.pas',
  Invoice.Controller.Security.Default in 'Controller\Info\Invoice.Controller.Security.Default.pas',
  Invoice.Controller.Security.Factory in 'Controller\Info\Invoice.Controller.Security.Factory.pas',
  Invoice.Controller.TabForm.Default in 'Controller\Info\Invoice.Controller.TabForm.Default.pas',
  Invoice.Controller.TabForm.Factory in 'Controller\Info\Invoice.Controller.TabForm.Factory.pas',
  Invoice.Controller.Chart.Default in 'Controller\Chart\Invoice.Controller.Chart.Default.pas',
  Invoice.Controller.Chart.Factory in 'Controller\Chart\Invoice.Controller.Chart.Factory.pas',
  Invoice.Controller.Query.Factory in 'Controller\DB\Invoice.Controller.Query.Factory.pas',
  Invoice.Controller.Table.Factory in 'Controller\DB\Invoice.Controller.Table.Factory.pas',
  Invoice.Controller.Entity.Factory in 'Controller\DB\Invoice.Controller.Entity.Factory.pas',
  Invoice.Controller.Connection.Factory in 'Controller\DB\Invoice.Controller.Connection.Factory.pas',
  Invoice.Controller.Facade in 'Controller\Invoice.Controller.Facade.pas',
  Invoice.Model.Interfaces in 'Model\Invoice.Model.Interfaces.pas',
  Invoice.Model.Connection.Firedac in 'Model\Connections\Firedac\Invoice.Model.Connection.Firedac.pas',
  Invoice.Model.Query.Firedac in 'Model\Connections\Firedac\Invoice.Model.Query.Firedac.pas',
  Invoice.Model.Table.Firedac in 'Model\Connections\Firedac\Invoice.Model.Table.Firedac.pas',
  Invoice.Model.Entity.Product in 'Model\Entity\Invoice.Model.Entity.Product.pas',
  Invoice.Model.Entity.TypePayment in 'Model\Entity\Invoice.Model.Entity.TypePayment.pas',
  Invoice.Model.Entity.Customer in 'Model\Entity\Invoice.Model.Entity.Customer.pas',
  Invoice.Model.Entity.User in 'Model\Entity\Invoice.Model.Entity.User.pas';

{$R *.res}

var
     SystemName: PChar;
begin
     SystemName := 'Invoice Software �';
     CreateMutex(Nil, False, SystemName);
     // Verify that the executable has already been started ...
     if (GetLastError <> ERROR_ALREADY_EXISTS) then
     begin
          Application.Initialize;
          Application.MainFormOnTaskbar := True;
          Application.Title := 'Invoice Software �';
          ReportMemoryLeaksOnShutdown := True;
          // Show Splash Screen...
          try
               FormSplashScreen := TFormSplashScreen.Create(Application);
          finally
               FormSplashScreen.ShowModal;
          end;
          //
          Application.ProcessMessages;
          // Create Data Module...
          Application.CreateForm(TDataModuleLocal, DataModuleLocal);
          //Show Login Screen...
          try
               FormLogin := TFormLogin.Create(Application);
          finally
               FormLogin.ShowModal;
          end;
          //
          Application.ProcessMessages;
          // Create Main Form...
          Application.CreateForm(TFormMain, FormMain);
          //
          Application.Run;
     end
     else // Display another executable...
          SendMessage(HWND_BROADCAST, RegisterWindowMessage(SystemName), 0, 0);
end.
