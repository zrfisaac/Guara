unit uPrincipalData;

interface

uses
  SysUtils,
  Classes,
  DB,
  DBTables,
  Dialogs,
  ExtDlgs,
  ADODB;

type
  TPrincipalData = class(TDataModule)
    bdeConexao: TDatabase;
    bdeQuery: TQuery;
    bdeData: TDataSource;
    dgSalvar: TSaveDialog;
    adoConexao: TADOConnection;
    adoQuery: TADOQuery;
    adoData: TDataSource;
    procedure bdeQueryAfterOpen(DataSet: TDataSet);
  public
    procedure fnDialogoSalvar_CSV;
    procedure fnDialogoSalvar_SQL;
  end;

var
  PrincipalData: TPrincipalData;

implementation

uses
  uQueryForm;

{$R *.dfm}

{ TPrincipalData }

procedure TPrincipalData.fnDialogoSalvar_CSV;
begin
  Self.dgSalvar.FileName := 'Query_' + FormatDateTime('yyyyMMdd-hhmm-ss',Now) + '.csv';
  Self.dgSalvar.Filter := (''
    + 'CSV (*.csv)|*.csv'
  );
end;

procedure TPrincipalData.fnDialogoSalvar_SQL;
begin
  Self.dgSalvar.FileName := 'Query_' + FormatDateTime('yyyyMMdd-hhmm-ss',Now) + '.mssql.sql';
  Self.dgSalvar.Filter := (''
    + 'SQL Server (*.sql)|*.sql'
  );
end;

procedure TPrincipalData.bdeQueryAfterOpen(DataSet: TDataSet);
begin
  if Assigned(QueryForm) then
  begin
    QueryForm.btCSV.Enabled := not(Self.bdeQuery.IsEmpty) and (QueryForm.pcRetorno.Visible);
    QueryForm.btSQL.Enabled := not(Self.bdeQuery.IsEmpty) and (QueryForm.pcRetorno.Visible);
  end;
end;

end.
