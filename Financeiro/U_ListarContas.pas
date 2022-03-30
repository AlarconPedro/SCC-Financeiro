unit U_ListarContas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, dxSkinsCore, dxSkinsDefaultPainters,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, dxRibbonSkins,
  dxRibbonCustomizationForm, dxBar, dxRibbon, cxClasses, dxStatusBar,
  dxRibbonStatusBar, Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.ComCtrls, JvExComCtrls, JvDateTimePicker, Vcl.DBCtrls;

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
    btnFiltrarReceber: TdxBarLargeButton;
    dxBarLargeButton8: TdxBarLargeButton;
    dxBarLargeButton9: TdxBarLargeButton;
    pnl_Receber: TPanel;
    dbg_Receber: TDBGrid;
    gb_Filtro: TGroupBox;
    pnl_Pagar: TPanel;
    GroupBox1: TGroupBox;
    dbg_Pagar: TDBGrid;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    Label4: TLabel;
    btnRLimpaFiltro: TdxBarLargeButton;
    DateTimePicker2: TDateTimePicker;
    DateTimePicker1: TDateTimePicker;
    ds_FiltroReceber: TDataSource;
    ds_FiltroPagar: TDataSource;
    cb_Status: TComboBox;
    ds_CatPagar: TDataSource;
    cb_CatPagar: TDBLookupComboBox;
    Label6: TLabel;
    ComboBox1: TComboBox;
    Label7: TLabel;
    DBLookupComboBox2: TDBLookupComboBox;
    Label8: TLabel;
    Label9: TLabel;
    DateTimePicker3: TDateTimePicker;
    Label10: TLabel;
    DateTimePicker4: TDateTimePicker;
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
    procedure btnFiltrarPagarClick(Sender: TObject);
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
  DM_Financeiro.Q_CPagarFiltro.Edit;
  DM_Financeiro.Q_CPagarFiltroSTATUS.AsInteger := 0;
  DM_Financeiro.Q_CPagarFiltro.Post;
  AtualizaValor;
end;

procedure TFrm_ListarContas.btnExcluirPagarClick(Sender: TObject);
begin
   if (ds_FiltroPagar.DataSet.State = dsBrowse) and (not ds_FiltroPagar.DataSet.IsEmpty) then
     if (Application.MessageBox(PChar('Deseja realmente excluir est� conta ?'), 'SCC', MB_YESNO + mb_DefButton1 + MB_ICONQUESTION + mb_TaskModal) = IDYES) then
        DM_Financeiro.Q_ContasPagar.Delete;

   AtualizaValor;
end;

procedure TFrm_ListarContas.btnFiltrarPagarClick(Sender: TObject);
begin

  DM_Financeiro.Q_CPagarFiltro.Close;
  DM_Financeiro.Q_CPagarFiltro.SQL.Clear;
  DM_Financeiro.Q_CPagarFiltro.SQL.Add('SELECT * FROM TB_CPAGAR WHERE USU_CODIGO = :usuario');
  DM_Financeiro.Q_CPagarFiltro.ParamByName('usuario').AsInteger := DM_Financeiro.UsuarioLogado;

  if cb_Status.ItemIndex > 0 then
  begin
    DM_Financeiro.Q_CPagarFiltro.SQL.Add('AND STATUS = :cod_status');
    DM_Financeiro.Q_CPagarFiltro.ParamByName('cod_status').AsInteger := cb_Status.ItemIndex - 1;
  end;

  if cb_CatPagar.KeyValue > 0 then
  begin
    DM_Financeiro.Q_CPagarFiltro.SQL.Add('AND CAT_CODIGO = :cod_categoria');
    DM_Financeiro.Q_CPagarFiltro.ParamByName('cod_categoria').AsInteger := DM_Financeiro.Q_CatFiltroCAT_CODIGO.AsInteger;
  end;

  DM_Financeiro.Q_CPagarFiltro.Open;

end;

procedure TFrm_ListarContas.btnPagarClick(Sender: TObject);
begin
  DM_Financeiro.Q_CPagarFiltro.Edit;
  DM_Financeiro.Q_CPagarFiltroSTATUS.Value := 1;
  DM_Financeiro.Q_CPagarFiltro.Post;
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
  DM_Financeiro.Q_CatFiltro.Close;
  DM_Financeiro.Q_CatFiltro.Open;
  DM_Financeiro.Q_CatFiltro.FetchAll;
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
