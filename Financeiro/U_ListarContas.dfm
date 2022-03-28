object Frm_ListarContas: TFrm_ListarContas
  AlignWithMargins = True
  Left = 0
  Top = 0
  Margins.Left = 0
  Margins.Top = 0
  Margins.Right = 0
  Margins.Bottom = 0
  AutoSize = True
  Caption = 'Listar Contas'
  ClientHeight = 461
  ClientWidth = 684
  Color = clBtnFace
  Constraints.MaxHeight = 500
  Constraints.MaxWidth = 700
  Constraints.MinHeight = 500
  Constraints.MinWidth = 700
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poScreenCenter
  Visible = True
  PixelsPerInch = 96
  TextHeight = 13
  object navbarListarContas: TdxRibbon
    Left = 0
    Top = 0
    Width = 684
    Height = 125
    BarManager = barManagerContas
    ColorSchemeName = 'UserSkin'
    Contexts = <>
    TabOrder = 0
    TabStop = False
    object navbarListarContasTab1: TdxRibbonTab
      Active = True
      Caption = 'Contas a Pagar'
      Groups = <
        item
        end>
      Index = 0
    end
    object navbarListarContasTab2: TdxRibbonTab
      Caption = 'Contas a Receber'
      Groups = <>
      Index = 1
    end
  end
  object totalBar: TdxRibbonStatusBar
    AlignWithMargins = True
    Left = 0
    Top = 438
    Width = 684
    Height = 23
    Margins.Left = 0
    Margins.Top = 0
    Margins.Right = 0
    Margins.Bottom = 0
    Panels = <
      item
        PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
        BiDiMode = bdLeftToRight
        ParentBiDiMode = False
        Text = 'Total a Pagar: '
        Width = 200
      end
      item
        PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
        BiDiMode = bdLeftToRight
        ParentBiDiMode = False
        Text = 'Total a Receber:'
        Width = 200
      end
      item
        PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
        BiDiMode = bdRightToLeft
        ParentBiDiMode = False
        Text = 'Valor L'#237'quido:'
        Width = 200
      end>
    Ribbon = navbarListarContas
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clDefault
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ShowHint = False
    ParentShowHint = False
    PopupMenu = itensContas
    ExplicitTop = 398
    ExplicitWidth = 644
  end
  object barManagerContas: TdxBarManager
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    Categories.Strings = (
      'Default')
    Categories.ItemsVisibles = (
      2)
    Categories.Visibles = (
      True)
    PopupMenuLinks = <>
    UseSystemFont = True
    Left = 552
    Top = 56
    PixelsPerInch = 96
  end
  object itensContas: TdxRibbonPopupMenu
    BarManager = barManagerContas
    ItemLinks = <>
    Ribbon = navbarListarContas
    UseOwnFont = False
    Left = 632
    Top = 56
    PixelsPerInch = 96
  end
end
