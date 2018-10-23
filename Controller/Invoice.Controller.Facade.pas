unit Invoice.Controller.Facade;

interface

uses
     Invoice.Controller.Interfaces;

type
     TControllerGeneralFacade = class(TInterfacedObject, iControllerModelFacade)
     private
          FAppInfos: iControllerAppInfoFactory;
          FCharts: iControllerChartFactory;
     public
          constructor Create;
          destructor Destroy; Override;
          class function New: iControllerModelFacade;
          function AppInfoFactory: iControllerAppInfoFactory;
          function ChartFactory: iControllerChartFactory;
     end;

implementation

{ TControllerGeneralFacade }

uses
  Invoice.Controller.Chart.Factory, Invoice.Controller.AppInfo.Factory;

function TControllerGeneralFacade.AppInfoFactory: iControllerAppInfoFactory;
begin
     FAppInfos := TControllerAppInfoFactory.New;
     //
     Result := FAppInfos;
end;

function TControllerGeneralFacade.ChartFactory: iControllerChartFactory;
begin
     FCharts := TControllerChartFactory.New;
     //
     Result := FCharts;
end;

constructor TControllerGeneralFacade.Create;
begin
     //
end;

destructor TControllerGeneralFacade.Destroy;
begin
     inherited;
end;

class function TControllerGeneralFacade.New: iControllerModelFacade;
begin
     Result := Self.Create;
end;


end.
