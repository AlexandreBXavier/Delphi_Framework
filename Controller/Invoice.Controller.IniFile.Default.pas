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

const
     KeyCrypt = 'YUQL23KL23DF90WI5E1JAS467NMCXXL6JAOAUWWMCL0AOMM4A4VZYW9KHJUI2347EJHJKDF3424SKL K3LAKDJSL9RTIKJ';

function EnCrypt(InString: String): String;
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

function DeCrypt(InString: String): String;
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

constructor TControllerIniFileDefault.Create;
begin
     FFileName := copy(Application.ExeName, 1, Length(Application.ExeName) - 4) + '.INI';
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
                    InputCrypt := EnCrypt(Trim(InputString))
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
                    Result := DeCrypt(InputString)
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
