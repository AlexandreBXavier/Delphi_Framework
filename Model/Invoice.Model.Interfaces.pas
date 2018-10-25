unit Invoice.Model.Interfaces;

interface

uses System.Classes, Data.DB;

type

     iQuery = interface
          ['{6C0CDB32-885F-4DC6-B4DC-041B1D4F9173}']
          procedure Open;
          procedure Close;
          function SQL(Value: String): iQuery;
          function DataSet: TDataSet;
          function Order(aFieldName: String): iQuery;
     end;

     iTable = interface
          ['{33CD1DDC-EB9F-47F8-B4D4-A0D0401A71D4}']
          function Open(aTable: String): TDataSet;
     end;

implementation

end.
