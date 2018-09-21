unit Invoice.Controller.IniFile.Default;

interface

uses Invoice.Controller.Interfaces, Vcl.Dialogs, System.IniFiles, System.SysUtils, Vcl.Forms;

type
     TControllerIniFileDefault = class(TInterfacedObject, iControllerIniFileDefault)
     private
          FFileName: String;
     public
          constructor Create;
          destructor Destroy; Override;
          class function New: iControllerIniFileDefault;
          function InputKey(Sector: String; Key: String; Value: String; IsCrypt: Boolean): String;
     end;

implementation

{ TControllerIniFileDefault }

uses Invoice.Controller.Security.Factory;

constructor TControllerIniFileDefault.Create;
begin
     FFileName := Copy(Application.ExeName, 1, Length(Application.ExeName) - 4) + '.INI';
end;

destructor TControllerIniFileDefault.Destroy;
begin
     inherited;
end;

class function TControllerIniFileDefault.New: iControllerIniFileDefault;
begin
     Result := Self.Create;
end;

function TControllerIniFileDefault.InputKey(Sector, Key, Value: String; IsCrypt: Boolean): String;
var
     MyIniFile: TIniFile;
     InputString: String;
     InputCrypt: String;
begin
     Result := '';
     //
     MyIniFile := TIniFile.Create(FFileName);
     //
     try
          if not MyIniFile.ValueExists(Sector, Key) then
          begin
               InputString := InputBox('Key of Record [' + Sector + ']', Key, Value);
               //
               if IsCrypt then
                    InputCrypt := TControllerSecurityFactory.New.Default.EnCrypt(Trim(InputString))
               else
                    InputCrypt := Trim(InputString);
               //
               MyIniFile.WriteString(Sector, Key, InputCrypt);
          end;
          //
          try
               InputString := MyIniFile.ReadString(Sector, Key, '');
               //
               if IsCrypt then
                    Result := TControllerSecurityFactory.New.Default.DeCrypt(InputString)
               else
                    Result := InputString;
          except
               Result := '';
          end;
     finally
          MyIniFile.Free;
     end;
end;

end.
