unit Invoice.Model.Product;

interface

uses
  DB,
  Classes,
  SysUtils,
  Generics.Collections,
  /// orm
  ormbr.types.blob,
  ormbr.types.lazy,
  ormbr.types.mapping,
  ormbr.types.nullable,
  ormbr.mapping.classes,
  ormbr.mapping.register,
  ormbr.mapping.attributes;

type
  [Entity]
  [Table('Product', '')]
  TProduct = class
  private
    { Private declarations }
    FidProduct: Integer;
    FnameProduct: String;
    FpriceProduct: Currency;
  public
    { Public declarations }

    [Restrictions([NotNull])]
    [Column('idProduct', ftInteger)]
    [Dictionary('idProduct', 'Mensagem de validação', '', '', '', taCenter)]
    property idProduct: Integer Index 0 read FidProduct write FidProduct;

    [Restrictions([NotNull])]
    [Column('nameProduct', ftString, 100)]
    [Dictionary('nameProduct', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property nameProduct: String Index 1 read FnameProduct write FnameProduct;

    [Restrictions([NotNull])]
    [Column('priceProduct', ftCurrency)]
    [Dictionary('priceProduct', 'Mensagem de validação', '0', '', '', taRightJustify)]
    property priceProduct: Currency Index 2 read FpriceProduct write FpriceProduct;
     end;

implementation

initialization
  TRegisterClass.RegisterEntity(TProduct)

end.
