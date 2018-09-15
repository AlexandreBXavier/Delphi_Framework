unit Invoice.Model.OrderPayment;

interface

uses
  DB,
  Classes,
  SysUtils,
  Generics.Collections,
  /// orm
  Invoice.Model.Order,
  Invoice.Model.TypePayment,
  ormbr.types.blob,
  ormbr.types.lazy,
  ormbr.types.mapping,
  ormbr.types.nullable,
  ormbr.mapping.classes,
  ormbr.mapping.register,
  ormbr.mapping.attributes;

type
  [Entity]
  [Table('Invoice.dbo.OrderPayment', '')]
  [PrimaryKey('idOrder', NotInc, NoSort, False, 'Chave primária')]
  [PrimaryKey('amountOrder', NotInc, NoSort, False, 'Chave primária')]
  TOrderPayment = class
  private
    { Private declarations }
    FidOrder: Integer;
    FamountOrder: Integer;
    FidTypePayment: Integer;
    FdataPayment: TDateTime;
    FvaluePayment: Currency;

    FOrder_0: TOrder;
    FTypePayment_1: TTypePayment;
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
    [Column('amountOrder', ftInteger)]
    [Dictionary('amountOrder', 'Mensagem de validação', '', '', '', taCenter)]
    property amountOrder: Integer Index 1 read FamountOrder write FamountOrder;

    [Restrictions([NotNull])]
    [Column('idTypePayment', ftInteger)]
    [ForeignKey('TypePayment', 'idTypePayment', SetNull, SetNull)]
    [Dictionary('idTypePayment', 'Mensagem de validação', '', '', '', taCenter)]
    property idTypePayment: Integer Index 2 read FidTypePayment write FidTypePayment;

    [Restrictions([NotNull])]
    [Column('dataPayment', ftDateTime)]
    [Dictionary('dataPayment', 'Mensagem de validação', 'Now', '', '!##/##/####;1;_', taCenter)]
    property dataPayment: TDateTime Index 3 read FdataPayment write FdataPayment;

    [Restrictions([NotNull])]
    [Column('valuePayment', ftCurrency)]
    [Dictionary('valuePayment', 'Mensagem de validação', '0', '', '', taRightJustify)]
    property valuePayment: Currency Index 4 read FvaluePayment write FvaluePayment;

    [Association(OneToOne,'idOrder','idOrder')]
    property Order: TOrder read FOrder_0 write FOrder_0;

    [Association(OneToOne,'idTypePayment','idTypePayment')]
    property TypePayment: TTypePayment read FTypePayment_1 write FTypePayment_1;

  end;

implementation

constructor TOrderPayment.Create;
begin
  FOrder_0 := TOrder.Create;
  FTypePayment_1 := TTypePayment.Create;
end;

destructor TOrderPayment.Destroy;
begin
  FOrder_0.Free;
  FTypePayment_1.Free;
  inherited;
end;

initialization
  TRegisterClass.RegisterEntity(TOrderPayment)

end.

