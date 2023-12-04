unit uBackupData;

interface

uses
  SysUtils,
  Classes, DB, DBTables;

type
  TBackupData = class(TDataModule)
    qryTabela: TQuery;
    qryView: TQuery;
    qryProcedure: TQuery;
  end;

var
  BackupData: TBackupData;

implementation

uses
  uPrincipalData;

{$R *.dfm}

end.
