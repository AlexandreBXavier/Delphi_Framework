unit Demos.Model.DataModule;

interface

uses
     Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
     Vcl.Controls, Vcl.Forms, Vcl.Dialogs, System.Actions, Vcl.ActnList, Vcl.Menus, System.UITypes,
     Vcl.Themes, Vcl.Styles, Vcl.AppEvnts, Vcl.ImgList, System.IniFiles,
     FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
     FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait, FireDAC.Phys.MSSQLDef, FireDAC.Phys.ODBCBase,
     FireDAC.Phys.MSSQL, FireDAC.Comp.UI, Data.DB, FireDAC.Comp.Client, ShellAPI;

type
     TfrmDataModule = class(TDataModule)
          FDConnection: TFDConnection;
          FDGUIxWaitCursor: TFDGUIxWaitCursor;
          FDPhysMSSQLDriverLink: TFDPhysMSSQLDriverLink;
          function GetWindowsUserName: String;
          function GetWindowsComputerName: String;
          function GetAppInfo(AppInfo: String): String;
          function FileINI(FileName: String; Sector: String; Key: String; Value: String): String;
    procedure DataModuleCreate(Sender: TObject);
     private
          { Private declarations }
     public
          { Public declarations }
     end;

var
     frmDataModule: TfrmDataModule;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}
{$R *.dfm}

function TfrmDataModule.GetWindowsUserName: String;
var
     Name: Array [0 .. 255] of Char;
     NameSize: Dword;
begin
     NameSize := SizeOf(Name);
     if not GetUserName(Name, NameSize) then
          Name[0] := #0;
     result := UpperCase(StrPas(Name));
end;

function TfrmDataModule.GetWindowsComputerName: String;
var
     Name: Array [0 .. 255] of Char;
     NameSize: Dword;
begin
     NameSize := SizeOf(Name);
     if not GetComputerName(Name, NameSize) then
          Name[0] := #0;
     result := UpperCase(StrPas(Name));
end;

procedure TfrmDataModule.DataModuleCreate(Sender: TObject);
var
     FileName: String;
begin
     FileName := Copy(Application.ExeName, 1, Length(Application.ExeName) - 4) + '.INI';
     //
     FDConnection.Close;
     //
     try
          FDConnection.Params.Clear;
          FDConnection.Params.Add('DriverID=MSSQL');
          FDConnection.Params.Add('OSAuthent=No');
          FDConnection.Params.Add('Server=' + FileINI(FileName, 'Server', 'HostName', ''));
          FDConnection.Params.Add('Database=' + FileINI(FileName, 'Server', 'Database', ''));
          FDConnection.Params.Add('User_Name=' + FileINI(FileName, 'Server', 'User_Name', ''));
          FDConnection.Params.Add('Password=' + FileINI(FileName, 'Server', 'Password', ''));
          FDConnection.Open;
     except
          on E: Exception do
               MessageDlg(E.Message, mtError, [mbOk], 0);
     end;
end;

function TfrmDataModule.FileINI(FileName: String; Sector: String; Key: String; Value: String): String;
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

function TfrmDataModule.GetAppInfo(AppInfo: String): String;
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

end.
