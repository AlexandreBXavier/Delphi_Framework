unit Invoice.Controller.AppInfo.Factory;

interface

uses Invoice.Controller.Interfaces, Invoice.Controller.AppInfo.Default;

type
     TControllerAppInfoFactory = class(TInterfacedObject, iControllerAppInfoFactory)
          constructor Create;
          destructor Destroy; Override;
          class function New: iControllerAppInfoFactory;
          function Default: iControllerAppInfoDefault;
     end;

implementation

{ TControllerAppInfoFactory }

constructor TControllerAppInfoFactory.Create;
begin
     //
end;

destructor TControllerAppInfoFactory.Destroy;
begin
     inherited;
end;

class function TControllerAppInfoFactory.New: iControllerAppInfoFactory;
begin
     Result := Self.Create;
end;

function TControllerAppInfoFactory.Default: iControllerAppInfoDefault;
begin
     Result := TControllerAppInfoDefault.New;
end;

end.
