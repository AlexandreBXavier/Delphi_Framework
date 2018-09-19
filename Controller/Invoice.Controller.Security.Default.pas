unit Invoice.Controller.Security.Default;

interface

uses Invoice.Controller.Interfaces, System.Classes, System.SysUtils, System.IOUtils, Vcl.Forms, Vcl.Dialogs;

type
     TControllerSecurityDefault = class(TInterfacedObject, iControllerSecurityDefault)
     private
          FListLog: TStrings;
          FFileName: String;
          procedure SaveLog;
     public
          constructor Create;
          destructor Destroy; Override;
          class function New: iControllerSecurityDefault;
          function Login(aUser, aPasswood: String): Boolean;
          function ShowLog: TStrings;
          function AddLog(aLog: String): iControllerSecurityDefault;
     end;

implementation

{ TControllerSecurityDefault }

constructor TControllerSecurityDefault.Create;
begin
     FListLog := TStringList.Create;
     //
     FFileName := Copy(Application.ExeName, 1, Length(Application.ExeName) - 4) + '.LOG';
end;

destructor TControllerSecurityDefault.Destroy;
begin
     SaveLog;
     //
     FListLog.Free;
     //
     inherited;
end;

class function TControllerSecurityDefault.New: iControllerSecurityDefault;
begin
     Result := Self.Create;
end;

function TControllerSecurityDefault.Login(aUser, aPasswood: String): Boolean;
begin
     Result := (aUser = aPasswood);
end;

function TControllerSecurityDefault.AddLog(aLog: String): iControllerSecurityDefault;
begin
     Result := Self;
     //
     if (aLog <> '') then
          FListLog.Add(DateTimeToStr(Now) + ' - ' + aLog);
end;

procedure TControllerSecurityDefault.SaveLog;
var
     MyLog: TextFile;
     RowCount: Integer;
begin
     AssignFile(MyLog, FFileName);
     //
     if FileExists(FFileName) then
          Append(MyLog)
     else Rewrite(MyLog);
     //
     for RowCount := 0 to FListLog.Count -1 do
     begin
          WriteLn(MyLog, FListLog[RowCount]);
     end;
     //
     CloseFile(MyLog)
end;

function TControllerSecurityDefault.ShowLog: TStrings;
begin
     Result := FListLog;
end;

end.
