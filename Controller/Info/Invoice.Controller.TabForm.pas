unit Invoice.Controller.TabForm;

interface

uses Invoice.Controller.Interfaces, Vcl.ComCtrls, Vcl.ActnList;

type
     TControllerTabForm = class(TInterfacedObject, iControllerTabForm)
     public
          constructor Create;
          destructor Destroy; Override;
          class function New: iControllerTabForm;
          function CreateTab(aAction: TAction; aPageControl: TPageControl): TTabSheet;
     end;

implementation

{ TControllerTabForm }

constructor TControllerTabForm.Create;
begin
     //
end;

function TControllerTabForm.CreateTab(aAction: TAction; aPageControl: TPageControl): TTabSheet;
var
     aTabSheet: TTabSheet;
     TabName: String;
begin
     aAction.Enabled := False;
     //
     Result:= nil;
     //
     TabName := 'Tab' + aAction.Name;
     //
     aTabSheet := aPageControl.FindComponent(TabName) as TTabSheet;
     //
     if not Assigned(aTabSheet) then
     begin
          aTabSheet := TTabSheet.Create(aPageControl);
          aTabSheet.Name := TabName;
          aTabSheet.Caption := aAction.Caption;
          aTabSheet.PageControl := aPageControl;
          aTabSheet.ImageIndex := 0;
          aTabSheet.Hint := '';
     end;
     //
     aPageControl.ActivePage := aTabSheet;
     //
     Result:= aTabSheet;
     //
     aAction.Enabled := True;
end;

destructor TControllerTabForm.Destroy;
begin
     inherited;
end;

class function TControllerTabForm.New: iControllerTabForm;
begin
     Result := Self.Create;
end;

end.
