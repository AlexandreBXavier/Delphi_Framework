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
          function ListWhere(aSQL: String): iEntity;
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
     Result := FQuery.DataSet;
end;

destructor TModelEntityTypePayment.Destroy;
begin
     if FQuery.DataSet.Active then FQuery.Close;
     //
     inherited;
end;

function TModelEntityTypePayment.List: iEntity;
begin
     Result := Self;
     //
     FQuery.SQL('SELECT * FROM tbTypePayment WHERE idTypePayment = 0');
end;

function TModelEntityTypePayment.ListWhere(aSQL: String): iEntity;
begin
     Result := Self;
     //
     FQuery.SQL('SELECT * FROM tbTypePayment WHERE ' + aSQL);
end;

class function TModelEntityTypePayment.New(Connection: iModelConnection): iEntity;
begin
     Result := Self.Create(Connection);
end;

end.
