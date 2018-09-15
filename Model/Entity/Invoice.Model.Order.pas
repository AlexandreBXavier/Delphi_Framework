unit Invoice.Model.Order;

interface

uses
  DB,
  Classes,
  SysUtils,
  Generics.Collections,
  /// orm
  Invoice.Model.Customer,
  ormbr.types.blob,
  ormbr.types.lazy,
  ormbr.types.mapping,
  ormbr.types.nullable,
  ormbr.mapping.classes,
  ormbr.mapping.register,
  ormbr.mapping.attributes;

type
  [Entity]
  [Table('Order', '')]
  [PrimaryKey('idOrder', NotInc, NoSort, False, 'Chave primária')]
  TOrder = class
  private
    { Private declarations }
    FidOrder: Integer;
    FdataOrder: TDateTime;
    FidCustomer: Integer;

    FCustomer_0: TCustomer;
  public
    { Public declarations }
    constructor Create;
    destructor Destroy; override;
    [Restrictions([NotNull])]

    [Column('idOrder', ftInteger)]
    [Dictionary('idOrder', 'Mensagem de validação', '', '', '', taCenter)]
    property idOrder: Integer Index 0 read FidOrder write FidOrder;

    [Restrictions([NotNull])]
    [Column('dataOrder', ftDateTime)]
    [Dictionary('dataOrder', 'Mensagem de validação', 'Now', '', '!##/##/####;1;_', taCenter)]
    property dataOrder: TDateTime Index 1 read FdataOrder write FdataOrder;

    [Restrictions([NotNull])]
    [Column('idCustomer', ftInteger)]
    [ForeignKey('Customer', 'idCustomer', SetNull, SetNull)]
    [Dictionary('idCustomer', 'Mensagem de validação', '', '', '', taCenter)]
    property idCustomer: Integer Index 2 read FidCustomer write FidCustomer;

    [Association(OneToOne,'idCustomer','idCustomer')]
    property Customer: TCustomer read FCustomer_0 write FCustomer_0;

  end;

implementation

constructor TOrder.Create;
begin
  FCustomer_0 := TCustomer.Create;
end;

destructor TOrder.Destroy;
begin
  FCustomer_0.Free;
  inherited;
end;

initialization
  TRegisterClass.RegisterEntity(TOrder)

end.

