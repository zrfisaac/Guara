program Guara;

uses
  Forms,
  uPrincipalForm in 'Fontes\uPrincipalForm.pas' {PrincipalForm},
  uModeloForm in 'Fontes\uModeloForm.pas' {ModeloForm},
  uGeral in 'Fontes\uGeral.pas',
  uConfigForm in 'Fontes\uConfigForm.pas' {ConfigForm},
  uPrincipalData in 'Fontes\uPrincipalData.pas' {PrincipalData: TDataModule},
  uQueryForm in 'Fontes\uQueryForm.pas' {QueryForm},
  uSobreForm in 'Fontes\uSobreForm.pas' {SobreForm},
  uBackupForm in 'Fontes\uBackupForm.pas' {BackupForm},
  uBackupData in 'Fontes\uBackupData.pas' {BackupData: TDataModule},
  uZRFIFile in 'Bibliotecas\ZRFI-Pascal\uZRFIFile.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Guará';
  Application.CreateForm(TPrincipalForm, PrincipalForm);
  Application.Run;
end.
