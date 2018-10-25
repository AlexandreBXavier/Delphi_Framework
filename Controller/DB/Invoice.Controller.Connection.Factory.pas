unit Invoice.Controller.Connection.Factory;

interface

uses Invoice.Controller.Interfaces, Invoice.Model.Connection.Firedac;

Type
     TControllerConnectionFactory = class(TInterfacedObject, iModelConnectionFactory)
     public
          constructor Create;
          destructor Destroy; override;
          class function New: iModelConnectionFactory;
          function ConnectionFiredac : iModelConnection;
     end;

implementation

{ TControllerConnectionFactory }

constructor TControllerConnectionFactory.Create;
begin
     //
end;

destructor TControllerConnectionFactory.Destroy;
begin
     inherited;
end;

class function TControllerConnectionFactory.New: iModelConnectionFactory;
begin
     Result := Self.Create;
end;

function TControllerConnectionFactory.ConnectionFiredac: iModelConnection;
begin
     Result := TModelConnectionFiredac.New;
end;

end.
