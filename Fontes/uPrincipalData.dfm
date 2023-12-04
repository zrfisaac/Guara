object PrincipalData: TPrincipalData
  OldCreateOrder = False
  Left = 200
  Top = 120
  Height = 400
  Width = 600
  object bdeConexao: TDatabase
    DatabaseName = 'bdeConexao'
    LoginPrompt = False
    SessionName = 'Default'
    Left = 24
    Top = 8
  end
  object bdeQuery: TQuery
    AfterOpen = bdeQueryAfterOpen
    DatabaseName = 'bdeConexao'
    Left = 24
    Top = 56
  end
  object bdeData: TDataSource
    DataSet = bdeQuery
    Left = 24
    Top = 104
  end
  object dgSalvar: TSaveDialog
    Left = 168
    Top = 8
  end
  object adoConexao: TADOConnection
    LoginPrompt = False
    Left = 96
    Top = 8
  end
  object adoQuery: TADOQuery
    Parameters = <>
    Left = 96
    Top = 56
  end
  object adoData: TDataSource
    Left = 96
    Top = 104
  end
end
