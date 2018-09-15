unit Invoice.Model.Windows;

interface

uses Invoice.Model.Windows.Interfaces, Winapi.Windows, Winapi.Messages, Vcl.Dialogs, Vcl.Forms,
     System.SysUtils, System.Variants, System.Classes, System.UITypes, System.IniFiles;

type
  TModelWindows = class(TInterfacedObject, iModelWindows)
      constructor Create;
      destructor Destroy; override;
      class function New: iModelWindows;
      function GetWindowsUserName: String;
      function GetWindowsComputerName: String;
      function GetAppInfo(AppInfo: String): String;
      function FileINI(FileName: String; Sector: String; Key: String; Value: String): String;
  end;

implementation


function TModelWindows.GetWindowsComputerName: String;
var
     Name: Array [0 .. 255] of Char;
     NameSize: Dword;
begin
     NameSize := SizeOf(Name);
     if not GetUserName(Name, NameSize) then
          Name[0] := #0;
     result := UpperCase(StrPas(Name));
end;

function TModelWindows.GetWindowsUserName: String;
var
     Name: Array [0 .. 255] of Char;
     NameSize: Dword;
begin
     NameSize := SizeOf(Name);
     if not GetUserName(Name, NameSize) then
          Name[0] := #0;
     result := UpperCase(StrPas(Name));
end;

class function TModelWindows.New: iModelWindows;
begin
     Result := Self.Create;
end;

function TModelWindows.GetAppInfo(AppInfo: String): String;
var
     ExeApp: String;
     SizeOf: Integer;
     Buf: pchar;
     Value: pchar;
     Tmp1, Tmp2: Dword;
begin
     {
       'CompanyName', 'FileDescription', 'FileVersion', 'InternalName',
       'LegalCopyright', 'LegalTradeMarks', 'OriginalFilename',
       'ProductName', 'ProductVersion', 'Comments'
     }
     ExeApp := Application.ExeName;
     SizeOf := GetFileVersionInfoSize(pchar(ExeApp), Tmp1);
     result := '';
     if (SizeOf > 0) then
     begin
          Buf := AllocMem(SizeOf);
          //
          if GetFileVersionInfo(pchar(ExeApp), 0, SizeOf, Buf) then
               if VerQueryValue(Buf, pchar('StringFileInfo\041604E4\' + AppInfo), pointer(Value), Tmp2) then
                    result := Value
               else if VerQueryValue(Buf, pchar('StringFileInfo\040904E4\' + AppInfo), pointer(Value), Tmp2) then
                    result := Value
               else
                    result := '';
          //
          FreeMem(Buf, SizeOf);
     end;
end;

constructor TModelWindows.Create;
begin
     //
end;

destructor TModelWindows.Destroy;
begin
     inherited;
end;

function TModelWindows.FileINI(FileName: String; Sector: String; Key: String; Value: String): String;
var
     MyIniFile: TIniFile;
     InputString: string;
begin
     MyIniFile := Nil;
     //
     try
          MyIniFile := TIniFile.Create(FileName);
          //
          if not MyIniFile.ValueExists(Sector, Key) then
          begin
               InputString := InputBox('Key of Record [' + Sector + ']', Key, Value);
               //
               MyIniFile.WriteString(Sector, Key, InputString);
          end;
          //
          try
               result := Trim(MyIniFile.ReadString(Sector, Key, ''));
          except
               result := '';
          end;
     finally
          MyIniFile.Free;
     end;
end;

end.
