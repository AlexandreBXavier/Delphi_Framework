unit Invoice.Controller.Query.Factory;

interface

uses Data.DB, Invoice.Controller.Interfaces, Invoice.Model.Interfaces, Invoice.Model.Query.Firedac;

type
     TControllerQueryFactory = class(TInterfacedObject, iModelQueryFactory)
          constructor Create;
          destructor Destroy; Override;
          class function New: iModelQueryFactory;
          function Query(Connection: iModelConnection): iQuery;
     end;

implementation

{ TControllerQueryFactory }

constructor TControllerQueryFactory.Create;
begin
     //
end;

destructor TControllerQueryFactory.Destroy;
begin
     inherited;
end;

class function TControllerQueryFactory.New: iModelQueryFactory;
begin
     Result := Self.Create;
end;

function TControllerQueryFactory.Query(Connection: iModelConnection): iQuery;
begin
     Result := TModelQueryFiredac.New(Connection);
end;

end.
