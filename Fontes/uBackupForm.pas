unit uBackupForm;

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
  ComCtrls,
  StdCtrls,
  Buttons,
  ToolWin,
  CheckLst,
  Menus,
  uModeloForm;

type
  TBackupForm = class(TModeloForm)
    pbStatus: TProgressBar;
    tsAcao: TToolBar;
    btExecutar: TSpeedButton;
    pnCaminho: TPanel;
    edCaminho: TEdit;
    pcLista: TPageControl;
    tsTabela: TTabSheet;
    clkTabela: TCheckListBox;
    tbTabela: TToolBar;
    btTabelaDesmarcar: TSpeedButton;
    tsLigacao: TTabSheet;
    btAbrir: TSpeedButton;
    btCarregar: TSpeedButton;
    btTabelaInverter: TSpeedButton;
    btTabelaMarcar: TSpeedButton;
    btMarcar: TSpeedButton;
    btInverter: TSpeedButton;
    btDesmarcar: TSpeedButton;
    tsView: TTabSheet;
    tsTrigger: TTabSheet;
    tsFuncao: TTabSheet;
    tsProcedure: TTabSheet;
    ToolBar1: TToolBar;
    SpeedButton1: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    clkLigacao: TCheckListBox;
    ToolBar2: TToolBar;
    SpeedButton5: TSpeedButton;
    SpeedButton6: TSpeedButton;
    SpeedButton7: TSpeedButton;
    clkView: TCheckListBox;
    ToolBar3: TToolBar;
    SpeedButton8: TSpeedButton;
    SpeedButton9: TSpeedButton;
    SpeedButton10: TSpeedButton;
    clkTrigger: TCheckListBox;
    ToolBar4: TToolBar;
    SpeedButton11: TSpeedButton;
    SpeedButton12: TSpeedButton;
    SpeedButton13: TSpeedButton;
    clkFuncao: TCheckListBox;
    ToolBar5: TToolBar;
    SpeedButton14: TSpeedButton;
    SpeedButton15: TSpeedButton;
    SpeedButton16: TSpeedButton;
    clkProcedure: TCheckListBox;
    meMensagem: TMemo;
    spLista: TSplitter;
    pmTabela: TPopupMenu;
    tsDado: TTabSheet;
    ToolBar6: TToolBar;
    SpeedButton17: TSpeedButton;
    SpeedButton18: TSpeedButton;
    SpeedButton19: TSpeedButton;
    clkDado: TCheckListBox;
    pmTabelaDesmarcar: TMenuItem;
    pmTabelaInverter: TMenuItem;
    pmTabelaMarcar: TMenuItem;
    pmLigacao: TPopupMenu;
    pmLigacaoMarcar: TMenuItem;
    pmLigacaoInverter: TMenuItem;
    pmLigacaoDesmarcar: TMenuItem;
    pmView: TPopupMenu;
    MenuItem4: TMenuItem;
    MenuItem5: TMenuItem;
    MenuItem6: TMenuItem;
    pmTrigger: TPopupMenu;
    MenuItem7: TMenuItem;
    MenuItem8: TMenuItem;
    MenuItem9: TMenuItem;
    pmFuncao: TPopupMenu;
    MenuItem10: TMenuItem;
    MenuItem11: TMenuItem;
    MenuItem12: TMenuItem;
    pmProcedure: TPopupMenu;
    MenuItem13: TMenuItem;
    MenuItem14: TMenuItem;
    MenuItem15: TMenuItem;
    pmDado: TPopupMenu;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    btAbortar: TSpeedButton;
    rbCSV: TRadioButton;
    rbSQL: TRadioButton;
    procedure btCarregarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btMarcarClick(Sender: TObject);
    procedure pm_MarcarClick(Sender: TObject);
    procedure btInverterClick(Sender: TObject);
    procedure btDesmarcarClick(Sender: TObject);
    procedure btExecutarClick(Sender: TObject);
  public
    procedure fnCarregar;
    procedure fnDesmarcar(_pLista: TCheckListBox);
    procedure fnExecutar;
    procedure fnInverter(_pLista: TCheckListBox);
    procedure fnMarcar(_pLista: TCheckListBox);
  end;

var
  BackupForm: TBackupForm;

implementation

uses
  uBackupData;

{$R *.dfm}

{ TBackupForm }

