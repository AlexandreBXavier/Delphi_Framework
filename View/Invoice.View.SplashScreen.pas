unit Invoice.View.SplashScreen;

interface

uses
     Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
     Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Imaging.pngimage;

type
     TFormSplashScreen = class(TForm)
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
     FormSplashScreen: TFormSplashScreen;

implementation

{$R *.dfm}

uses Invoice.Controller.AppInfo.Factory;

procedure TFormSplashScreen.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     Action := caFree;
end;

procedure TFormSplashScreen.FormShow(Sender: TObject);
begin
     SetLabel;
     //
     Timer.Enabled := True;
end;

procedure TFormSplashScreen.SetLabel;
begin
     LabelSoftware.Caption := Application.Title;
     LabelDeveloper.Caption := TControllerAppInfoFactory.New.Default.CompanyName;
     LabelVersion.Caption := 'Version ' + TControllerAppInfoFactory.New.Default.FileVersion;
end;

procedure TFormSplashScreen.TimerTimer(Sender: TObject);
begin
     Close;
end;

end.
