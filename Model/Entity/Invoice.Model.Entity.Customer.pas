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
          function List(var Value: TDataSource): iEntity;
     end;

implementation


{ TModelEntityCustomer }

constructor TModelEntityCustomer.Create(Connection: iModelConnection);
begin
     FQuery := TControllerQueryFactory.New.Query(Connection)
end;

destructor TModelEntityCustomer.Destroy;
begin
     FQuery.Close;
     //
     inherited;
end;

function TModelEntityCustomer.List(var Value: TDataSource): iEntity;
begin
     Result := Self;
     //
     FQuery.SQL('SELECT * FROM Customer').Open;;
     //
     Value.DataSet := FQuery.Dataset;
end;

class function TModelEntityCustomer.New(Connection: iModelConnection): iEntity;
begin
     Result := Self.Create(Connection);
end;

end.
