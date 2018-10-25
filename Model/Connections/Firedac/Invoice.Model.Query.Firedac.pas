unit Invoice.Model.Query.Firedac;

interface

uses System.Classes, Data.DB, System.SysUtils,
     Firedac.Stan.Option, Firedac.Stan.Error, Firedac.UI.Intf, Firedac.Phys.Intf,
     Firedac.Stan.Def, Firedac.Stan.Pool, Firedac.Stan.Async, Firedac.Phys,
     Firedac.Phys.MSSQL, Firedac.Phys.MSSQLDef, Firedac.VCLUI.Wait, Firedac.Comp.UI,
     Firedac.Stan.Param, Firedac.DatS, Firedac.DApt.Intf, Firedac.DApt,
     Firedac.Comp.DataSet, Firedac.Comp.Client, Firedac.Phys.ODBCBase, Firedac.Stan.Intf,
     Invoice.Controller.Interfaces, Invoice.Model.Interfaces;

type
     TModelQueryFiredac = class(TInterfacedObject, iQuery)
     private
          FConnection: iModelConnection;
          FQuery: TFDQuery;
     public
          constructor Create(aConnection: iModelConnection);
          destructor Destroy; override;
          class function New(aConnection: iModelConnection): iQuery;
          procedure Open;
          procedure Close;
          function SQL(Value: String): iQuery;
          function DataSet: TDataSet;
          function Order(aFieldName: String): iQuery;
     end;

implementation

{ TModelQueryFiredac }

uses Invoice.Model.Connection.Firedac;

constructor TModelQueryFiredac.Create(aConnection: iModelConnection);
begin
     FConnection := aConnection;
     //
     if not Assigned(FConnection.Connection) then
          raise Exception.Create('Connection is not valid.');
     //
     FQuery := TFDQuery.Create(nil);
     //
     FQuery.Connection := TFDConnection(FConnection.Connection);
end;

function TModelQueryFiredac.DataSet: TDataSet;
begin
     Result := FQuery;
end;

destructor TModelQueryFiredac.Destroy;
begin
     FreeAndNil(FQuery);
     //
     inherited;
end;

class function TModelQueryFiredac.New(aConnection: iModelConnection): iQuery;
begin
     Result := Self.Create(aConnection);
end;

function TModelQueryFiredac.SQL(Value: String): iQuery;
begin
     Result := Self;
     //
     FQuery.SQL.Clear;
     FQuery.SQL.Add(Value);
end;

procedure TModelQueryFiredac.Open;
begin
     FQuery.Active := True;
end;

function TModelQueryFiredac.Order(aFieldName: String): iQuery;
begin
     FQuery.IndexFieldNames := aFieldName;
end;

procedure TModelQueryFiredac.Close;
begin
     FQuery.Active := False;
end;

end.
