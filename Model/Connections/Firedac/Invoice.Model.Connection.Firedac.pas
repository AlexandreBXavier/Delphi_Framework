unit Invoice.Model.Connection.Firedac;


interface

uses System.Classes, Data.DB, FireDAC.UI.Intf, FireDAC.VCLUI.Error,
     FireDAC.Stan.Error, FireDAC.VCLUI.Wait, FireDAC.Phys.MSSQLDef, FireDAC.Phys,
     FireDAC.Phys.ODBCBase, FireDAC.Phys.MSSQL, FireDAC.Comp.UI, FireDAC.Stan.Intf,
     FireDAC.Stan.Option, FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool,
     FireDAC.Stan.Async, FireDAC.Comp.Client, Invoice.Controller.Interfaces;

type
     TModelConnectionFiredac = class(TInterfacedObject, iModelConnection, iModelConnectionParametros)
     private
          class var FInstance: TModelConnectionFiredac;
          FConnection: TFDConnection;
          FDGUIxWaitCursor1: TFDGUIxWaitCursor;
          FDPhysMSSQLDriverLink1: TFDPhysMSSQLDriverLink;
          FDatabase: String;
          FUserName: String;
          FPassword: String;
          FDriverID: String;
          FServer: String;
          FPorta: Integer;
          procedure LerParametros;
     public
          constructor Create;
          destructor Destroy; override;
          class function New: iModelConnection;
          function Database(Value: String): iModelConnectionParametros;
          function UserName(Value: String): iModelConnectionParametros;
          function Password(Value: String): iModelConnectionParametros;
          function DriverID(Value: String): iModelConnectionParametros;
          function Server(Value: String): iModelConnectionParametros;
          function Porta(Value: Integer): iModelConnectionParametros;
          function EndParametros: iModelConnection;
          function Parametros: iModelConnectionParametros;
          function Connection: TCustomConnection;
     end;

implementation

uses
     System.SysUtils, Vcl.Dialogs;

{ TModelConnectionFiredac }

constructor TModelConnectionFiredac.Create;
begin
     FDPhysMSSQLDriverLink1 := TFDPhysMSSQLDriverLink.Create(nil);
     FDGUIxWaitCursor1 := TFDGUIxWaitCursor.Create(nil);
     FConnection := TFDConnection.Create(nil);
end;

destructor TModelConnectionFiredac.Destroy;
begin
     FConnection.Close;
     //
     FConnection.Free;
     FDGUIxWaitCursor1.Free;
     FDPhysMSSQLDriverLink1.Free;
     //
     inherited;
end;

class function TModelConnectionFiredac.New: iModelConnection;
begin
     if not Assigned(FInstance) then
          FInstance := Self.Create;
     //
     Result := FInstance;
end;

function TModelConnectionFiredac.Connection: TCustomConnection;
begin
     Result := TCustomConnection(FConnection);
     //
     if not FConnection.Connected then
     begin
          LerParametros;
          //
          FConnection.Open;
     end;
end;

function TModelConnectionFiredac.DriverID(Value: String): iModelConnectionParametros;
begin
     Result := Self;
     //
     FDriverID := Value;
end;

function TModelConnectionFiredac.Database(Value: String): iModelConnectionParametros;
begin
     Result := Self;
     //
     FDatabase := Value;
end;

function TModelConnectionFiredac.EndParametros: iModelConnection;
begin
     Result := Self;
end;

procedure TModelConnectionFiredac.LerParametros;
begin
     FConnection.Params.Clear;
     FConnection.Params.DriverID := FDriverID;
     FConnection.Params.Database := FDatabase;
     FConnection.Params.UserName := FUserName;
     FConnection.Params.Password := FPassword;
     FConnection.Params.Add('Server=' + FServer);
end;

function TModelConnectionFiredac.Parametros: iModelConnectionParametros;
begin
     Result := Self;
end;

function TModelConnectionFiredac.Password(Value: String): iModelConnectionParametros;
begin
     Result := Self;
     //
     FPassword := Value;
end;

function TModelConnectionFiredac.Porta(Value: Integer): iModelConnectionParametros;
begin
     Result := Self;
     //
     FPorta := Value;
end;

function TModelConnectionFiredac.Server(Value: String): iModelConnectionParametros;
begin
     Result := Self;
     //
     FServer := Value;
end;

function TModelConnectionFiredac.UserName(Value: String): iModelConnectionParametros;
begin
     Result := Self;
     //
     FUserName := Value;
end;

end.