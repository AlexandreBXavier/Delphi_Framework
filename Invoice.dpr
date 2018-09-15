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
  Invoice.Model.DataModule in 'Model\Invoice.Model.DataModule.pas' {frmDataModule: TDataModule},
  Invoice.View.Product in 'View\Invoice.View.Product.pas' {frmProduct},
  Invoice.Model.Product in 'Model\Entity\Invoice.Model.Product.pas',
  Invoice.Model.Customer in 'Model\Entity\Invoice.Model.Customer.pas',
  Invoice.Model.OrderPayment in 'Model\Entity\Invoice.Model.OrderPayment.pas',
  Invoice.Model.Order in 'Model\Entity\Invoice.Model.Order.pas',
  Invoice.Model.OrderProduct in 'Model\Entity\Invoice.Model.OrderProduct.pas',
  Invoice.Model.TypePayment in 'Model\Entity\Invoice.Model.TypePayment.pas';

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
          Application.CreateForm(TfrmDataModule, frmDataModule);
          try
               frmSplashScreen := TfrmSplashScreen.Create(Application);
               //
               frmSplashScreen.Show;
          finally
               Application.ProcessMessages;
               //
               Application.CreateForm(TfrmMain, frmMain);
		end;
          //
          Application.Run;
     end
     else
          SendMessage(HWND_BROADCAST, RegisterWindowMessage(SystemName), 0, 0);

end.
