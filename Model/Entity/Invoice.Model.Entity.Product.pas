unit Invoice.Model.Entity.Product;

interface

uses System.SysUtils, Data.DB, Invoice.Model.Interfaces, Invoice.Controller.Interfaces, Invoice.Controller.Query.Factory;

type
     TModelEntityProduct = class(TInterfacedObject, iEntity)
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
     //
     FQuery.Open;
     //
     PreparateFields;
end;

function TModelEntityProduct.ListWhere(aSQL: String): iEntity;
begin
     Result := Self;
     //
     FQuery.SQL('SELECT * FROM tbProduct WHERE ' + aSQL);
     //
     FQuery.Open;
     //
     PreparateFields;
end;

class function TModelEntityProduct.New(Connection: iModelConnection): iEntity;
begin
     Result := Self.Create(Connection);
end;

function TModelEntityProduct.OrderBy(aFieldName: String): iEntity;
begin
     FQuery.Order(aFieldName);
end;

procedure TModelEntityProduct.PreparateFields;
begin
     if (FQuery.DataSet.Fields.Count > 0) then
     begin
          FQuery.DataSet.Fields.FieldByName('idProduct').ProviderFlags := [pfInWhere,pfInKey];
          FQuery.DataSet.Fields.FieldByName('idProduct').ReadOnly := True;
          FQuery.DataSet.Fields.FieldByName('idProduct').DisplayWidth := 20;
          //
          FQuery.DataSet.Fields.FieldByName('nameProduct').ProviderFlags := [pfInUpdate];
          FQuery.DataSet.Fields.FieldByName('nameProduct').ReadOnly := False;
          FQuery.DataSet.Fields.FieldByName('nameProduct').DisplayWidth := 100;
          //
          FQuery.DataSet.Fields.FieldByName('priceProduct').ProviderFlags := [pfInUpdate];
          FQuery.DataSet.Fields.FieldByName('priceProduct').ReadOnly := False;
          //FQuery.DataSet.Fields.FieldByName('priceProduct').DisplayWidth := 100;
     end;
end;

end.
