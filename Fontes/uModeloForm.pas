unit uModeloForm;

interface

uses
  Windows,
  Messages,
  SysUtils,
  Variants,
  Classes,
  Graphics,
  Controls,
  Forms,
  Dialogs,
  ExtCtrls;

type
  TModeloForm = class(TForm)
    pnPrincipal: TPanel;
    procedure bt_Click(Sender: TObject);
  end;

var
  ModeloForm: TModeloForm;

implementation

uses
  uPrincipalForm;

{$R *.dfm}

{ TModeloForm }

procedure TModeloForm.bt_Click(Sender: TObject);
begin
  // # : Sair
  if (Self.pnPrincipal.Parent = Self) then
    Self.Close
  else
  begin
    Self.pnPrincipal.Parent := Self;
    if Assigned(PrincipalForm) then
      PrincipalForm.fnPrincipal;
  end;
end;

end.
