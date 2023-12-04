unit uQueryForm;

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
  Buttons,
  ToolWin,
  StdCtrls,
  Grids,
  DB,
  DBGrids,
  uModeloForm,
  Menus;

type
  TQueryForm = class(TModeloForm)
    tsAcao: TToolBar;
    btCarregar: TSpeedButton;
    spSeparador: TSplitter;
    pcRetorno: TPageControl;
    tsGrid: TTabSheet;
    tsMensagem: TTabSheet;
    dbGrid: TDBGrid;
    meMensagem: TMemo;
    btExecutar: TSpeedButton;
    meScript: TMemo;
    pmGrid: TPopupMenu;
    miGridCSV: TMenuItem;
    miGridSQL: TMenuItem;
    btCSV: TSpeedButton;
    btExcel: TSpeedButton;
    btAbrir: TSpeedButton;
    btSalvar: TSpeedButton;
    pnCaminho: TPanel;
    edCaminho: TEdit;
    btSQL: TSpeedButton;
    procedure btCarregarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btExecutarClick(Sender: TObject);
    procedure btCSVClick(Sender: TObject);
    procedure miGridCSVClick(Sender: TObject);
    procedure btSQLClick(Sender: TObject);
    procedure miGridSQLClick(Sender: TObject);
  public
    procedure fnCarregar;
    procedure fnCSV;
    procedure fnExecutar;
    function fnScript: String;
    procedure fnScript_Carregar;
    procedure fnScript_Salvar;
    procedure fnSQL;
    function fnValidaGrid: Boolean;
  end;

var
  QueryForm: TQueryForm;

implementation

uses
  uZRFIFile,
  uGeral,
  uPrincipalData;

{$R *.dfm}

{ TQueryForm }

procedure TQueryForm.fnCarregar;
begin
  try
    PrincipalData.bdeQuery.Close;
    PrincipalData.bdeQuery.SQL.Clear;
    PrincipalData.bdeQuery.SQL := Self.meScript.Lines;
    Self.pcRetorno.Visible := True;
    PrincipalData.bdeQuery.Open;
    Self.tsGrid.TabVisible := True;
    Self.pcRetorno.TabIndex := Self.tsGrid.PageIndex;
    Self.tsMensagem.TabVisible := False;
    Self.spSeparador.Visible := True;
    Self.spSeparador.Top := 1;
    Self.meMensagem.Lines.Clear;
    Self.fnScript_Salvar;
  except
    on e: Exception do
    begin
      Self.meMensagem.Lines.Clear;
      Self.meMensagem.Lines.Add(e.Message);
      Self.pcRetorno.Visible := True;
      Self.tsMensagem.TabVisible := True;
      Self.pcRetorno.TabIndex := Self.tsMensagem.PageIndex;
      Self.tsGrid.TabVisible := True;
      Self.spSeparador.Visible := True;
      Self.spSeparador.Top := 1;
    end;
  end;
end;

procedure TQueryForm.btCarregarClick(Sender: TObject);
begin
  Self.fnCarregar;
end;

procedure TQueryForm.FormCreate(Sender: TObject);
begin
  // # : Tela
  Self.pcRetorno.Visible := False;
  Self.spSeparador.Visible := False;
  Self.fnScript_Carregar;
end;

procedure TQueryForm.fnExecutar;
begin
  try
    PrincipalData.bdeQuery.Close;
    PrincipalData.bdeQuery.SQL.Clear;
    PrincipalData.bdeQuery.SQL := Self.meScript.Lines;
    Self.pcRetorno.Visible := False;
    PrincipalData.bdeQuery.Open;
    Self.spSeparador.Visible := False;
    Self.meMensagem.Lines.Clear;
    Self.fnScript_Salvar;
  except
    on e: Exception do
    begin
      Self.meMensagem.Lines.Clear;
      Self.meMensagem.Lines.Add(e.Message);
      Self.pcRetorno.Visible := True;
      Self.tsMensagem.TabVisible := True;
      Self.pcRetorno.TabIndex := Self.tsMensagem.PageIndex;
      Self.tsGrid.TabVisible := True;
      Self.spSeparador.Visible := True;
      Self.spSeparador.Top := 1;
    end;
  end;
end;

