inherited SobreForm: TSobreForm
  BorderStyle = bsDialog
  Caption = 'Sobre'
  ClientHeight = 221
  ClientWidth = 320
  Color = 5452594
  Position = poMainFormCenter
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnPrincipal: TPanel
    Width = 320
    Height = 221
    Color = 5452594
    ParentBiDiMode = False
    ParentCtl3D = False
    ParentFont = False
    ParentShowHint = False
    object lbSiteValor: TLabel
      Left = 88
      Top = 160
      Width = 162
      Height = 19
      Cursor = crHandPoint
      Caption = 'zrfisaac.github.io'
      Color = 5452594
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = 'Consolas'
      Font.Style = [fsBold, fsUnderline]
      ParentColor = False
      ParentFont = False
      OnClick = lbSiteValorClick
    end
    object lbSiteNome: TLabel
      Left = 24
      Top = 160
      Width = 63
      Height = 19
      Caption = 'Site : '
      Color = 5452594
      Font.Charset = ANSI_CHARSET
      Font.Color = 10202894
      Font.Height = -16
      Font.Name = 'Consolas'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object Label1: TLabel
      Left = 56
      Top = 64
      Width = 208
      Height = 34
      Caption = 'Isaac Santana'
      Color = 5452594
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -29
      Font.Name = 'Consolas'
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object lbGithubNome: TLabel
      Left = 24
      Top = 136
      Width = 81
      Height = 19
      Caption = 'GitHub : '
      Color = 5452594
      Font.Charset = ANSI_CHARSET
      Font.Color = 10202894
      Font.Height = -16
      Font.Name = 'Consolas'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object lbGithubValor: TLabel
      Left = 104
      Top = 136
      Width = 171
      Height = 19
      Cursor = crHandPoint
      Caption = 'github.com/zrfisaac'
      Color = 5452594
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = 'Consolas'
      Font.Style = [fsBold, fsUnderline]
      ParentColor = False
      ParentFont = False
      OnClick = lbGithubValorClick
    end
    object Label2: TLabel
      Left = 120
      Top = 16
      Width = 78
      Height = 56
      Caption = '</>'
      Color = 5452594
      Font.Charset = ANSI_CHARSET
      Font.Color = 10202894
      Font.Height = -48
      Font.Name = 'Consolas'
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object Label3: TLabel
      Left = 64
      Top = 96
      Width = 187
      Height = 23
      Caption = 'Software Deveoper'
      Color = 5452594
      Font.Charset = ANSI_CHARSET
      Font.Color = 10202894
      Font.Height = -20
      Font.Name = 'Consolas'
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
  end
end
