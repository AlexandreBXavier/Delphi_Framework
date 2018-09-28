unit Invoice.Model.Interfaces;

interface

uses System.Classes, Data.DB;

type

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

     iQuery = interface
          ['{6C0CDB32-885F-4DC6-B4DC-041B1D4F9173}']
          procedure Open;
          procedure Close;
          function SQL(Value: String): iQuery;
          function DataSet: TDataSet;
     end;

     iTable = interface
          ['{33CD1DDC-EB9F-47F8-B4D4-A0D0401A71D4}']
          function Open(aTable: String): TDataSet;
     end;

     iEntity = interface
          ['{976C5307-B7E8-4C8B-B283-D24DB4ED11F0}']
          function List: iEntity;
          function ListWhere(aSQL: String): iEntity;
          function DataSet: TDataSet;
     end;

     iModelTableFactory = interface
          ['{5C7FAC45-B671-4897-B18F-CCAE970B8885}']
          function Table(Connection: iModelConnection): iTable;
     end;

     iModelQueryFactory = interface
          ['{8E2C37DF-507C-4539-88B4-75B093774BDA}']
          function Query(Connection: iModelConnection): iQuery;
     end;

implementation

end.
