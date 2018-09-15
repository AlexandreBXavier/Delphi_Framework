unit Invoice.Model.OrderProduct;

interface

uses
  DB,
  Classes,
  SysUtils,
  Generics.Collections,
  /// orm
  Invoice.Model.Order,
  Invoice.Model.Product,
  ormbr.types.blob,
  ormbr.types.lazy,
  ormbr.types.mapping,
  ormbr.types.nullable,
  ormbr.mapping.classes,
  ormbr.mapping.register,
  ormbr.mapping.attributes;

type
  [Entity]
  [Table('OrderProduct', '')]
  [PrimaryKey('idOrder', NotInc, NoSort, False, 'Chave primária')]
  [PrimaryKey('idProduct', NotInc, NoSort, False, 'Chave primária')]
  TOrderProduct = class
  private
    { Private declarations }
    FidOrder: Integer;
    FidProduct: Integer;
    FpriceProduct: Currency;
    FquantityProduct: Double;

    FOrder_0: TOrder;
    FProduct_1: TProduct;
  public
    { Public declarations }
    constructor Create;
    destructor Destroy; override;
    [Restrictions([NotNull])]
    [Column('idOrder', ftInteger)]
    [ForeignKey('Order', 'idOrder', SetNull, SetNull)]
    [Dictionary('idOrder', 'Mensagem de validação', '', '', '', taCenter)]
    property idOrder: Integer Index 0 read FidOrder write FidOrder;

    [Restrictions([NotNull])]
    [Column('idProduct', ftInteger)]
    [ForeignKey('Product', 'idProduct', SetNull, SetNull)]
    [Dictionary('idProduct', 'Mensagem de validação', '', '', '', taCenter)]
    property idProduct: Integer Index 1 read FidProduct write FidProduct;

    [Restrictions([NotNull])]
    [Column('priceProduct', ftCurrency)]
    [Dictionary('priceProduct', 'Mensagem de validação', '0', '', '', taRightJustify)]
    property priceProduct: Currency Index 2 read FpriceProduct write FpriceProduct;

    [Restrictions([NotNull])]
    [Column('quantityProduct', ftBCD, 5, 2)]
    [Dictionary('quantityProduct', 'Mensagem de validação', '0', '', '', taRightJustify)]
    property quantityProduct: Double Index 3 read FquantityProduct write FquantityProduct;

    [Association(OneToOne,'idOrder','idOrder')]
    property Order: TOrder read FOrder_0 write FOrder_0;

    [Association(OneToOne,'idProduct','idProduct')]
    property Product: TProduct read FProduct_1 write FProduct_1;

  end;

implementation

constructor TOrderProduct.Create;
begin
  FOrder_0 := TOrder.Create;
  FProduct_1 := TProduct.Create;
end;

destructor TOrderProduct.Destroy;
begin
  FOrder_0.Free;
  FProduct_1.Free;
  inherited;
end;

initialization
  TRegisterClass.RegisterEntity(TOrderProduct)

end.

