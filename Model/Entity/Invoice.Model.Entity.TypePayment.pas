unit Invoice.Model.Entity.TypePayment;

interface

uses System.SysUtils, Data.DB, Invoice.Model.Interfaces, Invoice.Controller.Query.Factory;

type
     TModelEntityTypePayment = class(TInterfacedObject, iEntity)
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
     //
     FQuery.Open;
     //
     PreparateFields;
end;

function TModelEntityTypePayment.ListWhere(aSQL: String): iEntity;
begin
     Result := Self;
     //
     FQuery.SQL('SELECT * FROM tbTypePayment WHERE ' + aSQL);
     //
     FQuery.Open;
     //
     PreparateFields;
end;

class function TModelEntityTypePayment.New(Connection: iModelConnection): iEntity;
begin
     Result := Self.Create(Connection);
end;

function TModelEntityTypePayment.OrderBy(aFieldName: String): iEntity;
begin
     FQuery.Order(aFieldName);
end;

procedure TModelEntityTypePayment.PreparateFields;
begin
     if (FQuery.DataSet.Fields.Count > 0) then
     begin
          FQuery.DataSet.Fields.FieldByName('idTypePayment').ProviderFlags := [pfInWhere,pfInKey];
          FQuery.DataSet.Fields.FieldByName('idTypePayment').ReadOnly := True;
          FQuery.DataSet.Fields.FieldByName('idTypePayment').DisplayWidth := 20;
          //
          FQuery.DataSet.Fields.FieldByName('nameTypePayment').ProviderFlags := [pfInUpdate];
          FQuery.DataSet.Fields.FieldByName('nameTypePayment').ReadOnly := False;
          FQuery.DataSet.Fields.FieldByName('nameTypePayment').DisplayWidth := 100;
     end;
end;

end.
