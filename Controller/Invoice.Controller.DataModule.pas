unit Invoice.Controller.DataModule;

interface

uses
     System.SysUtils, System.Classes, Data.DB, System.ImageList,
     Vcl.ImgList, Vcl.Controls, Vcl.AppEvnts, Invoice.Model.Interfaces;

type
     TDataModuleLocal = class(TDataModule)
          ApplicationEvents: TApplicationEvents;
          ImageList32_D: TImageList;
          ImageList32_E: TImageList;
          ImageListTabs: TImageList;
          procedure DataModuleCreate(Sender: TObject);
          procedure DataModuleDestroy(Sender: TObject);
          procedure ApplicationEventsException(Sender: TObject; E: Exception);
     private
          { Private declarations }
          FConnectionLocal: iModelConnection;
          FSQLServerName: String;
          FSQLDatabaseName: String;
          FSQLUserName: String;
          FSQLPassword: String;
          FSystemidUser: Integer;
          FSystemUsername: String;
          //
          procedure SetConfig;
          procedure SetInitialValues;
          function ConnectDatabase: Boolean;
     public
          { Public declarations }
          function Connected: Boolean;
          function GetConnection: iModelConnection;
          function GetidUser: Integer;
          procedure SetidUser(Value: Integer);
          function GetUsername: String;
          procedure SetUsername(Value: String);
     end;

var
     DataModuleLocal: TDataModuleLocal;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses Invoice.Controller.IniFile.Factory, Invoice.Controller.Connection.Factory, Invoice.Controller.Security.Factory,
  Vcl.Dialogs;

{$R *.dfm}

procedure TDataModuleLocal.DataModuleCreate(Sender: TObject);
begin
     SetInitialValues;
     //
     SetConfig;
     //
     ConnectDatabase;
end;

procedure TDataModuleLocal.DataModuleDestroy(Sender: TObject);
begin
     FConnectionLocal.Connection.Close;
end;

function TDataModuleLocal.GetConnection: iModelConnection;
begin
     Result := FConnectionLocal;
end;

function TDataModuleLocal.GetidUser: Integer;
begin
     Result := FSystemidUser;
end;

function TDataModuleLocal.GetUsername: String;
begin
     Result := FSystemUsername;
end;

procedure TDataModuleLocal.ApplicationEventsException(Sender: TObject; E: Exception);
begin
     MessageDlg(E.Message, mtError, [mbOk], 0);
     //
     TControllerSecurityFactory.New.Default.AddLog(E.Message);
end;

function TDataModuleLocal.ConnectDatabase;
begin
     FConnectionLocal := TControllerConnectionFactory.New.ConnectionFiredac.Parametros
                                   .DriverID('MSSQL')
                                   .Server(FSQLServerName)
                                   .Database(FSQLDatabaseName)
                                   .UserName(FSQLUserName)
                                   .Password(FSQLPassword)
                                   .EndParametros;
     //
     FConnectionLocal.Connection.Open;
end;

function TDataModuleLocal.Connected: Boolean;
begin
     Result := FConnectionLocal.Connection.Connected;
end;

procedure TDataModuleLocal.SetConfig;
begin
     FSQLServerName := TControllerIniFileFactory.New.Default.InputKey('Server', 'ServerName', '<Server Name>', False);
     FSQLDatabaseName := TControllerIniFileFactory.New.Default.InputKey('Server', 'DatabaseName', '<Database Name>', False);
     FSQLUserName := TControllerIniFileFactory.New.Default.InputKey('Server', 'UserName', '<User Name>', False);
     FSQLPassword := TControllerIniFileFactory.New.Default.InputKey('Server', 'UserPassword', '<User Password>', True);
end;

procedure TDataModuleLocal.SetidUser(Value: Integer);
begin
     FSystemidUser := Value;
end;

procedure TDataModuleLocal.SetInitialValues;
begin
     FSQLServerName := '';
     FSQLDatabaseName := '';
     FSQLUserName := '';
     FSQLPassword := '';
     //
     FSystemidUser := 0;
     FSystemUsername := '';
end;

procedure TDataModuleLocal.SetUsername(Value: String);
begin
     FSystemUsername := Value;
end;

end.
