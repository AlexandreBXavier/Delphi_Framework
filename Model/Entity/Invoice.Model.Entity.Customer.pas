unit Invoice.Model.Entity.Customer;

interface

uses System.SysUtils, Data.DB, Invoice.Model.Interfaces, Invoice.Controller.Query.Factory;

type
     TModelEntityCustomer = class(TInterfacedObject, iEntity)
     private
          FQuery: iQuery;
     public
          constructor Create(Connection: iModelConnection);
          destructor Destroy; Override;
          class function New(Connection: iModelConnection): iEntity;
          function List: iEntity;
          function ListWhere(aSQL: String): iEntity;
          function DataSet: TDataSet;
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
end;

function TModelEntityCustomer.ListWhere(aSQL: String): iEntity;
begin
     Result := Self;
     //
     FQuery.SQL('SELECT * FROM tbCustomer WHERE ' + aSQL);
end;

class function TModelEntityCustomer.New(Connection: iModelConnection): iEntity;
begin
     Result := Self.Create(Connection);
end;

end.
