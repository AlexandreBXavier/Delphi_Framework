unit Invoice.Controller.AppInfo.Default;

interface

uses Invoice.Controller.Interfaces, Winapi.Windows, Winapi.Messages, Vcl.Forms;

type
     TControllerAppInfoDefault = class(TInterfacedObject, iControllerAppInfoDefault)
     private
          FCompanyName: String;
          FFileDescription: String;
          FFileVersion: String;
          FInternalName: String;
          FLegalCopyright: String;
          FLegalTradeMarks: String;
          FOriginalFilename: String;
          FProductName: String;
          FProductVersion: String;
          FComments: String;
     public
          constructor Create;
          destructor Destroy; Override;
          class function New: iControllerAppInfoDefault;
          function CompanyName: String;
          function FileDescription: String;
          function FileVersion: String;
          function InternalName: String;
          function LegalCopyright: String;
          function LegalTradeMarks: String;
          function OriginalFilename: String;
          function ProductName: String;
          function ProductVersion: String;
          function Comments: String;
     end;

implementation

{ TControllerAppInfoDefault }

function GetAppInfo(AppInfo: String): String;
var
     ExeApp: String;
     SizeOf: Integer;
     Buf: pchar;
     Value: pchar;
     Tmp1, Tmp2: Dword;
begin
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

constructor TControllerAppInfoDefault.Create;
begin
     FCompanyName := GetAppInfo('CompanyName');
     FFileDescription := GetAppInfo('FileDescription');
     FFileVersion := GetAppInfo('FileVersion');
     FInternalName := GetAppInfo('InternalName');
     FLegalCopyright := GetAppInfo('LegalCopyright');
     FLegalTradeMarks := GetAppInfo('LegalTradeMarks');
     FOriginalFilename := GetAppInfo('OriginalFilename');
     FProductName := GetAppInfo('ProductName');
     FProductVersion := GetAppInfo('ProductVersion');
     FComments := GetAppInfo('Comments');
end;

destructor TControllerAppInfoDefault.Destroy;
begin
     inherited;
end;

class function TControllerAppInfoDefault.New: iControllerAppInfoDefault;
begin
     Result := Self.Create;
end;

function TControllerAppInfoDefault.Comments: String;
begin
     Result := FComments;
end;

function TControllerAppInfoDefault.CompanyName: String;
begin
     Result := FCompanyName;
end;

function TControllerAppInfoDefault.FileDescription: String;
begin
     Result := FFileDescription;
end;

function TControllerAppInfoDefault.FileVersion: String;
begin
     Result := FFileVersion;
end;

function TControllerAppInfoDefault.InternalName: String;
begin
     Result := FInternalName;
end;

function TControllerAppInfoDefault.LegalCopyright: String;
begin
     Result := FLegalCopyright;
end;

function TControllerAppInfoDefault.LegalTradeMarks: String;
begin
     Result := FLegalTradeMarks;
end;

function TControllerAppInfoDefault.OriginalFilename: String;
begin
     Result := FOriginalFilename;
end;

function TControllerAppInfoDefault.ProductName: String;
begin
     Result := FProductName;
end;

function TControllerAppInfoDefault.ProductVersion: String;
begin
     Result := FProductVersion;
end;

end.
