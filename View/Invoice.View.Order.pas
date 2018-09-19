unit Invoice.View.Order;

interface

uses
     Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
     Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
     TFormOrder = class(TForm)
          procedure FormClose(Sender: TObject; var Action: TCloseAction);
     private
          { Private declarations }
     public
          { Public declarations }
     end;

var
     FormOrder: TFormOrder;

implementation

{$R *.dfm}

uses Invoice.Controller.Security.Factory;

procedure TFormOrder.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     Action := caFree;
end;

Initialization

RegisterClass(TFormOrder);

Finalization

UnRegisterClass(TFormOrder);

end.
