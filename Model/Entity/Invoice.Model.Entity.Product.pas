unit Invoice.Model.Entity.Product;

interface

uses System.SysUtils, Data.DB, Invoice.Model.Interfaces, Invoice.Controller.Query.Factory;

type
     TModelEntityProduct = class(TInterfacedObject, iEntity)
     private
          FQuery: iQuery;
     public
          constructor Create(Connection: iModelConnection);
          destructor Destroy; Override;
          class function New(Connection: iModelConnection): iEntity;
          function List(var Value: TDataSource): iEntity;
     end;

implementation

{ TModelEntityProduct }

constructor TModelEntityProduct.Create(Connection: iModelConnection);
begin
     FQuery := TControllerQueryFactory.New.Query(Connection)
end;

destructor TModelEntityProduct.Destroy;
begin
     FQuery.Close;
     //
     inherited;
end;

function TModelEntityProduct.List(var Value: TDataSource): iEntity;
begin
     Result := Self;
     //
     FQuery.SQL('SELECT * FROM Product').Open;
     //
     Value.DataSet := FQuery.Dataset;
end;

class function TModelEntityProduct.New(Connection: iModelConnection): iEntity;
begin
     Result := Self.Create(Connection);
end;

end.
