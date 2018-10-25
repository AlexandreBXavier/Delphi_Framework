unit Invoice.Controller.IniFile.Factory;

interface

uses Invoice.Controller.Interfaces, Invoice.Controller.IniFile.Default;

type
     TControllerIniFileFactory = class(TInterfacedObject, iControllerIniFileFactory)
          constructor Create;
          destructor Destroy; Override;
          class function New: iControllerIniFileFactory;
          function Default: iControllerIniFileDefault;
     end;

implementation

{ TControllerIniFileFactory }

constructor TControllerIniFileFactory.Create;
begin
     //
end;

destructor TControllerIniFileFactory.Destroy;
begin
     inherited;
end;

class function TControllerIniFileFactory.New: iControllerIniFileFactory;
begin
     Result := Self.Create;
end;

function TControllerIniFileFactory.Default: iControllerIniFileDefault;
begin
     Result := TControllerIniFileDefault.New;
end;

end.
