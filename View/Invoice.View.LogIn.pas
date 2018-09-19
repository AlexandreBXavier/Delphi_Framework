unit Invoice.View.LogIn;

interface

uses
     Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
     Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.Imaging.pngimage;

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

uses Invoice.Controller.AppInfo.Factory, Invoice.Controller.Security.Factory;

procedure TFormLogin.SetLabel;
begin
     LabelSoftware.Caption := Application.Title;
     LabelDeveloper.Caption := TControllerAppInfoFactory.New.Default.CompanyName;
     LabelVersion.Caption := 'Version ' + TControllerAppInfoFactory.New.Default.FileVersion;
end;

procedure TFormLogin.btnCancelClick(Sender: TObject);
begin
     Close;
end;

procedure TFormLogin.btnLoginClick(Sender: TObject);
begin
     if (EditUser.Text <> '') and (EditPassword.Text <> '') then
     begin
          FLogin := TControllerSecurityFactory.New.Default.Login(EditUser.Text, EditPassword.Text);
          //
          if FLogin then
               Close
          else
               raise Exception.Create('Invalid user or password.');
     end
     else
          raise Exception.Create('Enter the username and password.');
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

procedure TFormLogin.SetTitle;
begin
     Caption := Application.Title + ' - ' + Hint;
end;

end.
