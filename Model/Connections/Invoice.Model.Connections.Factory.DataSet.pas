unit Invoice.Model.Connections.Factory.DataSet;

interface

uses
  {$IFDEF FIREDAC}
  Invoice.Model.Connections.TableFiredac,
  {$ENDIF}
  {$IFDEF ZEOS}
  Invoice.Model.Connections.Zeos.DataSet,
  {$ENDIF}
  Invoice.Model.Connections.Interfaces;

Type
  TModelConnectionFactoryDataSet = class(TInterfacedObject, iModelFactoryDataSet)
    private
    public
      constructor Create;
      destructor Destroy; override;
      class function New : iModelFactoryDataSet;
      function DataSetFiredac(Connection : iModelConnection) : iModelDataSet;
      function DataSetZeos(Connection : iModelConnection) : iModelDataSet;
  end;

implementation

{ TModelConnectionFactoryDataSet }

constructor TModelConnectionFactoryDataSet.Create;
begin

end;

function TModelConnectionFactoryDataSet.DataSetFiredac(Connection : iModelConnection) : iModelDataSet;
begin
  {$IFDEF FIREDAC }
  Result := TModelConnectionsTableFiredac.New(Connection);
  {$ENDIF}
end;

function TModelConnectionFactoryDataSet.DataSetZeos(
  Connection: iModelConnection): iModelDataSet;
begin
  {$IFDEF ZEOS}
    Result := TModelConnectionsZeosDataSet.New(Connection);
  {$ENDIF}
end;

destructor TModelConnectionFactoryDataSet.Destroy;
begin

  inherited;
end;

class function TModelConnectionFactoryDataSet.New: iModelFactoryDataSet;
begin
  Result := Self.Create;
end;

end.
