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
          function List: iEntity;
          function ListWhere(aSQL: String): iEntity;
          function DataSet: TDataSet;
     end;

implementation

{ TModelEntityProduct }

constructor TModelEntityProduct.Create(Connection: iModelConnection);
begin
     FQuery := TControllerQueryFactory.New.Query(Connection)
end;

function TModelEntityProduct.DataSet: TDataSet;
begin
     Result := FQuery.DataSet;
end;

destructor TModelEntityProduct.Destroy;
begin
     if FQuery.DataSet.Active then FQuery.Close;
     //
     inherited;
end;

function TModelEntityProduct.List: iEntity;
begin
     Result := Self;
     //
     FQuery.SQL('SELECT * FROM tbProduct WHERE idProduct = 0');
end;

function TModelEntityProduct.ListWhere(aSQL: String): iEntity;
begin
     Result := Self;
     //
     FQuery.SQL('SELECT * FROM tbProduct WHERE ' + aSQL);
end;

class function TModelEntityProduct.New(Connection: iModelConnection): iEntity;
begin
     Result := Self.Create(Connection);
end;

end.
