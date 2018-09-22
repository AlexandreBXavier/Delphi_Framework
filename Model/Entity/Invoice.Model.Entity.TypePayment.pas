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
          function List: iEntity;
          function DataSet: TDataSet;
     end;

implementation


{ TModelEntityTypePayment }

constructor TModelEntityTypePayment.Create(Connection: iModelConnection);
begin
     FQuery := TControllerQueryFactory.New.Query(Connection);
end;

function TModelEntityTypePayment.DataSet: TDataSet;
begin
     Result := FQuery.Dataset;
end;

destructor TModelEntityTypePayment.Destroy;
begin
     FQuery.Close;
     //
     inherited;
end;

function TModelEntityTypePayment.List: iEntity;
begin
     Result := Self;
     //
     FQuery.SQL('SELECT * FROM tbTypePayment').Open;
end;

class function TModelEntityTypePayment.New(Connection: iModelConnection): iEntity;
begin
     Result := Self.Create(Connection);
end;

end.