procedure TQueryForm.btExecutarClick(Sender: TObject);
begin
  Self.fnExecutar;
end;

procedure TQueryForm.fnCSV;
var
  _vI0: Integer;
  _vS0: String;
  _vSeparador: String;
begin
  if (Self.fnValidaGrid) then
  begin
    try
      with (PrincipalData) do
      begin
        fnDialogoSalvar_CSV;
        if (dgSalvar.Execute) then
        begin
          vZRFIFile_Path := dgSalvar.FileName;
          bdeQuery.First;
          while not(bdeQuery.Eof) do
          begin
            for _vI0 := 0 to bdeQuery.Fields.Count - 1 do
            begin
              _vSeparador := '';
              if (_vI0 > 0) then
                _vSeparador := ',';
              if (bdeQuery.Fields[_vI0].DataType = ftBlob) then
                fnZRFIFile_AddWord(_vSeparador,'""')
              else if (bdeQuery.Fields[_vI0].DataType = ftDate) then
                fnZRFIFile_AddWord(_vSeparador,FormatDateTime('dd/MM/yyyy',bdeQuery.Fields[_vI0].AsDateTime),'""')
              else if (bdeQuery.Fields[_vI0].DataType = ftDateTime) then
                fnZRFIFile_AddWord(_vSeparador,FormatDateTime('dd/MM/yyyy hh:mm:ss',bdeQuery.Fields[_vI0].AsDateTime),'""')
              else if (bdeQuery.Fields[_vI0].DataType = ftBoolean) then
                if (bdeQuery.Fields[_vI0].AsBoolean) then
                  fnZRFIFile_AddWord(_vSeparador,'"S"')
                else
                  fnZRFIFile_AddWord(_vSeparador,'"N"')
              else
              begin
                _vS0 := bdeQuery.Fields[_vI0].AsString;
                _vS0 := fnReplace(_vS0,'"','''');
                _vS0 := fnReplace(_vS0,#0,'');
                _vS0 := fnReplace(_vS0,#13,'');
                _vS0 := fnReplace(_vS0,#10,'');
                fnZRFIFile_AddWord(_vSeparador,'"',_vS0,'"');
              end;
            end;
            fnZRFIFile_AddLine;
            bdeQuery.Next;
          end;
          bdeQuery.Last;
        end;
      end;
    except
      on e: Exception do
      begin
        Self.meMensagem.Lines.Clear;
        Self.meMensagem.Lines.Add(e.Message);
        Self.pcRetorno.Visible := True;
        Self.tsMensagem.TabVisible := True;
        Self.pcRetorno.TabIndex := Self.tsMensagem.PageIndex;
        Self.spSeparador.Visible := True;
        Self.spSeparador.Top := 1;
      end;
    end;
  end;
end;

procedure TQueryForm.btCSVClick(Sender: TObject);
begin
  Self.fnCSV;
end;

procedure TQueryForm.miGridCSVClick(Sender: TObject);
begin
  Self.fnCSV;
end;

function TQueryForm.fnValidaGrid: Boolean;
var
  _vMensagem: String;
begin
  // # : Variavel
  _vMensagem := '';

  // # : Retorno
  Result := True;

  // # : Valida Grid
  // {
  if (PrincipalData.bdeQuery.IsEmpty) then
  begin
    _vMensagem := (''
      + _vMensagem
      + '* Consulta Vazia!'
      + #13
    );
    Result := False;
  end;
  // }

  // # : Mensagem
  if not(Result) then
    MessageDlg(_vMensagem, mtWarning, [mbOK], 0);
end;

procedure TQueryForm.fnSQL;
var
  _vI0: Integer;
  _vS0: String;
  _vB0: Boolean;
  _vSeparador: String;
begin
  if (Self.fnValidaGrid) then
  begin
    try
      with (PrincipalData) do
      begin
        fnDialogoSalvar_Sql;
        if (dgSalvar.Execute) then
        begin
          vZRFIFile_Path := dgSalvar.FileName;
          bdeQuery.First;
          _vB0 := False;
          while not(bdeQuery.Eof) do
          begin
            if (_vB0) then
              fnZRFIFile_AddWord('UNION ALL SELECT' + ' ')
            else
              fnZRFIFile_AddWord('SELECT' + ' ');
            for _vI0 := 0 to bdeQuery.Fields.Count - 1 do
            begin
              _vSeparador := '';
              if (_vI0 > 0) then
                _vSeparador := ',';
              if (bdeQuery.Fields[_vI0].IsNull) then
                fnZRFIFile_AddWord(_vSeparador,'NULL AS ','[' + bdeQuery.Fields[_vI0].FieldName + ']')
              else if (bdeQuery.Fields[_vI0].DataType = ftBlob) then
                fnZRFIFile_AddWord(_vSeparador,'''''',' AS ','[' + bdeQuery.Fields[_vI0].FieldName + ']')
              else if (bdeQuery.Fields[_vI0].DataType in [ftInteger,ftAutoInc]) then
                  fnZRFIFile_AddWord(_vSeparador,bdeQuery.Fields[_vI0].AsString,' AS ','[' + bdeQuery.Fields[_vI0].FieldName + ']')
              else if (bdeQuery.Fields[_vI0].DataType = ftFloat) then
                  fnZRFIFile_AddWord(_vSeparador,FormatFloat('#0.00', bdeQuery.Fields[_vI0].AsFloat),' AS ','[' + bdeQuery.Fields[_vI0].FieldName + ']')
              else if (bdeQuery.Fields[_vI0].DataType = ftDate) then
                fnZRFIFile_AddWord(_vSeparador,'CONVERT(DATETIME,''' + FormatDateTime('dd/MM/yyyy',bdeQuery.Fields[_vI0].AsDateTime) + ''',103)',' AS ','[' + bdeQuery.Fields[_vI0].FieldName + ']')
              else if (bdeQuery.Fields[_vI0].DataType = ftDateTime) then
                fnZRFIFile_AddWord(_vSeparador,'CONVERT(DATETIME,''' + FormatDateTime('dd/MM/yyyy hh:mm:ss',bdeQuery.Fields[_vI0].AsDateTime) + ''',103)',' AS ','[' + bdeQuery.Fields[_vI0].FieldName + ']')
              else if (bdeQuery.Fields[_vI0].DataType = ftBoolean) then
                if (bdeQuery.Fields[_vI0].AsBoolean) then
                  fnZRFIFile_AddWord(_vSeparador,'''S''',' AS ','[' + bdeQuery.Fields[_vI0].FieldName + ']')
                else
                  fnZRFIFile_AddWord(_vSeparador,'''N''',' AS ','[' + bdeQuery.Fields[_vI0].FieldName + ']')
              else
              begin
                _vS0 := bdeQuery.Fields[_vI0].AsString;
                _vS0 := fnReplace(_vS0,'"','''');
                _vS0 := fnReplace(_vS0,#0,'');
                _vS0 := fnReplace(_vS0,#13,'');
                _vS0 := fnReplace(_vS0,#10,'');
                fnZRFIFile_AddWord(_vSeparador,'''', _vS0,'''',' AS ','[' + bdeQuery.Fields[_vI0].FieldName + ']')
              end;
            end;
            fnZRFIFile_AddLine;
            bdeQuery.Next;
            _vB0 := True;
          end;
          bdeQuery.Last;
        end;
      end;
    except
      on e: Exception do
      begin
        Self.meMensagem.Lines.Clear;
        Self.meMensagem.Lines.Add(e.Message);
        Self.pcRetorno.Visible := True;
        Self.tsMensagem.TabVisible := True;
        Self.pcRetorno.TabIndex := Self.tsMensagem.PageIndex;
        Self.spSeparador.Visible := True;
        Self.spSeparador.Top := 1;
      end;
    end;
  end;
end;

procedure TQueryForm.btSQLClick(Sender: TObject);
begin
  Self.fnSQL;
end;

procedure TQueryForm.miGridSQLClick(Sender: TObject);
begin
  Self.fnSQL;
end;

procedure TQueryForm.fnScript_Carregar;
begin
  if FileExists(Self.fnScript) then
    Self.meScript.Lines.LoadFromFile(Self.fnScript);
end;

procedure TQueryForm.fnScript_Salvar;
begin
  Self.meScript.Lines.SaveToFile(Self.fnScript);
end;

function TQueryForm.fnScript: String;
begin
  Result := ExtractFileDir(ParamStr(0)) + '\Query.sql';
end;

end.
