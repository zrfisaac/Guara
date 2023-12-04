inherited ConfigForm: TConfigForm
  Caption = 'Configura'#231#227'o'
  Color = clWindow
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnPrincipal: TPanel
    object pcPagina: TPageControl
      Left = 0
      Top = 0
      Width = 584
      Height = 361
      ActivePage = tsConexao
      Align = alClient
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      object tsConexao: TTabSheet
        Caption = 'Conex'#227'o'
        ImageIndex = 1
        object pcConexao: TPageControl
          Left = 0
          Top = 41
          Width = 576
          Height = 292
          ActivePage = tsBde
          Align = alClient
          TabOrder = 0
          object tsAdo: TTabSheet
            Caption = 'ADO'
            TabVisible = False
            object Panel1: TPanel
              Left = 0
              Top = 223
              Width = 568
              Height = 41
              Align = alBottom
              TabOrder = 0
              object Panel2: TPanel
                Left = 472
                Top = 1
                Width = 95
                Height = 39
                Align = alRight
                BevelOuter = bvNone
                TabOrder = 0
                object BitBtn1: TBitBtn
                  Left = 8
                  Top = 8
                  Width = 75
                  Height = 25
                  Caption = 'Sair'
                  TabOrder = 0
                  OnClick = bt_Click
                end
              end
              object Panel3: TPanel
                Left = 1
                Top = 1
                Width = 463
                Height = 39
                Align = alClient
                BevelOuter = bvNone
                TabOrder = 1
                object BitBtn2: TBitBtn
                  Left = 8
                  Top = 8
                  Width = 89
                  Height = 25
                  Caption = 'Conectar'
                  TabOrder = 0
                  OnClick = btBde_ConectarClick
                end
              end
              object Panel4: TPanel
                Left = 464
                Top = 1
                Width = 8
                Height = 39
                Align = alRight
                BevelOuter = bvNone
                Color = clFuchsia
                TabOrder = 2
                Visible = False
              end
            end
            object ScrollBox1: TScrollBox
              Left = 0
              Top = 0
              Width = 568
              Height = 223
              Align = alClient
              Color = clGray
              ParentColor = False
              TabOrder = 1
              object Panel5: TPanel
                Left = 0
                Top = 0
                Width = 547
                Height = 33
                Align = alTop
                TabOrder = 0
                object CheckBox1: TCheckBox
                  Left = 8
                  Top = 8
                  Width = 145
                  Height = 17
                  Caption = 'Conex'#227'o Autom'#225'tica'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                  TabOrder = 0
                end
              end
              object Panel6: TPanel
                Left = 0
                Top = 33
                Width = 547
                Height = 48
                Align = alTop
                TabOrder = 1
                DesignSize = (
                  547
                  48)
                object Label1: TLabel
                  Left = 8
                  Top = 8
                  Width = 28
                  Height = 13
                  Caption = 'Alias'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object Edit1: TEdit
                  Left = 8
                  Top = 24
                  Width = 528
                  Height = 21
                  Anchors = [akLeft, akTop, akRight]
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 0
                  Text = 'MSSQL'
                end
              end
              object Panel7: TPanel
                Left = 0
                Top = 81
                Width = 547
                Height = 48
                Align = alTop
                TabOrder = 2
                DesignSize = (
                  547
                  48)
                object Label2: TLabel
                  Left = 8
                  Top = 8
                  Width = 48
                  Height = 13
                  Caption = 'Servidor'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object Edit2: TEdit
                  Left = 8
                  Top = 24
                  Width = 528
                  Height = 21
                  Anchors = [akLeft, akTop, akRight]
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 0
                  Text = 'localhost'
                end
              end
              object Panel8: TPanel
                Left = 0
                Top = 129
                Width = 547
                Height = 48
                Align = alTop
                TabOrder = 3
                DesignSize = (
                  547
                  48)
                object Label3: TLabel
                  Left = 8
                  Top = 8
                  Width = 44
                  Height = 13
                  Caption = 'Usu'#225'rio'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object Edit3: TEdit
                  Left = 8
                  Top = 24
                  Width = 528
                  Height = 21
                  Anchors = [akLeft, akTop, akRight]
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 0
                  Text = 'sa'
                end
              end
              object Panel9: TPanel
                Left = 0
                Top = 177
                Width = 547
                Height = 48
                Align = alTop
                TabOrder = 4
                DesignSize = (
                  547
                  48)
                object Label4: TLabel
                  Left = 8
                  Top = 8
                  Width = 37
                  Height = 13
                  Caption = 'Senha'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object Edit4: TEdit
                  Left = 8
                  Top = 24
                  Width = 528
                  Height = 21
                  Anchors = [akLeft, akTop, akRight]
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 0
                  Text = '1234'
                end
              end
              object Panel10: TPanel
                Left = 0
                Top = 225
                Width = 547
                Height = 48
                Align = alTop
                TabOrder = 5
                DesignSize = (
                  547
                  48)
                object Label5: TLabel
                  Left = 8
                  Top = 8
                  Width = 37
                  Height = 13
                  Caption = 'Banco'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object Edit5: TEdit
                  Left = 8
                  Top = 24
                  Width = 528
                  Height = 21
                  Anchors = [akLeft, akTop, akRight]
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 0
                  Text = 'master'
                end
              end
            end
          end
          object tsBde: TTabSheet
            Caption = 'BDE'
            ImageIndex = 1
            object pnBde_Rodape: TPanel
              Left = 0
              Top = 223
              Width = 568
              Height = 41
              Align = alBottom
              TabOrder = 0
              object pnBde_Rodape03: TPanel
                Left = 472
                Top = 1
                Width = 95
                Height = 39
                Align = alRight
                BevelOuter = bvNone
                TabOrder = 0
                object btBde_Sair: TBitBtn
                  Left = 8
                  Top = 8
                  Width = 75
                  Height = 25
                  Caption = 'Sair'
                  TabOrder = 0
                  OnClick = bt_Click
                end
              end
              object pnBde_Rodape01: TPanel
                Left = 1
                Top = 1
                Width = 463
                Height = 39
                Align = alClient
                BevelOuter = bvNone
                TabOrder = 1
                object btBde_Conectar: TBitBtn
                  Left = 8
                  Top = 8
                  Width = 89
                  Height = 25
                  Caption = 'Conectar'
                  TabOrder = 0
                  OnClick = btBde_ConectarClick
                end
              end
              object pnBde_Rodape02: TPanel
                Left = 464
                Top = 1
                Width = 8
                Height = 39
                Align = alRight
                BevelOuter = bvNone
                Color = clFuchsia
                TabOrder = 2
                Visible = False
              end
            end
            object sbBde: TScrollBox
              Left = 0
              Top = 0
              Width = 568
              Height = 223
              Align = alClient
              Color = clWindow
              ParentColor = False
              TabOrder = 1
              object pnBde_Geral01: TPanel
                Left = 0
                Top = 0
                Width = 547
                Height = 33
                Align = alTop
                TabOrder = 0
                object ckBde_Automatico: TCheckBox
                  Left = 8
                  Top = 8
                  Width = 145
                  Height = 17
                  Caption = 'Conex'#227'o Autom'#225'tica'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                  TabOrder = 0
                end
              end
              object pnBde_Alias: TPanel
                Left = 0
                Top = 33
                Width = 547
                Height = 48
                Align = alTop
                TabOrder = 1
                DesignSize = (
                  547
                  48)
                object lbBde_Alias: TLabel
                  Left = 8
                  Top = 8
                  Width = 28
                  Height = 13
                  Caption = 'Alias'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object edBde_Alias: TEdit
                  Left = 8
                  Top = 24
                  Width = 528
                  Height = 21
                  Anchors = [akLeft, akTop, akRight]
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 0
                  Text = 'MSSQL'
                end
              end
              object pnBde_Servidor: TPanel
                Left = 0
                Top = 81
                Width = 547
                Height = 48
                Align = alTop
                TabOrder = 2
                DesignSize = (
                  547
                  48)
                object lbBde_Servidor: TLabel
                  Left = 8
                  Top = 8
                  Width = 48
                  Height = 13
                  Caption = 'Servidor'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object edBde_Servidor: TEdit
                  Left = 8
                  Top = 24
                  Width = 528
                  Height = 21
                  Anchors = [akLeft, akTop, akRight]
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 0
                  Text = 'localhost'
                end
              end
              object pnBde_Usuario: TPanel
                Left = 0
                Top = 129
                Width = 547
                Height = 48
                Align = alTop
                TabOrder = 3
                DesignSize = (
                  547
                  48)
                object lbBde_Usuario: TLabel
                  Left = 8
                  Top = 8
                  Width = 44
                  Height = 13
                  Caption = 'Usu'#225'rio'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object edBde_Usuario: TEdit
                  Left = 8
                  Top = 24
                  Width = 528
                  Height = 21
                  Anchors = [akLeft, akTop, akRight]
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 0
                  Text = 'sa'
                end
              end
              object pnBde_Senha: TPanel
                Left = 0
                Top = 177
                Width = 547
                Height = 48
                Align = alTop
                TabOrder = 4
                DesignSize = (
                  547
                  48)
                object lbBde_Senha: TLabel
                  Left = 8
                  Top = 8
                  Width = 37
                  Height = 13
                  Caption = 'Senha'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object edBde_Senha: TEdit
                  Left = 8
                  Top = 24
                  Width = 528
                  Height = 21
                  Anchors = [akLeft, akTop, akRight]
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 0
                  Text = '1234'
                end
              end
              object pnBde_Banco: TPanel
                Left = 0
                Top = 225
                Width = 547
                Height = 48
                Align = alTop
                TabOrder = 5
                DesignSize = (
                  547
                  48)
                object lbBde_Banco: TLabel
                  Left = 8
                  Top = 8
                  Width = 37
                  Height = 13
                  Caption = 'Banco'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object edBde_Banco: TEdit
                  Left = 8
                  Top = 24
                  Width = 528
                  Height = 21
                  Anchors = [akLeft, akTop, akRight]
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 0
                  Text = 'master'
                end
              end
            end
          end
        end
        object rgConexao: TRadioGroup
          Left = 0
          Top = 0
          Width = 576
          Height = 41
          Align = alTop
          Columns = 2
          ItemIndex = 0
          Items.Strings = (
            'ADO'
            'BDE')
          TabOrder = 1
          Visible = False
        end
      end
    end
  end
end
