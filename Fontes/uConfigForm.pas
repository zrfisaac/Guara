unit uConfigForm;

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
  ExtCtrls,
  uModeloForm,
  ComCtrls,
  StdCtrls,
  Buttons;

type
  TConfigForm = class(TModeloForm)
    pcPagina: TPageControl;
    tsBde: TTabSheet;
    pnBde_Rodape: TPanel;
    sbBde: TScrollBox;
    pnBde_Geral01: TPanel;
    ckBde_Automatico: TCheckBox;
    pnBde_Alias: TPanel;
    lbBde_Alias: TLabel;
    edBde_Alias: TEdit;
    pnBde_Servidor: TPanel;
    lbBde_Servidor: TLabel;
    edBde_Servidor: TEdit;
    pnBde_Usuario: TPanel;
    lbBde_Usuario: TLabel;
    edBde_Usuario: TEdit;
    pnBde_Senha: TPanel;
    lbBde_Senha: TLabel;
    edBde_Senha: TEdit;
    pnBde_Banco: TPanel;
    lbBde_Banco: TLabel;
    edBde_Banco: TEdit;
    pnBde_Rodape03: TPanel;
    pnBde_Rodape01: TPanel;
    pnBde_Rodape02: TPanel;
    btBde_Sair: TBitBtn;
    btBde_Conectar: TBitBtn;
    tsConexao: TTabSheet;
    pcConexao: TPageControl;
    tsAdo: TTabSheet;
    rgConexao: TRadioGroup;
    Panel1: TPanel;
    Panel2: TPanel;
    BitBtn1: TBitBtn;
    Panel3: TPanel;
    BitBtn2: TBitBtn;
    Panel4: TPanel;
    ScrollBox1: TScrollBox;
    Panel5: TPanel;
    CheckBox1: TCheckBox;
    Panel6: TPanel;
    Label1: TLabel;
    Edit1: TEdit;
    Panel7: TPanel;
    Label2: TLabel;
    Edit2: TEdit;
    Panel8: TPanel;
    Label3: TLabel;
    Edit3: TEdit;
    Panel9: TPanel;
    Label4: TLabel;
    Edit4: TEdit;
    Panel10: TPanel;
    Label5: TLabel;
    Edit5: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure btBde_ConectarClick(Sender: TObject);
  public
    procedure BDE_Conectar;
    procedure BDE_Desconectar;
    procedure Config_Carregar;
    procedure Config_Salvar;
  end;

var
  ConfigForm: TConfigForm;

implementation

uses
  uGeral,
  uPrincipalData;

{$R *.dfm}

{ TConfigForm }

procedure TConfigForm.BDE_Conectar;
begin
  try
    if (PrincipalData.bdeConexao.Connected) then
    begin
      PrincipalData.bdeConexao.Close;
      Self.BDE_Desconectar;
    end
    else
    begin
      PrincipalData.bdeConexao.Close;
      PrincipalData.bdeConexao.AliasName := Self.edBde_Alias.Text;
      PrincipalData.bdeConexao.Params.Values['SERVER NAME'] := Self.edBde_Servidor.Text;
      PrincipalData.bdeConexao.Params.Values['USER NAME'] := Self.edBde_Usuario.Text;
      PrincipalData.bdeConexao.Params.Values['PASSWORD'] := Self.edBde_Senha.Text;
      PrincipalData.bdeConexao.Params.Values['DATABASE NAME'] := Self.edBde_Banco.Text;
      PrincipalData.bdeConexao.Open;
      Self.Config_Salvar;
      Self.ckBde_Automatico.Enabled := False;
      Self.btBde_Conectar.Caption := 'Desconectar';
      Self.edBde_Alias.ReadOnly := True;
      Self.edBde_Servidor.ReadOnly := True;
      Self.edBde_Usuario.ReadOnly := True;
      Self.edBde_Senha.ReadOnly := True;
      Self.edBde_Banco.ReadOnly := True;
    end;
  except
    on e: Exception do
    begin
      Self.BDE_Desconectar;
      Application.MessageBox(
         PChar(''
          + 'Ocorreu um erro ao tentar conectar com o banco de dados!'
          + #13#13
          + 'Classe : ' + e.ClassName
          + 'Mensagem : ' + e.Message
        )
        ,PChar(''
          + 'Erro!'
        )
        ,MB_OK + MB_ICONERROR
      );
    end; 
  end;
end;

procedure TConfigForm.BDE_Desconectar;
begin
  Self.ckBde_Automatico.Enabled := True;
  Self.btBde_Conectar.Caption := 'Conectar';
  Self.edBde_Alias.ReadOnly := False;
  Self.edBde_Servidor.ReadOnly := False;
  Self.edBde_Usuario.ReadOnly := False;
  Self.edBde_Senha.ReadOnly := False;
  Self.edBde_Banco.ReadOnly := False;
  PrincipalData.bdeConexao.Close;
end;

procedure TConfigForm.Config_Carregar;
begin
  fnIniR('BDE','Automatico', Self.ckBde_Automatico);
  fnIniR('BDE','Alias', Self.edBde_Alias);
  fnIniR('BDE','Servidor', Self.edBde_Servidor);
  fnIniR('BDE','Usuario', Self.edBde_Usuario);
  fnIniR('BDE','Senha', Self.edBde_Senha);
  fnIniR('BDE','Banco', Self.edBde_Banco);
end;

procedure TConfigForm.Config_Salvar;
begin
  fnIniW('BDE','Automatico', Self.ckBde_Automatico);
  fnIniW('BDE','Alias', Self.edBde_Alias);
  fnIniW('BDE','Servidor', Self.edBde_Servidor);
  fnIniW('BDE','Usuario', Self.edBde_Usuario);
  fnIniW('BDE','Senha', Self.edBde_Senha);
  fnIniW('BDE','Banco', Self.edBde_Banco);
end;

procedure TConfigForm.FormCreate(Sender: TObject);
begin
  // # : Heranca
  inherited;

  // # : Pagina
  Self.pcPagina.TabIndex := 0;

  // # : Config - Carregar
  Self.Config_Carregar;

  // # : BDE - Automatico
  if (Self.ckBde_Automatico.Checked) then
    Self.BDE_Conectar;
end;

procedure TConfigForm.btBde_ConectarClick(Sender: TObject);
begin
  // # : BDE - Conectar
  Self.BDE_Conectar;
end;

end.