procedure TBackupForm.fnCarregar;
begin
  try
    // # : Query - Tabela / Dados
    with (BackupData) do
    begin
      Self.clkTabela.Items.Clear;
      qryTabela.Close;
      qryTabela.Open;
      qryTabela.First;
      while not(qryTabela.Eof) do
      begin
        Self.clkTabela.Items.Add(qryTabela.Fields[0].AsString);
        Self.clkDado.Items.Add(qryTabela.Fields[0].AsString);
        qryTabela.Next;
      end;
      qryTabela.Close;
    end;

    // # : Query - View
    with (BackupData) do
    begin
      Self.clkView.Items.Clear;
      qryView.Close;
      qryView.Open;
      qryView.First;
      while not(qryView.Eof) do
      begin
        Self.clkView.Items.Add(qryView.Fields[0].AsString);
        qryView.Next;
      end;
      qryView.Close;
    end;

    // # : Query - Procedure
    with (BackupData) do
    begin
      Self.clkProcedure.Items.Clear;
      qryProcedure.Close;
      qryProcedure.Open;
      qryProcedure.First;
      while not(qryProcedure.Eof) do
      begin
        Self.clkProcedure.Items.Add(qryProcedure.Fields[0].AsString);
        qryProcedure.Next;
      end;
      qryProcedure.Close;
    end;
  except
    on e: Exception do
    begin
      Self.meMensagem.Lines.Clear;
      Self.meMensagem.Lines.Add('# [ Classe ]');
      Self.meMensagem.Lines.Add(e.ClassName);
      Self.meMensagem.Lines.Add('');
      Self.meMensagem.Lines.Add('# [ Mensagem ]');
      Self.meMensagem.Lines.Add(e.Message);
    end;
  end;
end;

procedure TBackupForm.btCarregarClick(Sender: TObject);
begin
  Self.fnCarregar;
end;

procedure TBackupForm.FormCreate(Sender: TObject);
begin
  // # : DataModule
  if not(Assigned(BackupData)) then
    BackupData := TBackupData.Create(Application);
end;

procedure TBackupForm.fnDesmarcar(_pLista: TCheckListBox);
var
  _vI0: Integer;
begin
  if (Assigned(_pLista)) then
    if (_pLista is TCheckListBox) then
      for _vI0 := 0 to _pLista.Items.Count - 1 do
        _pLista.Checked[_vI0] := False;
end;

procedure TBackupForm.fnInverter(_pLista: TCheckListBox);
var
  _vI0: Integer;
begin
  if (Assigned(_pLista)) then
    if (_pLista is TCheckListBox) then
      for _vI0 := 0 to _pLista.Items.Count - 1 do
        _pLista.Checked[_vI0] := not(_pLista.Checked[_vI0]);
end;

procedure TBackupForm.fnMarcar(_pLista: TCheckListBox);
var
  _vI0: Integer;
begin
  if (Assigned(_pLista)) then
    if (_pLista is TCheckListBox) then
      for _vI0 := 0 to _pLista.Items.Count - 1 do
        _pLista.Checked[_vI0] := True;
end;

procedure TBackupForm.btMarcarClick(Sender: TObject);
begin
  Self.fnMarcar(Self.clkTabela);
  Self.fnMarcar(Self.clkLigacao);
  Self.fnMarcar(Self.clkView);
  Self.fnMarcar(Self.clkTrigger);
  Self.fnMarcar(Self.clkFuncao);
  Self.fnMarcar(Self.clkProcedure);
  Self.fnMarcar(Self.clkDado);
end;

procedure TBackupForm.pm_MarcarClick(Sender: TObject);
begin
  if (Assigned(Sender)) then
  begin
    if (Sender is TMenuItem) then
    begin
      if (TMenuItem(Sender).Name = 'pmTabelaMarcar') then
        Self.fnMarcar(Self.clkTabela);
    end;
  end;
end;

procedure TBackupForm.btInverterClick(Sender: TObject);
begin
  Self.fnInverter(Self.clkTabela);
  Self.fnInverter(Self.clkLigacao);
  Self.fnInverter(Self.clkView);
  Self.fnInverter(Self.clkTrigger);
  Self.fnInverter(Self.clkFuncao);
  Self.fnInverter(Self.clkProcedure);
  Self.fnInverter(Self.clkDado);
end;

procedure TBackupForm.btDesmarcarClick(Sender: TObject);
begin
  Self.fnDesmarcar(Self.clkTabela);
  Self.fnDesmarcar(Self.clkLigacao);
  Self.fnDesmarcar(Self.clkView);
  Self.fnDesmarcar(Self.clkTrigger);
  Self.fnDesmarcar(Self.clkFuncao);
  Self.fnDesmarcar(Self.clkProcedure);
  Self.fnDesmarcar(Self.clkDado);
end;

procedure TBackupForm.fnExecutar;
begin

end;

procedure TBackupForm.btExecutarClick(Sender: TObject);
begin
  Self.fnExecutar;
end;

end.
