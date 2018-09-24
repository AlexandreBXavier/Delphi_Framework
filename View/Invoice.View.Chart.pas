unit Invoice.View.Chart;

interface

uses
     Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
     Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.OleCtrls, SHDocVw;

type
     TFormChart = class(TForm)
     PanelBackground: TPanel;
     WebBrowserLocal: TWebBrowser;
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure FormShow(Sender: TObject);
  private
     { Private declarations }
     procedure SetWebPage(WebAddress: String);
     procedure SetWebChart;
  public
     { Public declarations }
  end;

var
  FormChart: TFormChart;

implementation

{$R *.dfm}

uses Invoice.Controller.Chart.Factory, Invoice.Controller.AppInfo.Factory;


procedure TFormChart.SetWebPage(WebAddress: String);
begin
     WebBrowserLocal.Navigate(WebAddress);
end;

procedure TFormChart.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     Action := caFree;
end;

procedure TFormChart.FormShow(Sender: TObject);
begin
     //SetWebPage(TControllerAppInfoFactory.New.Default.LegalTrademarks);
     //
     SetWebChart;
end;

procedure TFormChart.SetWebChart;
begin
     TControllerChartFactory.New.Default
          .SetCharTitle('Sales in 2018')
          .SetCharSubTitle('Sales of Product 2018')
          .AddTitle('Product','Amount')
          .AddValue('Pens','190')
          .AddValue('Glasses','110')
          .AddValue('Cups','90')
          .AddValue('Papers','88')
          .AddValue('Scissors','63')
          .ShowChart(WebBrowserLocal);
end;

Initialization

RegisterClass(TFormChart);

Finalization

UnRegisterClass(TFormChart);

end.
