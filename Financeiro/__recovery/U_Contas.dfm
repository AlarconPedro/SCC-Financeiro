object Frm_Contas: TFrm_Contas
  AlignWithMargins = True
  Left = 0
  Top = 0
  Margins.Left = 0
  Margins.Top = 0
  Margins.Right = 0
  Margins.Bottom = 0
  Align = alClient
  AutoSize = True
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'Contas'
  ClientHeight = 381
  ClientWidth = 598
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Visible = True
  WindowState = wsMaximized
  PixelsPerInch = 96
  TextHeight = 13
  object DataSource1: TDataSource
    DataSet = DM_Financeiro.Q_Usuario
    Left = 552
    Top = 72
  end
end
