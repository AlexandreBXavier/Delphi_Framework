unit Invoice.Model.Entity.Customer;

interface

uses System.SysUtils, Data.DB, Invoice.Model.Interfaces, Invoice.Controller.Query.Factory;

type
     TModelEntityCustomer = class(TInterfacedObject, iEntity)
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


{ TModelEntityCustomer }

constructor TModelEntityCustomer.Create(Connection: iModelConnection);
begin
     FQuery := TControllerQueryFactory.New.Query(Connection)
end;

function TModelEntityCustomer.DataSet: TDataSet;
begin
     Result := FQuery.DataSet;
end;

destructor TModelEntityCustomer.Destroy;
begin
     if FQuery.DataSet.Active then FQuery.Close;
     //
     inherited;
end;

function TModelEntityCustomer.List: iEntity;
begin
     Result := Self;
     //
     FQuery.SQL('SELECT * FROM tbCustomer WHERE idCustomer = 0');
     //
     FQuery.Open;
     //
     PreparateFields;
end;

function TModelEntityCustomer.ListWhere(aSQL: String): iEntity;
begin
     Result := Self;
     //
     FQuery.SQL('SELECT * FROM tbCustomer WHERE ' + aSQL);
     //
     FQuery.Open;
     //
     PreparateFields;
end;

class function TModelEntityCustomer.New(Connection: iModelConnection): iEntity;
begin
     Result := Self.Create(Connection);
end;

function TModelEntityCustomer.OrderBy(aFieldName: String): iEntity;
begin
     FQuery.Order(aFieldName);
end;

procedure TModelEntityCustomer.PreparateFields;
begin
     if (FQuery.DataSet.Fields.Count > 0) then
     begin
          FQuery.DataSet.Fields.FieldByName('idCustomer').ProviderFlags := [pfInWhere,pfInKey];
          FQuery.DataSet.Fields.FieldByName('idCustomer').ReadOnly := True;
          FQuery.DataSet.Fields.FieldByName('idCustomer').DisplayWidth := 20;
          //
          FQuery.DataSet.Fields.FieldByName('nameCustomer').ProviderFlags := [pfInUpdate];
          FQuery.DataSet.Fields.FieldByName('nameCustomer').ReadOnly := False;
          FQuery.DataSet.Fields.FieldByName('nameCustomer').DisplayWidth := 100;
          //
          FQuery.DataSet.Fields.FieldByName('phoneCustomer').ProviderFlags := [pfInUpdate];
          FQuery.DataSet.Fields.FieldByName('phoneCustomer').ReadOnly := False;
          FQuery.DataSet.Fields.FieldByName('phoneCustomer').DisplayWidth := 11;
     end;
end;

end.
