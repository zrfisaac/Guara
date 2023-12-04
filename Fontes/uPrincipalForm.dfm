object PrincipalForm: TPrincipalForm
  Left = 200
  Top = 120
  Width = 600
  Height = 400
  Caption = 'PrincipalForm'
  Color = clWindow
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = miMenu
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnPrincipal: TPanel
    Left = 0
    Top = 0
    Width = 584
    Height = 322
    Align = alClient
    BevelOuter = bvNone
    Color = clWindow
    TabOrder = 0
  end
  object sbStatus: TStatusBar
    Left = 0
    Top = 322
    Width = 584
    Height = 19
    Panels = <
      item
        Width = 50
      end
      item
        Width = 50
      end>
  end
  object miMenu: TMainMenu
    Left = 8
    Top = 8
    object miFerramenta: TMenuItem
      Caption = 'Ferramentas'
      object miBackup: TMenuItem
        Caption = 'Backup'
        Visible = False
        OnClick = miBackupClick
      end
      object miQuery: TMenuItem
        Caption = 'Query'
        OnClick = miQueryClick
      end
      object miRestaurar: TMenuItem
        Caption = 'Restaurar'
        Visible = False
      end
      object miScript: TMenuItem
        Caption = 'Scripts'
        Visible = False
      end
      object miTabela: TMenuItem
        Caption = 'Tabelas'
        Visible = False
      end
    end
    object miConfig: TMenuItem
      Caption = 'Configura'#231#227'o'
      OnClick = miConfigClick
    end
    object miSobre: TMenuItem
      Caption = 'Sobre'
      OnClick = miSobreClick
    end
  end
  object acAcao: TActionList
    Left = 40
    Top = 8
    object acAbortar: TAction
      Caption = 'acAbortar'
      ShortCut = 27
    end
    object acCarregar: TAction
      Caption = 'acCarregar'
      ShortCut = 116
      OnExecute = acCarregarExecute
    end
    object acExecutar: TAction
      Caption = 'acExecutar'
      ShortCut = 120
      OnExecute = acExecutarExecute
    end
  end
  object XPManifest: TXPManifest
    Left = 8
    Top = 8
  end
end
