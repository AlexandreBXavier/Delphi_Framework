unit Invoice.View.SplashScreen;

interface

uses
     Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
     Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
     Vcl.Imaging.pngimage, Invoice.Model.Windows.Interfaces, Invoice.Model.Windows;

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
          FModelWindows: iModelWindows;
          procedure SetModelWindows(const Value: iModelWindows);
          procedure SetLabel;
     public
          { Public declarations }
          property ModelWindows: iModelWindows read FModelWindows write SetModelWindows;
     end;

var
     frmSplashScreen: TfrmSplashScreen;

implementation

{$R *.dfm}

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
     ModelWindows := TModelWindows.Create;
     //
     LabelSoftware.Caption := Application.Title;
     LabelDeveloper.Caption := ModelWindows.GetAppInfo('CompanyName');
     LabelVersion.Caption := 'Version ' + ModelWindows.GetAppInfo('FileVersion');
end;

procedure TfrmSplashScreen.SetModelWindows(const Value: iModelWindows);
begin
     FModelWindows := Value;
end;

procedure TfrmSplashScreen.TimerTimer(Sender: TObject);
begin
     Close;
end;

end.
