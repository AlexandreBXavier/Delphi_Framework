unit Invoice.Controller.Facade;

interface

uses
     Invoice.Controller.Interfaces;

type
     TControllerGeneralFacade = class(TInterfacedObject, iControllerModelFacade)
     private
          FAppInfo: iControllerAppInfoFactory;
          FWinInfo: iControllerWinInfoFactory;
          FChart: iControllerChartFactory;
          FIniFile: iControllerIniFileFactory;
          FSecurity: iControllerSecurityFactory;
          FTabForm: iControllerTabFormFactory;
     public
          constructor Create;
          destructor Destroy; Override;
          class function New: iControllerModelFacade;
          function AppInfoFactory: iControllerAppInfoFactory;
          function IniFileFactory: iControllerIniFileFactory;
          function SecurityFactory: iControllerSecurityFactory;
          function TabFormFactory: iControllerTabFormFactory;
          function ChartFactory: iControllerChartFactory;
          function WinInfoFactory: iControllerWinInfoFactory;
     end;

implementation

{ TControllerGeneralFacade }

uses
     Invoice.Controller.Chart.Factory, Invoice.Controller.AppInfo.Factory, Invoice.Controller.IniFile.Factory, Invoice.Controller.Security.Factory,
     Invoice.Controller.TabForm.Factory, Invoice.Controller.WinInfo.Factory;

function TControllerGeneralFacade.AppInfoFactory: iControllerAppInfoFactory;
begin
     FAppInfo := TControllerAppInfoFactory.New;
     //
     Result := FAppInfo;
end;

function TControllerGeneralFacade.ChartFactory: iControllerChartFactory;
begin
     FChart := TControllerChartFactory.New;
     //
     Result := FChart;
end;

constructor TControllerGeneralFacade.Create;
begin
     //
end;

destructor TControllerGeneralFacade.Destroy;
begin
     inherited;
end;

function TControllerGeneralFacade.IniFileFactory: iControllerIniFileFactory;
begin
     FIniFile := TControllerIniFileFactory.New;
     //
     Result := FIniFile;
end;

class function TControllerGeneralFacade.New: iControllerModelFacade;
begin
     Result := Self.Create;
end;

function TControllerGeneralFacade.SecurityFactory: iControllerSecurityFactory;
begin
     FSecurity := TControllerSecurityFactory.New;
     //
     Result := FSecurity;
end;

function TControllerGeneralFacade.TabFormFactory: iControllerTabFormFactory;
begin
     FTabForm := TControllerTabFormFactory.New;
     //
     Result := FTabForm;
end;

function TControllerGeneralFacade.WinInfoFactory: iControllerWinInfoFactory;
begin
     FWinInfo := TControllerWinInfoFactory.New;
     //
     Result := FWinInfo;
end;

end.
