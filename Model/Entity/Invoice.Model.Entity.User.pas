unit Invoice.Model.Entity.User;

interface

uses System.SysUtils, Data.DB, Invoice.Model.Interfaces, Invoice.Controller.Query.Factory;

type
     TModelEntityUser = class(TInterfacedObject, iEntity)
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
end;

function TModelEntityUser.ListWhere(aSQL: String): iEntity;
begin
     Result := Self;
     //
     FQuery.SQL('SELECT * FROM tbUser WHERE ' + aSQL);
end;

class function TModelEntityUser.New(Connection: iModelConnection): iEntity;
begin
     Result := Self.Create(Connection);
end;

end.
