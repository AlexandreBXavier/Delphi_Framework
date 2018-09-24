unit Invoice.Model.Table.Firedac;

interface

uses Invoice.Model.Interfaces, System.Classes, Data.DB, System.SysUtils,
     Firedac.Stan.Option, Firedac.Stan.Error, Firedac.UI.Intf, Firedac.Phys.Intf,
     Firedac.Stan.Def, Firedac.Stan.Pool, Firedac.Stan.Async, Firedac.Phys,
     Firedac.Phys.MSSQL, Firedac.Phys.MSSQLDef, Firedac.VCLUI.Wait,
     Firedac.Stan.Param, Firedac.DatS, Firedac.DApt.Intf, Firedac.DApt,
     Firedac.Comp.DataSet, Firedac.Comp.Client, Firedac.Phys.ODBCBase,
     Firedac.Stan.Intf, Firedac.Comp.UI;

type
     TModelTableFiredac = class(TInterfacedObject, iTable)
     private
          FConnection: iModelConnection;
          FTable: TFDTable;
     public
          constructor Create(aConnection: iModelConnection);
          destructor Destroy; override;
          class function New(aConnection: iModelConnection): iTable;
          function Open(aTable: String): TDataSet;
     end;

implementation

{ TModelTableFiredac }

uses Invoice.Model.Connection.Firedac;

constructor TModelTableFiredac.Create(aConnection: iModelConnection);
begin
     FConnection := aConnection;
     //
     if not Assigned(FConnection.Connection) then
          raise Exception.Create('Connection is not valid.');
     //
     FTable := TFDTable.Create(nil);
     //
     FTable.Connection := TFDConnection(FConnection.Connection);
end;

destructor TModelTableFiredac.Destroy;
begin
     FTable.Close;
     //
     FreeAndNil(FTable);
     //
     inherited;
end;

class function TModelTableFiredac.New(aConnection: iModelConnection): iTable;
begin
     Result := Self.Create(aConnection);
end;

function TModelTableFiredac.Open(aTable: String): TDataSet;
begin
     FTable.Open(aTable);
     //
     Result := FTable;
end;

end.
