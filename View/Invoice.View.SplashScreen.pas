unit Invoice.View.SplashScreen;

interface

uses
     Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
     Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Imaging.pngimage;

type
     TfrmSplashScreen = class(TForm)
          Timer: TTimer;
          panelBackgound: TPanel;
          LabelSoftware: TLabel;
          imageBackground: TImage;
          LabelDeveloper: TLabel;
          LabelVersion: TLabel;
          procedure FormClose(Sender: TObject; var Action: TCloseAction);
          procedure TimerTimer(Sender: TObject);
          procedure FormShow(Sender: TObject);
     private
          { Private declarations }
          procedure SetLabel;
     public
          { Public declarations }
     end;

var
     frmSplashScreen: TfrmSplashScreen;

implementation

{$R *.dfm}

uses Invoice.Controller.AppInfo.Factory;

procedure TfrmSplashScreen.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     Action := caFree;
end;

procedure TfrmSplashScreen.FormShow(Sender: TObject);
begin
     SetLabel;
     //
     Timer.Enabled := True;
end;

procedure TfrmSplashScreen.SetLabel;
begin
     LabelSoftware.Caption := Application.Title;
     LabelDeveloper.Caption := TControllerAppInfoFactory.New.Default.CompanyName;
     LabelVersion.Caption := 'Version ' + TControllerAppInfoFactory.New.Default.FileVersion;
end;

procedure TfrmSplashScreen.TimerTimer(Sender: TObject);
begin
     Close;
end;

end.
