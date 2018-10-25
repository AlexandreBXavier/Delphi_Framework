unit Invoice.Controller.Entity.Factory;

interface

uses Data.DB, Invoice.Controller.Interfaces;

type
     TControllerEntityFactory = class(TInterfacedObject, iModelEntityFactory)
          constructor Create;
          destructor Destroy; Override;
          class function New: iModelEntityFactory;
          function User(Connection: iModelConnection): iEntity;
          function Product(Connection: iModelConnection): iEntity;
          function TypePayment(Connection: iModelConnection): iEntity;
          function Customer(Connection: iModelConnection): iEntity;
     end;

implementation

{ TControllerEntityFactory }

uses Invoice.Model.Entity.User, Invoice.Model.Entity.Customer, Invoice.Model.Entity.Product, Invoice.Model.Entity.TypePayment;

constructor TControllerEntityFactory.Create;
begin
     //
end;

destructor TControllerEntityFactory.Destroy;
begin
     inherited;
end;

class function TControllerEntityFactory.New: iModelEntityFactory;
begin
     Result := Self.Create;
end;

function TControllerEntityFactory.Customer(Connection: iModelConnection): iEntity;
begin
     Result := TModelEntityCustomer.New(Connection);
end;

function TControllerEntityFactory.Product(Connection: iModelConnection): iEntity;
begin
     Result := TModelEntityProduct.New(Connection);
end;

function TControllerEntityFactory.TypePayment(Connection: iModelConnection): iEntity;
begin
     Result := TModelEntityTypePayment.New(Connection);
end;

function TControllerEntityFactory.User(Connection: iModelConnection): iEntity;
begin
     Result := TModelEntityUser.New(Connection);
end;

end.
