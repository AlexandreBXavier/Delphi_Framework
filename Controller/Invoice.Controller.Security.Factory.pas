unit Invoice.Controller.Security.Factory;

interface

uses Invoice.Controller.Interfaces, Invoice.Controller.Security.Default;

type
     TControllerSecurityFactory = class(TInterfacedObject, iControllerSecurityFactory)
          constructor Create;
          destructor Destroy; Override;
          class function New: iControllerSecurityFactory;
          function Default: iControllerSecurityDefault;
     end;

implementation

{ TControllerSecurityFactory }

constructor TControllerSecurityFactory.Create;
begin
     //
end;

destructor TControllerSecurityFactory.Destroy;
begin
     inherited;
end;

class function TControllerSecurityFactory.New: iControllerSecurityFactory;
begin
     Result := Self.Create;
end;

function TControllerSecurityFactory.Default: iControllerSecurityDefault;
begin
     Result := TControllerSecurityDefault.New;
end;

end.
