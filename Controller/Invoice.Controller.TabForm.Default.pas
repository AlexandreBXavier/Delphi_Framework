unit Invoice.Controller.TabForm.Default;

interface

uses Invoice.Controller.Interfaces, Vcl.ComCtrls, Vcl.ActnList, System.Classes, Vcl.Forms;

type
     TControllerTabFormDefault = class(TInterfacedObject, iControllerTabFormDefault)
     public
          constructor Create;
          destructor Destroy; Override;
          class function New: iControllerTabFormDefault;
          function CreateTab(aAction: TAction; aPageControl: TPageControl): TTabSheet;
          procedure ShowForm(aTabSheet: TTabSheet; NameForm: String);
     end;

implementation

uses
  Vcl.Controls;

{ TControllerTabForm }

constructor TControllerTabFormDefault.Create;
begin
     //
end;

function TControllerTabFormDefault.CreateTab(aAction: TAction; aPageControl: TPageControl): TTabSheet;
var
     aTabSheet: TTabSheet;
     TabName: String;
begin
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
end;

procedure TControllerTabFormDefault.ShowForm(aTabSheet: TTabSheet; NameForm: String);
var
     NewForm: TFormClass;
     aForm: TForm;
begin
     if (aTabSheet.Hint = '') and (NameForm <> '') then
     begin
          NewForm := TFormClass(FindClass('T' + NameForm));
          //
          aForm := NewForm.Create(Application);
          aForm.Parent := aTabSheet;
          aForm.BorderStyle := bsNone;
          aForm.Align := alClient;
          aForm.Visible := True;
          //
          aTabSheet.Hint := NameForm;
     end;
end;

destructor TControllerTabFormDefault.Destroy;
begin
     inherited;
end;

class function TControllerTabFormDefault.New: iControllerTabFormDefault;
begin
     Result := Self.Create;
end;

end.
