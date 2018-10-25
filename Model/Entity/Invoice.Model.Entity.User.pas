unit Invoice.Model.Entity.User;

interface

uses System.SysUtils, Data.DB, Invoice.Model.Interfaces, Invoice.Controller.Interfaces, Invoice.Controller.Query.Factory;

type
     TModelEntityUser = class(TInterfacedObject, iEntity)
     private
          FQuery: iQuery;
          //
          procedure PreparateFields;
     public
          constructor Create(Connection: iModelConnection);
          destructor Destroy; Override;
          class function New(Connection: iModelConnection): iEntity;
          function List: iEntity;
          function ListWhere(aSQL: String): iEntity;
          function DataSet: TDataSet;
          function OrderBy(aFieldName: String): iEntity;
     end;

implementation

{ TModelEntityUser }

constructor TModelEntityUser.Create(Connection: iModelConnection);
begin
     FQuery := TControllerQueryFactory.New.Query(Connection)
end;

function TModelEntityUser.DataSet: TDataSet;
begin
     Result := FQuery.DataSet;
end;

destructor TModelEntityUser.Destroy;
begin
     if FQuery.DataSet.Active then FQuery.Close;
     //
     inherited;
end;

function TModelEntityUser.List: iEntity;
begin
     Result := Self;
     //
     FQuery.SQL('SELECT * FROM tbUser WHERE idUser = 0');
     //
     FQuery.Open;
     //
     PreparateFields;
end;

function TModelEntityUser.ListWhere(aSQL: String): iEntity;
begin
     Result := Self;
     //
     FQuery.SQL('SELECT * FROM tbUser WHERE ' + aSQL);
     //
     FQuery.Open;
     //
     PreparateFields;
end;

class function TModelEntityUser.New(Connection: iModelConnection): iEntity;
begin
     Result := Self.Create(Connection);
end;

function TModelEntityUser.OrderBy(aFieldName: String): iEntity;
begin
     FQuery.Order(aFieldName);
end;

procedure TModelEntityUser.PreparateFields;
begin
     if (FQuery.DataSet.Fields.Count > 0) then
     begin
          FQuery.DataSet.Fields.FieldByName('idUser').ProviderFlags := [pfInWhere,pfInKey];
          FQuery.DataSet.Fields.FieldByName('idUser').ReadOnly := True;
          FQuery.DataSet.Fields.FieldByName('idUser').DisplayWidth := 20;
          //
          FQuery.DataSet.Fields.FieldByName('nameFirst').ProviderFlags := [pfInUpdate];
          FQuery.DataSet.Fields.FieldByName('nameFirst').ReadOnly := False;
          FQuery.DataSet.Fields.FieldByName('nameFirst').DisplayWidth := 100;
          //
          FQuery.DataSet.Fields.FieldByName('nameLast').ProviderFlags := [pfInUpdate];
          FQuery.DataSet.Fields.FieldByName('nameLast').ReadOnly := False;
          FQuery.DataSet.Fields.FieldByName('nameLast').DisplayWidth := 100;
          //
          FQuery.DataSet.Fields.FieldByName('nameUser').ProviderFlags := [pfInUpdate];
          FQuery.DataSet.Fields.FieldByName('nameUser').ReadOnly := False;
          FQuery.DataSet.Fields.FieldByName('nameUser').DisplayWidth := 100;
          //
          FQuery.DataSet.Fields.FieldByName('passUser').ProviderFlags := [pfInUpdate];
          FQuery.DataSet.Fields.FieldByName('passUser').ReadOnly := False;
          FQuery.DataSet.Fields.FieldByName('passUser').DisplayWidth := 100;
          //
          FQuery.DataSet.Fields.FieldByName('activeUser').ProviderFlags := [pfInUpdate];
          FQuery.DataSet.Fields.FieldByName('activeUser').ReadOnly := False;
          FQuery.DataSet.Fields.FieldByName('activeUser').DisplayWidth := 100;
     end;
end;

end.
