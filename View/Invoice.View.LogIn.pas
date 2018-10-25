unit Invoice.View.LogIn;

interface

uses
     Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
     Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Imaging.pngimage;

type
     TFormLogin = class(TForm)
          btnCancel: TButton;
          btnLogin: TButton;
          EditPassword: TEdit;
          EditUser: TEdit;
          LabelUser: TLabel;
          LabelPassword: TLabel;
          imageBackground: TImage;
          LabelSoftware: TLabel;
          LabelDeveloper: TLabel;
          LabelVersion: TLabel;
          procedure btnLoginClick(Sender: TObject);
          procedure btnCancelClick(Sender: TObject);
          procedure FormCreate(Sender: TObject);
          procedure FormClose(Sender: TObject; var Action: TCloseAction);
          procedure FormShow(Sender: TObject);
     private
          { Private declarations }
          FLogin: Boolean;
          //
          procedure SetTitle;
          procedure SetLabel;
     public
          { Public declarations }
     end;

var
     FormLogin: TFormLogin;

implementation

{$R *.dfm}

uses Invoice.Controller.DataModule, Invoice.Controller.Facade;

procedure TFormLogin.SetLabel;
begin
     LabelSoftware.Caption := Application.Title;
     LabelDeveloper.Caption := TControllerGeneralFacade.New.AppInfoFactory.Default.CompanyName;
     LabelVersion.Caption := 'Version ' + TControllerGeneralFacade.New.AppInfoFactory.Default.FileVersion;
end;

procedure TFormLogin.btnCancelClick(Sender: TObject);
begin
     Close;
end;

procedure TFormLogin.btnLoginClick(Sender: TObject);
var
     idUser: Integer;
begin
     if (EditUser.Text <> '') and (EditPassword.Text <> '') then
     begin
          idUser := TControllerGeneralFacade.New.SecurityFactory.Default.LogIn(EditUser.Text, EditPassword.Text);
          //
          FLogin := (idUser > 0);
          //
          if FLogin then
          begin
               DataModuleLocal.SetidUser(idUser);
               DataModuleLocal.SetUsername(EditUser.Text);
               //
               Close;
          end
          else
          begin
               EditPassword.Text := '';
               //
               MessageDlg('Invalid user or password.', mtError, [mbOK], 0);
          end;
     end
     else
          MessageDlg('Enter the username and password.', mtError, [mbOK], 0);
end;

procedure TFormLogin.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     Action := caFree;
     //
     if not FLogin then
          Application.Terminate;
end;

procedure TFormLogin.FormCreate(Sender: TObject);
begin
     FLogin := False;
     //
     SetTitle;
     //
     SetLabel;
end;

procedure TFormLogin.FormShow(Sender: TObject);
begin
     EditUser.Text := TControllerGeneralFacade.New.WinInfoFactory.Default.UserName;
     //
     EditPassword.Text := '';
end;

procedure TFormLogin.SetTitle;
begin
     Caption := Application.Title + ' - ' + Hint;
end;

end.
