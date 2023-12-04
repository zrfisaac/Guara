object BackupData: TBackupData
  OldCreateOrder = False
  Left = 200
  Top = 120
  Height = 400
  Width = 600
  object qryTabela: TQuery
    DatabaseName = 'bdeConexao'
    SQL.Strings = (
      'SELECT TABLE_NAME'
      'FROM INFORMATION_SCHEMA.TABLES WITH(NOLOCK)'
      'WHERE TABLE_TYPE = '#39'BASE TABLE'#39
      'ORDER BY TABLE_NAME')
    Left = 16
    Top = 8
  end
  object qryView: TQuery
    DatabaseName = 'bdeConexao'
    SQL.Strings = (
      'SELECT TABLE_NAME'
      'FROM INFORMATION_SCHEMA.TABLES WITH(NOLOCK)'
      'WHERE TABLE_TYPE = '#39'VIEW'#39
      'ORDER BY TABLE_NAME')
    Left = 80
    Top = 8
  end
  object qryProcedure: TQuery
    DatabaseName = 'bdeConexao'
    SQL.Strings = (
      'SELECT SPECIFIC_NAME'
      'FROM INFORMATION_SCHEMA.ROUTINES WITH(NOLOCK)'
      'WHERE ROUTINE_TYPE = '#39'PROCEDURE'#39
      'ORDER BY SPECIFIC_NAME')
    Left = 144
    Top = 8
  end
end
