program Invoice;

uses
  Vcl.Themes,
  Vcl.Styles,
  Vcl.Forms,
  Vcl.Dialogs,
  System.Classes,
  System.SysUtils,
  Winapi.Windows,
  Invoice.View.SplashScreen in 'View\Invoice.View.SplashScreen.pas' {FormSplashScreen},
  Invoice.View.LogIn in 'View\Invoice.View.LogIn.pas' {FormLogin},
  Invoice.View.Main in 'View\Invoice.View.Main.pas' {FormMain},
  Invoice.View.Customer in 'View\Invoice.View.Customer.pas' {FormCustomer},
  Invoice.View.TypePayment in 'View\Invoice.View.TypePayment.pas' {FormTypePayment},
  Invoice.View.Product in 'View\Invoice.View.Product.pas' {FormProduct},
  Invoice.View.Order in 'View\Invoice.View.Order.pas' {FormOrder},
  Invoice.Model.Product in 'Model\Entity\Invoice.Model.Product.pas',
  Invoice.Model.Customer in 'Model\Entity\Invoice.Model.Customer.pas',
  Invoice.Model.OrderPayment in 'Model\Entity\Invoice.Model.OrderPayment.pas',
  Invoice.Model.Order in 'Model\Entity\Invoice.Model.Order.pas',
  Invoice.Model.OrderProduct in 'Model\Entity\Invoice.Model.OrderProduct.pas',
  Invoice.Model.TypePayment in 'Model\Entity\Invoice.Model.TypePayment.pas',
  Invoice.Model.Connections.Factory.Connection in 'Model\Connections\Invoice.Model.Connections.Factory.Connection.pas',
  Invoice.Model.Connections.Factory.DataSet in 'Model\Connections\Invoice.Model.Connections.Factory.DataSet.pas',
  Invoice.Model.Connections.Interfaces in 'Model\Connections\Invoice.Model.Connections.Interfaces.pas',
  Invoice.Model.Connections.ConnectionFiredac in 'Model\Connections\Firedac\Invoice.Model.Connections.ConnectionFiredac.pas',
  Invoice.Model.Connections.TableFiredac in 'Model\Connections\Firedac\Invoice.Model.Connections.TableFiredac.pas',
  Invoice.Controller.Interfaces in 'Controller\Invoice.Controller.Interfaces.pas',
  Invoice.Controller.AppInfo.Default in 'Controller\Invoice.Controller.AppInfo.Default.pas',
  Invoice.Controller.AppInfo.Factory in 'Controller\Invoice.Controller.AppInfo.Factory.pas',
  Invoice.Controller.WinInfo.Default in 'Controller\Invoice.Controller.WinInfo.Default.pas',
  Invoice.Controller.WinInfo.Factory in 'Controller\Invoice.Controller.WinInfo.Factory.pas',
  Invoice.Controller.IniFile.Default in 'Controller\Invoice.Controller.IniFile.Default.pas',
  Invoice.Controller.IniFile.Factory in 'Controller\Invoice.Controller.IniFile.Factory.pas',
  Invoice.Controller.Security.Default in 'Controller\Invoice.Controller.Security.Default.pas',
  Invoice.Controller.TabForm.Default in 'Controller\Invoice.Controller.TabForm.Default.pas',
  Invoice.Controller.TabForm.Factory in 'Controller\Invoice.Controller.TabForm.Factory.pas',
  Invoice.Controller.Security.Factory in 'Controller\Invoice.Controller.Security.Factory.pas';

{$R *.res}

var
     SystemName: PChar;

begin
     SystemName := 'Invoice Software ®';
     CreateMutex(Nil, False, SystemName);
     // Verify that the executable has already been started ...
     if (GetLastError <> ERROR_ALREADY_EXISTS) then
     begin
          Application.Initialize;
          Application.MainFormOnTaskbar := True;
          Application.Title := 'Invoice Software ®';
          // Show Splash Screen...
          try
               FormSplashScreen := TFormSplashScreen.Create(Application);
          finally
               FormSplashScreen.ShowModal;
          end;
          // Show Login Screen...
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
