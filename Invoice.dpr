program Invoice;

uses
  Vcl.Themes,
  Vcl.Styles,
  Vcl.Forms,
  Vcl.Dialogs,
  System.SysUtils,
  Winapi.Windows,
  Invoice.View.Main in 'View\Invoice.View.Main.pas' {frmMain},
  Invoice.View.SplashScreen in 'View\Invoice.View.SplashScreen.pas' {frmSplashScreen},
  Invoice.View.Product in 'View\Invoice.View.Product.pas' {frmProduct},
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
  Invoice.Model.Windows in 'Model\Windows\Invoice.Model.Windows.pas',
  Invoice.Model.Windows.Interfaces in 'Model\Windows\Invoice.Model.Windows.Interfaces.pas';

{$R *.res}

var
     SystemName: PChar;

begin
     SystemName := 'Invoice Software';
     CreateMutex(Nil, False, SystemName);

     // Verify that the executable has already been started ...
     if (GetLastError <> ERROR_ALREADY_EXISTS) then
     begin
          Application.Initialize;
          Application.MainFormOnTaskbar := True;
          // TStyleManager.TrySetStyle('Windows10');
          Application.Title := 'Invoice Software';
          //
          try
               frmSplashScreen := TfrmSplashScreen.Create(Application);
          finally
               frmSplashScreen.Show;
          end;
          //
          Application.ProcessMessages;
          //
          Application.CreateForm(TfrmMain, frmMain);
  //
          Application.Run;
     end
     else
          SendMessage(HWND_BROADCAST, RegisterWindowMessage(SystemName), 0, 0);

end.
