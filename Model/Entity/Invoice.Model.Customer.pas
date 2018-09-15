unit Invoice.Model.Customer;

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
  [Table('Customer', '')]
  TCustomer = class
  private
    { Private declarations }
    FidCustomer: Integer;
    FnameCustomer: String;
    FphoneCustomer: String;
  public
    { Public declarations }

    [Restrictions([NotNull])]
    [Column('idCustomer', ftInteger)]
    [Dictionary('idCustomer', 'Mensagem de validação', '', '', '', taCenter)]
    property idCustomer: Integer Index 0 read FidCustomer write FidCustomer;

    [Restrictions([NotNull])]
    [Column('nameCustomer', ftString, 100)]
    [Dictionary('nameCustomer', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property nameCustomer: String Index 1 read FnameCustomer write FnameCustomer;

    [Restrictions([NotNull])]
    [Column('phoneCustomer', ftString, 11)]
    [Dictionary('phoneCustomer', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property phoneCustomer: String Index 2 read FphoneCustomer write FphoneCustomer;
  end;

implementation

initialization

  TRegisterClass.RegisterEntity(TCustomer)

end.

