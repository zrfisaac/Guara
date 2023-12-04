unit uPrincipalForm;

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
  Menus,
  ComCtrls,
  ExtCtrls,
  ActnList, XPMan;

type
  TPrincipalForm = class(TForm)
    pnPrincipal: TPanel;
    sbStatus: TStatusBar;
    miMenu: TMainMenu;
    miConfig: TMenuItem;
    miQuery: TMenuItem;
    acAcao: TActionList;
    acCarregar: TAction;
    acExecutar: TAction;
    miFerramenta: TMenuItem;
    miBackup: TMenuItem;
    miSobre: TMenuItem;
    miTabela: TMenuItem;
    miRestaurar: TMenuItem;
    acAbortar: TAction;
    miScript: TMenuItem;
    XPManifest: TXPManifest;
    procedure FormCreate(Sender: TObject);
    procedure miQueryClick(Sender: TObject);
    procedure miConfigClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure acCarregarExecute(Sender: TObject);
    procedure acExecutarExecute(Sender: TObject);
    procedure miSobreClick(Sender: TObject);
    procedure miBackupClick(Sender: TObject);
  public
    vMenu: TForm;
    procedure fnPrincipal;
    procedure fnMenu(pClasse: TComponentClass); overload;
    procedure fnMenu(pClasse: TComponentClass; var pVariavel; pSender: TObject = Nil); overload;
  end;

var
  PrincipalForm: TPrincipalForm;

implementation

uses
  uBackupForm,
  uConfigForm,
  uGeral,
  uModeloForm,
  uPrincipalData,
  uQueryForm,
  uSobreForm;

{$R *.dfm}

{ TPrincipalForm }

procedure TPrincipalForm.fnMenu(pClasse: TComponentClass);
var
  vForm: TForm;
begin
  try
    TModeloForm(vForm) := TModeloForm(pClasse.NewInstance);
    vForm.Create(Self);
    vForm.ShowModal;
    vForm.Free;
  except
  end;
end;

procedure TPrincipalForm.fnMenu(pClasse: TComponentClass; var pVariavel; pSender: TObject);
begin
  if (Assigned(Self.vMenu))
  and (Assigned(TForm(pVariavel))) then
    if (Self.vMenu = TForm(pVariavel)) then
      Exit;
  if (Assigned(Self.vMenu)) then
  begin
    if (fnObjetoExiste(Self.vMenu,'pnPrincipal')) then
    begin
      TModeloForm(Self.vMenu).pnPrincipal.Parent := Self.vMenu;
      Self.vMenu := Nil;
    end;
  end;
  if not(Assigned(TForm(pVariavel))) then
  begin
    TForm(pVariavel) := TForm(pClasse.NewInstance);
    TForm(pVariavel).Create(Self);
  end;
  Self.vMenu := TForm(pVariavel);
  if (fnObjetoExiste(Self.vMenu,'pnPrincipal')) then
  begin
    TModeloForm(Self.vMenu).pnPrincipal.Parent := Self.pnPrincipal;
    Self.Caption := Application.Title + ' - ' + Self.vMenu.Caption;
  end
  else
  begin
    try
      Self.vMenu.ShowModal;
      Self.vMenu.Free;
    finally
      Self.vMenu := Nil;
    end;
  end;
end;

procedure TPrincipalForm.FormCreate(Sender: TObject);
begin
  // # : Titulo
  Self.Caption := Application.Title;

  // # : DataModule
  if not(Assigned(PrincipalData)) then
    PrincipalData := TPrincipalData.Create(Application);

  // # : Nome
  if (Self.sbStatus.Panels.Count > 1) then
  begin
    Self.sbStatus.Panels[Self.sbStatus.Panels.Count-1].Alignment := taRightJustify;
    Self.sbStatus.Panels[Self.sbStatus.Panels.Count-1].Text := fnVersao('InternalName');
    if (Self.BorderStyle in [bsSizeable,bsSizeToolWin]) then
      Self.sbStatus.Panels[Self.sbStatus.Panels.Count-1].Text := Self.sbStatus.Panels[Self.sbStatus.Panels.Count-1].Text + '       ';
  end;

  // # : Versao
  if (Self.sbStatus.Panels.Count > 0) then
    Self.sbStatus.Panels[0].Text := fnVersao;
end;

procedure TPrincipalForm.miQueryClick(Sender: TObject);
begin
  // # : Menu - Query
  Self.fnMenu(TQueryForm, QueryForm);
end;

procedure TPrincipalForm.miConfigClick(Sender: TObject);
begin
  // # : Menu - Config
  Self.fnMenu(TConfigForm, ConfigForm);
end;

procedure TPrincipalForm.FormShow(Sender: TObject);
begin
  // # : Menu - Config
  Self.fnMenu(TConfigForm, ConfigForm);

  // # : Principal
  Self.fnPrincipal;
end;

procedure TPrincipalForm.fnPrincipal;
begin
  if (PrincipalData.bdeConexao.Connected) then
    Self.fnMenu(TQueryForm, QueryForm);
end;

procedure TPrincipalForm.acCarregarExecute(Sender: TObject);
begin
  if Assigned(Self.vMenu) then
  begin
    if (Self.vMenu.ClassName = 'TQueryForm') then
    begin
      TQueryForm(Self.vMenu).fnCarregar;
    end
    else if (Self.vMenu.ClassName = 'TBackupForm') then
    begin
      TBackupForm(Self.vMenu).fnCarregar;
    end;
  end;
end;

procedure TPrincipalForm.acExecutarExecute(Sender: TObject);
begin
  if Assigned(Self.vMenu) then
  begin
    if (Self.vMenu.ClassName = 'TQueryForm') then
    begin
      TQueryForm(Self.vMenu).fnExecutar;
    end
    else if (Self.vMenu.ClassName = 'TBackupForm') then
    begin
      TBackupForm(Self.vMenu).fnExecutar;
    end;
  end;
end;

procedure TPrincipalForm.miSobreClick(Sender: TObject);
begin
  // # : Menu - Sobre
  Self.fnMenu(TSobreForm);
end;

procedure TPrincipalForm.miBackupClick(Sender: TObject);
begin
  // # : Menu - Extra - Backup
  Self.fnMenu(TBackupForm, BackupForm);
end;

end.
