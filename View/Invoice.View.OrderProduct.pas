unit Invoice.View.OrderProduct;

interface

uses
     Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
     Vcl.Controls, Vcl.Forms, Vcl.Dialogs;

type
     TFormOrderProduct = class(TForm)
          procedure FormShow(Sender: TObject);
     private
          { Private declarations }
          idCustomer: Integer;
          nameCustomer: String;
     public
          { Public declarations }
          procedure SetidCustomer(aCustumer: Integer);
          procedure SetnameCustomer(aCustumer: String);
     end;

var
     FormOrderProduct: TFormOrderProduct;

implementation

{$R *.dfm}

{ TFormOrderProduct }

procedure TFormOrderProduct.FormShow(Sender: TObject);
begin
     Caption := Caption + ' - [ ' + nameCustomer + ' ]';
end;

procedure TFormOrderProduct.SetidCustomer(aCustumer: Integer);
begin
     idCustomer := aCustumer;
end;

procedure TFormOrderProduct.SetnameCustomer(aCustumer: String);
begin
     nameCustomer := aCustumer;
end;

end.
