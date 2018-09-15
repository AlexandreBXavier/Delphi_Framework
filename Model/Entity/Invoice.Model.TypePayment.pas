unit Invoice.Model.TypePayment;

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
  [Table('TypePayment', '')]
  TTypePayment = class
  private
    { Private declarations }
    FidTypePayment: Integer;
    FnameTypePayment: String;
  public 
    { Public declarations }

    [Restrictions([NotNull])]
    [Column('idTypePayment', ftInteger)]
    [Dictionary('idTypePayment', 'Mensagem de validação', '', '', '', taCenter)]
    property idTypePayment: Integer Index 0 read FidTypePayment write FidTypePayment;

    [Restrictions([NotNull])]
    [Column('nameTypePayment', ftString, 50)]
    [Dictionary('nameTypePayment', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property nameTypePayment: String Index 1 read FnameTypePayment write FnameTypePayment;
  end;

implementation

initialization
  TRegisterClass.RegisterEntity(TTypePayment)

end.
