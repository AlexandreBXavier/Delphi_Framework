program AppInvoice;

uses
     Vcl.Themes,
     Vcl.Styles,
     Vcl.Forms,
     Vcl.Dialogs,
     System.SysUtils,
     Winapi.Windows,
     Demos.View.Main in 'View\Demos.View.Main.pas' {frmMain} ,
     Demos.View.SplashScreen in 'View\Demos.View.SplashScreen.pas' {frmSplashScreen} ,
     Demos.Model.DataModule in 'Model\Demos.Model.DataModule.pas' {frmDataModule: TDataModule} ,
     Demos.View.Product in 'View\Demos.View.Product.pas' {frmProduct};

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
          // Display Splash Screen...
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
