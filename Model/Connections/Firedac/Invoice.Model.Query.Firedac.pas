unit Invoice.Model.Query.Firedac;

interface

uses Invoice.Model.Interfaces, System.Classes, Data.DB, System.SysUtils,
     Firedac.Stan.Option, Firedac.Stan.Error, Firedac.UI.Intf, Firedac.Phys.Intf,
     Firedac.Stan.Def, Firedac.Stan.Pool, Firedac.Stan.Async, Firedac.Phys,
     Firedac.Phys.MSSQL, Firedac.Phys.MSSQLDef, Firedac.VCLUI.Wait,
     Firedac.Stan.Param, Firedac.DatS, Firedac.DApt.Intf, Firedac.DApt,
     Firedac.Comp.DataSet, Firedac.Comp.Client, Firedac.Phys.ODBCBase,
     Firedac.Stan.Intf, Firedac.Comp.UI;

type
     TModelQueryFiredac = class(TInterfacedObject, iQuery)
     private
          FQuery: TFDQuery;
     public
          constructor Create(aConnection: iModelConnection);
          destructor Destroy; override;
          class function New(aConnection: iModelConnection): iQuery;
          function SQL(Value: String): iQuery;
          function DataSet: TDataSet;
     end;

implementation

{ TModelQueryFiredac }

uses Invoice.Model.Connection.Firedac;

constructor TModelQueryFiredac.Create(aConnection: iModelConnection);
begin
     if not Assigned(aConnection) then
          raise Exception.Create('Connection is not valid.');
     //
     FQuery := TFDQuery.Create(nil);
     //
     FQuery.Connection := TFDConnection(aConnection.Connection);
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
     FQuery.SQL.Add(Value);
     //
     FQuery.Active := True;
end;

end.
