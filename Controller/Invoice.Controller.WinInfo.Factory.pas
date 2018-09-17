unit Invoice.Controller.WinInfo.Factory;

interface

uses Invoice.Controller.Interfaces, Invoice.Controller.WinInfo.Default;

type
     TControllerWinInfoFactory = class(TInterfacedObject, iControllerWinInfoFactory)
          constructor Create;
          destructor Destroy; Override;
          class function New: iControllerWinInfoFactory;
          function Default: iControllerWinInfoDefault;
     end;

implementation

{ TControllerWinInfoFactory }

constructor TControllerWinInfoFactory.Create;
begin
     //
end;

destructor TControllerWinInfoFactory.Destroy;
begin
     inherited;
end;

class function TControllerWinInfoFactory.New: iControllerWinInfoFactory;
begin
     Result := Self.Create;
end;

function TControllerWinInfoFactory.Default: iControllerWinInfoDefault;
begin
     Result := TControllerWinInfoDefault.New;
end;

end.
