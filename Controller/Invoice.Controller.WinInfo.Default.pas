unit Invoice.Controller.WinInfo.Default;

interface

uses Invoice.Controller.Interfaces, Winapi.Windows, Winapi.Messages, System.SysUtils;

type
     TControllerWinInfoDefault = class(TInterfacedObject, iControllerWinInfoDefault)
     private
          FUserName: String;
          FComputerName: String;
     public
          constructor Create;
          destructor Destroy; Override;
          class function New: iControllerWinInfoDefault;
          function UserName: String;
          function ComputerName: String;
     end;

implementation

{ TControllerWinInfoDefault }

function GetWindowsComputerName: String;
var
     Name: Array [0 .. 255] of Char;
     NameSize: Dword;
begin
     NameSize := SizeOf(Name);
     if not GetComputerName(Name, NameSize) then
          Name[0] := #0;
     Result := StrPas(Name);
end;

function GetWindowsUserName: String;
var
     Name: Array [0 .. 255] of Char;
     NameSize: Dword;
begin
     NameSize := SizeOf(Name);
     if not GetUserName(Name, NameSize) then
          Name[0] := #0;
     result := StrPas(Name);
end;

constructor TControllerWinInfoDefault.Create;
begin
     FUserName := GetWindowsUserName;
     FComputerName := GetWindowsComputerName;
end;

destructor TControllerWinInfoDefault.Destroy;
begin
     inherited;
end;

class function TControllerWinInfoDefault.New: iControllerWinInfoDefault;
begin
     Result := Self.Create;
end;

function TControllerWinInfoDefault.UserName: String;
begin
     Result := FUserName;
end;

function TControllerWinInfoDefault.ComputerName: String;
begin
     Result := FComputerName;
end;

end.
