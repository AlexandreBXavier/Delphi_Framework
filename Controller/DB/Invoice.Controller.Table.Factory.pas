unit Invoice.Controller.Table.Factory;

interface

uses Data.DB, Invoice.Model.Interfaces, Invoice.Controller.Interfaces, Invoice.Model.Table.Firedac;

type
     TControllerTableFactory = class(TInterfacedObject, iModelTableFactory)
          constructor Create;
          destructor Destroy; Override;
          class function New: iModelTableFactory;
          function Table(Connection: iModelConnection): iTable;
     end;

implementation

{ TControllerTableFactory }

constructor TControllerTableFactory.Create;
begin
     //
end;

destructor TControllerTableFactory.Destroy;
begin
     inherited;
end;

class function TControllerTableFactory.New: iModelTableFactory;
begin
     Result := Self.Create;
end;

function TControllerTableFactory.Table(Connection: iModelConnection): iTable;
begin
     Result := TModelTableFiredac.New(Connection);
end;

end.
