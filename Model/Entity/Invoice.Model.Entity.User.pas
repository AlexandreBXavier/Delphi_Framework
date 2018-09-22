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
     Result := FQuery.Dataset;
end;

destructor TModelEntityUser.Destroy;
begin
     FQuery.Close;
     //
     inherited;
end;

function TModelEntityUser.List: iEntity;
begin
     Result := Self;
     //
     FQuery.SQL('SELECT * FROM tbUser').Open;
end;

class function TModelEntityUser.New(Connection: iModelConnection): iEntity;
begin
     Result := Self.Create(Connection);
end;

end.
