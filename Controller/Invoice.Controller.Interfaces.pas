unit Invoice.Controller.Interfaces;

interface

uses Vcl.ComCtrls, Vcl.ActnList, System.Classes, Data.DB, SHDocVw, Invoice.Model.Interfaces;

type
     iControllerIniFileDefault = interface;
     iControllerWinInfoDefault = interface;
     iControllerAppInfoDefault = interface;
     iControllerTabFormDefault = interface;
     iControllerSecurityDefault = interface;
     iModelConnectionParametros = interface;

     iModelConnection = interface
          ['{E8538D27-DFF2-4485-A303-616176681A93}']
          function Connection: TCustomConnection;
          function Parametros: iModelConnectionParametros;
     end;

     iModelConnectionParametros = interface
          ['{69BA62BF-43C2-495B-8E0B-C5B6D509FFCB}']
          function DriverID(Value: String): iModelConnectionParametros;
          function Server(Value: String): iModelConnectionParametros;
          function Porta(Value: Integer): iModelConnectionParametros;
          function Database(Value: String): iModelConnectionParametros;
          function UserName(Value: String): iModelConnectionParametros;
          function Password(Value: String): iModelConnectionParametros;
          function EndParametros: iModelConnection;
     end;

     iModelConnectionFactory = interface
          ['{20983058-4995-49E6-86B8-F638E5C05743}']
          function ConnectionFiredac : iModelConnection;
     end;

     iEntity = interface
          ['{976C5307-B7E8-4C8B-B283-D24DB4ED11F0}']
          function List: iEntity;
          function ListWhere(aSQL: String): iEntity;
          function DataSet: TDataSet;
          function OrderBy(aFieldName: String): iEntity;
     end;

     iModelEntityFactory = interface
          ['{0A4C9901-4FEB-4277-A62B-444457C251DE}']
          function User(Connection: iModelConnection): iEntity;
          function Product(Connection: iModelConnection): iEntity;
          function TypePayment(Connection: iModelConnection): iEntity;
          function Customer(Connection: iModelConnection): iEntity;
     end;

     iModelTableFactory = interface
          ['{5C7FAC45-B671-4897-B18F-CCAE970B8885}']
          function Table(Connection: iModelConnection): iTable;
     end;

     iModelQueryFactory = interface
          ['{8E2C37DF-507C-4539-88B4-75B093774BDA}']
          function Query(Connection: iModelConnection): iQuery;
     end;

     iControllerIniFileFactory = interface
          ['{353DEFB6-3AF0-44D0-84EB-D520E664417E}']
          function Default: iControllerIniFileDefault;
     end;

     iControllerIniFileDefault = interface
          ['{A69FADDB-ACE2-4D43-AC05-B4A7E0054AA8}']
          function InputKey(Sector: String; Key: String; Value: String; IsCrypt: Boolean): String;
     end;

     iControllerWinInfoFactory = interface
          ['{8E4644BB-0F10-4F8D-B01A-896E3DC3F1D3}']
          function Default: iControllerWinInfoDefault;
     end;

     iControllerWinInfoDefault = interface
          ['{C6FF4BD0-606C-4B7E-A4AE-C263868DAF86}']
          function UserName: String;
          function ComputerName: String;
     end;

     iControllerAppInfoFactory = interface
          ['{F69EB5A1-57B8-4144-94C0-94DAFA900551}']
          function Default: iControllerAppInfoDefault;
     end;

     iControllerAppInfoDefault = interface
          ['{DF23FDBC-7819-4A0E-B4E2-2289313CFB28}']
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

     iControllerChartDefault = interface
          ['{E68D2823-79B8-42F7-8455-B87FD5598C03}']
          function SetCharTitle(aValue: String): iControllerChartDefault;
          function SetCharSubTitle(aValue: String): iControllerChartDefault;
          function AddTitle(aDescription, aValue: String): iControllerChartDefault;
          function AddValue(aDescription, aValue: String): iControllerChartDefault;
          procedure ShowChart(aWebBrowser: TWebBrowser);
     end;

     iControllerChartFactory = interface
          ['{599B5323-71FF-46A5-9473-FF934913AD48}']
          function Default: iControllerChartDefault;
     end;

     iControllerTabFormFactory = interface
          ['{94895871-5E89-4FF0-8D18-F893C59FF869}']
          function Default: iControllerTabFormDefault;
     end;

     iControllerTabFormDefault = interface
          ['{E75A0D8A-5BC5-44A9-AE4A-45ED9E9D3324}']
          function CreateTab(aAction: TAction; aPageControl: TPageControl): TTabSheet;
          procedure ShowForm(aTabSheet: TTabSheet; NameForm: String);
     end;

     iControllerSecurityFactory = interface
          ['{F4D1C694-628D-4691-BFF8-83DE765F47F5}']
          function Default: iControllerSecurityDefault;
     end;

     iControllerSecurityDefault = interface
          ['{5B1DA1D8-DF07-4627-9CFE-0B4F68CDA640}']
          function Login(aUsername, aPasswood: String): Integer;
          function ShowLog: TStrings;
          function AddLog(aLog: String): iControllerSecurityDefault;
          function EnCrypt(InString: String): String;
          function DeCrypt(InString: String): String;
     end;

     iControllerEntityFactory = interface
          ['{1695B22D-2EA4-4471-B1AA-D8F567588881}']
          function Default: iModelEntityFactory;
     end;

     iControllerModelFacade = interface
          ['{A5B19DB6-9347-4332-BFCA-A07AE1C7D0BD}']
          function AppInfoFactory: iControllerAppInfoFactory;
          function IniFileFactory: iControllerIniFileFactory;
          function SecurityFactory: iControllerSecurityFactory;
          function TabFormFactory: iControllerTabFormFactory;
          function ChartFactory: iControllerChartFactory;
          function WinInfoFactory: iControllerWinInfoFactory;
          function EntityFactory: iModelEntityFactory;
     end;

implementation

end.
