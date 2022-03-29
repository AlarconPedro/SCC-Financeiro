unit U_ListarContas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, dxSkinsCore, dxSkinsDefaultPainters,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, dxRibbonSkins,
  dxRibbonCustomizationForm, dxBar, dxRibbon, cxClasses, dxStatusBar,
  dxRibbonStatusBar, Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.ComCtrls, JvExComCtrls, JvDateTimePicker;

type
  TFrm_ListarContas = class(TForm)
    barManagerContas: TdxBarManager;
    navContasPagar: TdxRibbonTab;
    navbarListarContas: TdxRibbon;
    itensContas: TdxRibbonPopupMenu;
    navContasReceber: TdxRibbonTab;
    totalBar: TdxRibbonStatusBar;
    barManagerContasBar1: TdxBar;
    dxBarLargeButton1: TdxBarLargeButton;
    btnPagar: TdxBarLargeButton;
    btnEstornarPagar: TdxBarLargeButton;
    dxBarLargeButton4: TdxBarLargeButton;
    dxBarLargeButton5: TdxBarLargeButton;
    dxBarLargeButton6: TdxBarLargeButton;
    barManagerContasBar3: TdxBar;
    barManagerContasBar2: TdxBar;
    btnFiltrarPagar: TdxBarLargeButton;
    btnExcluirPagar: TdxBarLargeButton;
    btnSairPagar: TdxBarLargeButton;
    barManagerContasBar4: TdxBar;
    dxBarLargeButton2: TdxBarLargeButton;
    dxBarLargeButton3: TdxBarLargeButton;
    dxBarLargeButton7: TdxBarLargeButton;
    dxBarLargeButton8: TdxBarLargeButton;
    dxBarLargeButton9: TdxBarLargeButton;
    ds_ContasPagar: TDataSource;
    ds_ContasReceber: TDataSource;
    pnl_Receber: TPanel;
    dbg_Receber: TDBGrid;
    gb_Filtro: TGroupBox;
    pnl_Pagar: TPanel;
    GroupBox1: TGroupBox;
    dbg_Pagar: TDBGrid;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    ComboBox2: TComboBox;
    ComboBox1: TComboBox;
    Label5: TLabel;
    JvDateTimePicker1: TJvDateTimePicker;
    Label4: TLabel;
    JvDateTimePicker2: TJvDateTimePicker;
    procedure navbarListarContasTabChanging(Sender: TdxCustomRibbon;
      ANewTab: TdxRibbonTab; var Allow: Boolean);
    procedure FormShow(Sender: TObject);
    procedure btnPagarClick(Sender: TObject);
    procedure btnEstornarPagarClick(Sender: TObject);
    procedure dxBarLargeButton9Click(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure btnSairPagarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnExcluirPagarClick(Sender: TObject);
    procedure dxBarLargeButton2Click(Sender: TObject);
    procedure dxBarLargeButton3Click(Sender: TObject);
  private
    procedure AtualizaValor;
    procedure OrganizaCampos;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frm_ListarContas: TFrm_ListarContas;

implementation

uses U_DM, U_CadastroContas;

{$R *.dfm}

procedure TFrm_ListarContas.btnEstornarPagarClick(Sender: TObject);
begin
  DM_Financeiro.Q_ContasPagar.Edit;
  DM_Financeiro.Q_ContasPagarSTATUS.Value := 0;
  DM_Financeiro.Q_ContasPagar.Post;
  AtualizaValor;
end;

procedure TFrm_ListarContas.btnExcluirPagarClick(Sender: TObject);
begin
   if (ds_ContasPagar.DataSet.State = dsBrowse) and (not ds_ContasPagar.DataSet.IsEmpty) then
     if (Application.MessageBox(PChar('Deseja realmente excluir est� conta ?'), 'SCC', MB_YESNO + mb_DefButton1 + MB_ICONQUESTION + mb_TaskModal) = IDYES) then
        DM_Financeiro.Q_ContasPagar.Delete;

   AtualizaValor;
end;

procedure TFrm_ListarContas.btnPagarClick(Sender: TObject);
begin
  DM_Financeiro.Q_ContasPagar.Edit;
  DM_Financeiro.Q_ContasPagarSTATUS.Value := 1;
  DM_Financeiro.Q_ContasPagar.Post;
  AtualizaValor;
end;

procedure TFrm_ListarContas.btnSairPagarClick(Sender: TObject);
begin
  Close;
end;

procedure TFrm_ListarContas.dxBarLargeButton2Click(Sender: TObject);
begin
  DM_Financeiro.Q_ContasReceber.Edit;
  DM_Financeiro.Q_ContasReceberSTATUS.Value := 1;
  DM_Financeiro.Q_ContasReceber.Post;
  AtualizaValor;
end;

procedure TFrm_ListarContas.dxBarLargeButton3Click(Sender: TObject);
begin
  DM_Financeiro.Q_ContasReceber.Edit;
  DM_Financeiro.Q_ContasReceberSTATUS.Value := 0;
  DM_Financeiro.Q_ContasReceber.Post;
  AtualizaValor;
end;

procedure TFrm_ListarContas.dxBarLargeButton9Click(Sender: TObject);
begin
  Close;
end;

procedure TFrm_ListarContas.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  action := cafree;
end;

procedure TFrm_ListarContas.FormPaint(Sender: TObject);
begin
  OrganizaCampos;

end;

procedure TFrm_ListarContas.FormResize(Sender: TObject);
begin
  OrganizaCampos;
end;

procedure TFrm_ListarContas.OrganizaCampos;
begin
  dbg_Pagar.Columns[0].Width := (dbg_pagar.Width * 50) div 100;
  dbg_Pagar.Columns[1].Width := (dbg_pagar.Width * 17) div 100;
  dbg_Pagar.Columns[2].Width := (dbg_pagar.Width * 10) div 100;
  dbg_Pagar.Columns[3].Width := (dbg_pagar.Width * 10) div 100;
  dbg_Pagar.Columns[4].Width := (dbg_pagar.Width * 10) div 100;
  dbg_Receber.Columns[0].Width := (dbg_Receber.Width * 50) div 100;
  dbg_Receber.Columns[1].Width := (dbg_Receber.Width * 17) div 100;
  dbg_Receber.Columns[2].Width := (dbg_Receber.Width * 10) div 100;
  dbg_Receber.Columns[3].Width := (dbg_Receber.Width * 10) div 100;
  dbg_Receber.Columns[4].Width := (dbg_Receber.Width * 10) div 100;
  totalBar.Panels.Items[0].Width := (totalBar.Width * 33) div 100;
  totalBar.Panels.Items[1].Width := (totalBar.Width * 33) div 100;
  totalBar.Panels.Items[2].Width := (totalBar.Width * 33) div 100;
end;

procedure TFrm_ListarContas.FormShow(Sender: TObject);
begin
  DM_Financeiro.Q_ContasPagar.Close;
  DM_Financeiro.Q_ContasPagar.Open;
  DM_Financeiro.Q_ContasReceber.Close;
  DM_Financeiro.Q_ContasReceber.Open;
  DM_Financeiro.Q_Soma.Close;
  DM_Financeiro.Q_Soma.ParamByName('pusuario').AsInteger := DM_Financeiro.UsuarioLogado;
  DM_Financeiro.Q_Soma.ParamByName('rusuario').AsInteger := DM_Financeiro.UsuarioLogado;
  DM_Financeiro.Q_Soma.Open;
  WindowState := wsMaximized;
  AtualizaValor;
end;

procedure TFrm_ListarContas.navbarListarContasTabChanging(
  Sender: TdxCustomRibbon; ANewTab: TdxRibbonTab; var Allow: Boolean);
begin
    pnl_Receber.Visible := navContasReceber.Active;
    pnl_Pagar.Visible := navContasPagar.Active;
end;

procedure TFrm_ListarContas.AtualizaValor;
  begin
   totalBar.Panels.Items[0].Text := 'Total a Pagar: R$ ' + FormatCurr('##.###,##',DM_Financeiro.Q_SomaTPAGAR.AsCurrency);
   totalBar.Panels.Items[1].Text := 'Total a Receber: R$ ' + FormatCurr('##.###,##',DM_Financeiro.Q_SomaTRECEBER.AsCurrency);
   totalBar.Panels.Items[2].Text := 'Total L�quido: R$ ' + FormatCurr('##.###,##',DM_Financeiro.Q_SomaTOTAL.AsCurrency);
  end;
end.