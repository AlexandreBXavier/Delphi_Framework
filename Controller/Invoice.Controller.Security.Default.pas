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
          function Login(aUsername, aPasswood: String): Integer;
          function ShowLog: TStrings;
          function AddLog(aLog: String): iControllerSecurityDefault;
          function EnCrypt(InString: String): String;
          function DeCrypt(InString: String): String;
     end;

implementation

{ TControllerSecurityDefault }


const
     KeyCrypt = 'YUQL23KL23DF90WI5E1JAS467NMCXXL6JAOAUWWMCL0AOMM4A4VZYW9KHJUI2347EJHJKDF3424SKL K3LAKDJSL9RTIKJ';

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

function TControllerSecurityDefault.Login(aUsername, aPasswood: String): Integer;
begin
     Result := 0;
     //
     if (aUsername = aPasswood) then Result := 1;
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

function TControllerSecurityDefault.EnCrypt(InString: String): String;
var
     KeyLen: Integer;
     KeyPos: Integer;
     OffSet: Integer;
     Dest: String;
     SrcPos: Integer;
     SrcAsc: Integer;
     TmpSrcAsc: Integer;
     Range: Integer;
begin
     Result := '';
     //
     Dest := '';
     KeyLen := Length(KeyCrypt);
     KeyPos := 0;
     SrcPos := 0;
     SrcAsc := 0;
     Range := 256;
     //
     Randomize;
     //
     OffSet := Random(Range);
     //
     Dest := Format('%1.2x', [OffSet]);
     //
     for SrcPos := 1 to Length(InString) do
     begin
          Application.ProcessMessages;
          //
          SrcAsc := (Ord(InString[SrcPos]) + OffSet) Mod 255;
          //
          if KeyPos < KeyLen then
               KeyPos := KeyPos + 1
          else
               KeyPos := 1;
          //
          SrcAsc := SrcAsc Xor Ord(KeyCrypt[KeyPos]);
          //
          Dest := Dest + Format('%1.2x', [SrcAsc]);
          //
          OffSet := SrcAsc;
     end;
     //
     Result := Dest;
end;

function TControllerSecurityDefault.DeCrypt(InString: String): String;
var
     KeyLen: Integer;
     KeyPos: Integer;
     OffSet: Integer;
     Dest: String;
     SrcPos: Integer;
     SrcAsc: Integer;
     TmpSrcAsc: Integer;
     Range: Integer;
begin
     Result := '';
     //
     Dest := '';
     KeyLen := Length(KeyCrypt);
     KeyPos := 0;
     SrcPos := 0;
     SrcAsc := 0;
     Range := 256;
     //
     OffSet := StrToInt('$' + copy(InString, 1, 2));
     //
     SrcPos := 3;
     //
     repeat
          SrcAsc := StrToInt('$' + copy(InString, SrcPos, 2));
          //
          if (KeyPos < KeyLen) Then
               KeyPos := KeyPos + 1
          else
               KeyPos := 1;
          //
          TmpSrcAsc := SrcAsc Xor Ord(KeyCrypt[KeyPos]);
          //
          if TmpSrcAsc <= OffSet then
               TmpSrcAsc := 255 + TmpSrcAsc - OffSet
          else
               TmpSrcAsc := TmpSrcAsc - OffSet;
          //
          Dest := Dest + Chr(TmpSrcAsc);
          //
          OffSet := SrcAsc;
          //
          SrcPos := SrcPos + 2;
     until (SrcPos >= Length(InString));
     //
     Result := Dest;
end;

end.
