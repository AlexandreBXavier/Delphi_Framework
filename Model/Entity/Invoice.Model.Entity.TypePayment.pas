unit Invoice.Model.Entity.TypePayment;

interface

uses System.SysUtils, Data.DB, Invoice.Model.Interfaces, Invoice.Controller.Query.Factory;

type
     TModelEntityTypePayment = class(TInterfacedObject, iEntity)
     private
          FQuery: iQuery;
     public
          constructor Create(Connection: iModelConnection);
          destructor Destroy; Override;
          class function New(Connection: iModelConnection): iEntity;
          function List(var Value: TDataSource): iEntity;
     end;

implementation


{ TModelEntityTypePayment }

constructor TModelEntityTypePayment.Create(Connection: iModelConnection);
begin
     FQuery := TControllerQueryFactory.New.Query(Connection)
end;

destructor TModelEntityTypePayment.Destroy;
begin
     FQuery.Close;
     //
     inherited;
end;

function TModelEntityTypePayment.List(var Value: TDataSource): iEntity;
begin
     Result := Self;
     //
     FQuery.SQL('SELECT * FROM TypePayment').Open;;
     //
     Value.DataSet := FQuery.Dataset;
end;

class function TModelEntityTypePayment.New(Connection: iModelConnection): iEntity;
begin
     Result := Self.Create(Connection);
end;

end.
