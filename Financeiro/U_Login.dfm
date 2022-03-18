object F_Login: TF_Login
  Left = 340
  Top = 165
  BorderIcons = []
  BorderStyle = bsNone
  Caption = 'F_Login'
  ClientHeight = 417
  ClientWidth = 693
  Color = clGrayText
  TransparentColor = True
  TransparentColorValue = clGrayText
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Segoe UI'
  Font.Style = [fsBold]
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 17
  object pnl_Fundo: TPanel
    Left = 40
    Top = 0
    Width = 625
    Height = 417
    Align = alCustom
    BevelOuter = bvNone
    Color = clWindow
    ParentBackground = False
    TabOrder = 0
    object Label5: TLabel
      Left = 312
      Top = 24
      Width = 241
      Height = 28
      Alignment = taCenter
      Caption = 'Digite Seu Login e Senha:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -20
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label6: TLabel
      Left = 273
      Top = 148
      Width = 115
      Height = 17
      Caption = 'Nome de Usu'#225'rio :'
    end
    object Label7: TLabel
      Left = 272
      Top = 240
      Width = 45
      Height = 17
      Caption = 'Senha :'
    end
    object sbCancelar: TSpeedButton
      Left = 345
      Top = 359
      Width = 183
      Height = 39
      Caption = 'Cancelar'
      OnClick = sbCancelarClick
    end
    object sbConfirmar: TSpeedButton
      Left = 345
      Top = 306
      Width = 183
      Height = 39
      Caption = 'Confirmar'
      OnClick = sbConfirmarClick
    end
    object Panel1: TPanel
      Left = 0
      Top = 0
      Width = 241
      Height = 417
      Align = alLeft
      BevelOuter = bvNone
      Color = clAppWorkSpace
      ParentBackground = False
      TabOrder = 0
      object Label1: TLabel
        Left = 56
        Top = 24
        Width = 130
        Height = 28
        Alignment = taCenter
        Caption = 'Bem-Vindo(a)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -20
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label2: TLabel
        Left = 32
        Top = 144
        Width = 188
        Height = 21
        Alignment = taCenter
        Caption = 'SCC - Controle de Contas'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label3: TLabel
        Left = 8
        Top = 384
        Width = 218
        Height = 17
        Alignment = taCenter
        Caption = 'SCC - Todos os Direitos Reservados'
        Color = clNone
        ParentColor = False
        WordWrap = True
      end
      object Label4: TLabel
        Left = 80
        Top = 328
        Width = 74
        Height = 17
        Alignment = taCenter
        Caption = 'Vers'#227'o 1.0.0'
        Color = clNone
        ParentColor = False
      end
    end
    object EdUsuario: TEdit
      Left = 272
      Top = 171
      Width = 321
      Height = 25
      Hint = 'Usu'#225'rio'
      TabOrder = 1
      OnKeyPress = EdUsuarioKeyPress
    end
    object EdSenha: TMaskEdit
      Left = 273
      Top = 258
      Width = 320
      Height = 25
      BevelInner = bvNone
      BevelOuter = bvNone
      PasswordChar = '*'
      TabOrder = 2
      Text = ''
      OnKeyPress = EdSenhaKeyPress
    end
  end
end
