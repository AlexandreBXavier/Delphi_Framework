unit Invoice.Controller.TabForm.Factory;

interface

uses Invoice.Controller.Interfaces, Invoice.Controller.TabForm.Default;

type
     TControllerTabFormFactory = class(TInterfacedObject, iControllerTabFormFactory)
          constructor Create;
          destructor Destroy; Override;
          class function New: iControllerTabFormFactory;
          function Default: iControllerTabFormDefault;
     end;

implementation

{ TControllerTabFormFactory }

constructor TControllerTabFormFactory.Create;
begin
     //
end;

destructor TControllerTabFormFactory.Destroy;
begin
     inherited;
end;

class function TControllerTabFormFactory.New: iControllerTabFormFactory;
begin
     Result := Self.Create;
end;

function TControllerTabFormFactory.Default: iControllerTabFormDefault;
begin
     Result := TControllerTabFormDefault.New;
end;

end.
