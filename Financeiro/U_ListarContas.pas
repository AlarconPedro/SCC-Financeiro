unit U_ListarContas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, dxSkinsCore, dxSkinsDefaultPainters,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, dxRibbonSkins,
  dxRibbonCustomizationForm, dxBar, dxRibbon, cxClasses, dxStatusBar,
  dxRibbonStatusBar, Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.ComCtrls, Vcl.DBCtrls;

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
    btnReceber: TdxBarLargeButton;
    btnEstornar: TdxBarLargeButton;
    btnFiltrarReceber: TdxBarLargeButton;
    btnExcluirReceber: TdxBarLargeButton;
    btnSairReceber: TdxBarLargeButton;
    pnl_Receber: TPanel;
    dbg_Receber: TDBGrid;
    gb_Filtro: TGroupBox;
    pnl_Pagar: TPanel;
    GroupBox1: TGroupBox;
    dbg_Pagar: TDBGrid;
    Label1: TLabel;
    Label2: TLabel;
    Label5: TLabel;
    Label4: TLabel;
    btnRLimpaFiltro: TdxBarLargeButton;
    dataAPagar: TDateTimePicker;
    dataDePagar: TDateTimePicker;
    ds_FiltroReceber: TDataSource;
    ds_FiltroPagar: TDataSource;
    cb_Status: TComboBox;
    ds_CatPagar: TDataSource;
    cb_CatPagar: TDBLookupComboBox;
    Label6: TLabel;
    cb_StatusReceber: TComboBox;
    Label7: TLabel;
    lbDe: TLabel;
    dataDeReceber: TDateTimePicker;
    Label10: TLabel;
    dataAReceber: TDateTimePicker;
    cb_CatReceber: TDBLookupComboBox;
    rg_VencimentoReceber: TRadioGroup;
    rg_VencimentoPagar: TRadioGroup;
    procedure navbarListarContasTabChanging(Sender: TdxCustomRibbon;
      ANewTab: TdxRibbonTab; var Allow: Boolean);
    procedure FormShow(Sender: TObject);
    procedure btnPagarClick(Sender: TObject);
    procedure btnEstornarPagarClick(Sender: TObject);
    procedure btnSairReceberClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure btnSairPagarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnExcluirPagarClick(Sender: TObject);
    procedure btnReceberClick(Sender: TObject);
    procedure btnEstornarClick(Sender: TObject);
    procedure btnFiltrarPagarClick(Sender: TObject);
    procedure ds_FiltroPagarStateChange(Sender: TObject);
    procedure btnFiltrarReceberClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure rg_VencimentoReceberClick(Sender: TObject);
    procedure rg_VencimentoPagarClick(Sender: TObject);
    procedure btnExcluirReceberClick(Sender: TObject);
  private
    procedure OrganizaCampos;
    procedure AtualizaBotao;
    { Private declarations }
  public
    procedure AtualizaValor;
    { Public declarations }
  end;

var
  Frm_ListarContas: TFrm_ListarContas;

implementation

uses U_DM, U_CadastroContas, U_Principal;

{$R *.dfm}

procedure TFrm_ListarContas.btnEstornarPagarClick(Sender: TObject);
begin
if (not DM_Financeiro.Q_CPagarFiltro.IsEmpty) and (DM_Financeiro.Q_CPagarFiltroSTATUS.AsInteger <> 0) then
  begin
    if (Application.MessageBox(PChar('Deseja realmente estornar est? conta ?'), 'SCC', MB_YESNO + mb_DefButton1 + MB_ICONQUESTION + mb_TaskModal) = IDYES) then
      begin
        DM_Financeiro.Q_CPagarFiltro.Edit;
        DM_Financeiro.Q_CPagarFiltroSTATUS.AsInteger := 0;
        DM_Financeiro.Q_CPagarFiltro.Post;
        AtualizaBotao;
        ShowMessage('Conta estornada com sucesso !');
        AtualizaValor;
      end;
  end else
       ShowMessage('N?o existe contas dispon?veis para estorno !');
end;

procedure TFrm_ListarContas.btnExcluirPagarClick(Sender: TObject);
begin
   if (Application.MessageBox(PChar('Deseja realmente excluir est? conta ?'), 'SCC', MB_YESNO + mb_DefButton1 + MB_ICONQUESTION + mb_TaskModal) = IDYES) then
     begin
        DM_Financeiro.Q_CPagarFiltro.Delete;
        AtualizaValor;
     end;

   AtualizaValor;
   AtualizaBotao;
end;

procedure TFrm_ListarContas.btnExcluirReceberClick(Sender: TObject);
begin
  if (Application.MessageBox(PChar('Deseja realmente excluir est? conta ?'), 'SCC', MB_YESNO + mb_DefButton1 + MB_ICONQUESTION + mb_TaskModal) = IDYES) then
    begin
      DM_Financeiro.Q_CReceberFiltro.Delete;
      AtualizaValor;
    end;

   AtualizaValor;
   AtualizaBotao;
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

  if rg_VencimentoPagar.ItemIndex = 1 then
  begin
    DM_Financeiro.Q_CPagarFiltro.SQL.Add('AND VENCIMENTO BETWEEN :de AND :a');
    DM_Financeiro.Q_CPagarFiltro.ParamByName('de').AsDate := dataDePagar.DateTime;
    DM_Financeiro.Q_CPagarFiltro.ParamByName('a').AsDate := dataAPagar.DateTime;
  end;

  DM_Financeiro.Q_CPagarFiltro.Open;
  AtualizaValor;
  AtualizaBotao;

end;

procedure TFrm_ListarContas.btnFiltrarReceberClick(Sender: TObject);
begin
  DM_Financeiro.Q_CReceberFiltro.Close;
  DM_Financeiro.Q_CReceberFiltro.SQL.Clear;
  DM_Financeiro.Q_CReceberFiltro.SQL.Add('SELECT * FROM TB_CRECEBER WHERE USU_CODIGO = :usuario');
  DM_Financeiro.Q_CReceberFiltro.ParamByName('usuario').AsInteger := DM_Financeiro.UsuarioLogado;

  if cb_StatusReceber.ItemIndex > 0 then
  begin
    DM_Financeiro.Q_CReceberFiltro.SQL.Add('AND STATUS = :cod_status');
    DM_Financeiro.Q_CReceberFiltro.ParamByName('cod_status').AsInteger := cb_StatusReceber.ItemIndex - 1;
  end;

  if cb_CatReceber.KeyValue > 0 then
  begin
    DM_Financeiro.Q_CReceberFiltro.SQL.Add('AND CAT_CODIGO = :cod_categoria');
    DM_Financeiro.Q_CReceberFiltro.ParamByName('cod_categoria').AsInteger := DM_Financeiro.Q_CatFiltroCAT_CODIGO.AsInteger;
  end;

  if rg_VencimentoReceber.ItemIndex = 1 then
  begin
    DM_Financeiro.Q_CReceberFiltro.SQL.Add('AND DATA_RECEBER BETWEEN :de AND :a');
    DM_Financeiro.Q_CReceberFiltro.ParamByName('de').AsDate := dataDeReceber.Date;
    DM_Financeiro.Q_CReceberFiltro.ParamByName('a').AsDate := dataAReceber.Date;
  end;

  DM_Financeiro.Q_CReceberFiltro.Open;
  AtualizaValor;
  AtualizaBotao;
end;

procedure TFrm_ListarContas.btnPagarClick(Sender: TObject);
begin
  if (not DM_Financeiro.Q_CPagarFiltro.IsEmpty) and (DM_Financeiro.Q_CPagarFiltroSTATUS.AsInteger <> 1) then
    begin
      DM_Financeiro.Q_CPagarFiltro.Edit;
      DM_Financeiro.Q_CPagarFiltroSTATUS.Value := 1;
      DM_Financeiro.Q_CPagarFiltro.Post;
      AtualizaBotao;
      ShowMessage('Conta paga com Sucesso !');
      AtualizaValor;
    end else
      ShowMessage('N?o existe contas dispon?veis para pagamento !');
end;

procedure TFrm_ListarContas.btnSairPagarClick(Sender: TObject);
begin
  Close;
end;

procedure TFrm_ListarContas.ds_FiltroPagarStateChange(Sender: TObject);
begin
  btnExcluirPagar.Enabled := (DM_Financeiro.Q_CPagarFiltro.State = dsBrowse);
  btnExcluirReceber.Enabled := (DM_Financeiro.Q_CReceberFiltro.State = dsBrowse);
  AtualizaBotao;
end;

procedure TFrm_ListarContas.btnReceberClick(Sender: TObject);
begin
  if (not DM_Financeiro.Q_CReceberFiltro.IsEmpty) and (DM_Financeiro.Q_CReceberFiltroSTATUS.AsInteger <> 1) then
    begin
      DM_Financeiro.Q_CReceberFiltro.Edit;
      DM_Financeiro.Q_CReceberFiltroSTATUS.Value := 1;
      DM_Financeiro.Q_CReceberFiltro.Post;
      AtualizaValor;
      AtualizaBotao;
      ShowMessage('Conta recebida com sucesso !');
    end else
      ShowMessage('N?o existe contas dispon?veis para recebimento !');
end;

procedure TFrm_ListarContas.btnEstornarClick(Sender: TObject);
begin
  if (not DM_Financeiro.Q_CReceberFiltro.IsEmpty) and (DM_Financeiro.Q_CReceberFiltroSTATUS.AsInteger <> 0) then
    begin
      if (Application.MessageBox(PChar('Deseja realmente estornar est? conta ?'), 'SCC', MB_YESNO + mb_DefButton1 + MB_ICONQUESTION + mb_TaskModal) = IDYES) then
        begin
          DM_Financeiro.Q_CReceberFiltro.Edit;
          DM_Financeiro.Q_CReceberFiltroSTATUS.Value := 0;
          DM_Financeiro.Q_CReceberFiltro.Post;
          AtualizaValor;
          AtualizaBotao;
          ShowMessage('Conta estornada com sucesso !');
        end;
    end else
      ShowMessage('N?o existe contas dispon?veis para estorno !');
end;

procedure TFrm_ListarContas.btnSairReceberClick(Sender: TObject);
begin
  Close;
end;

procedure TFrm_ListarContas.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  action := cafree;
//  Frm_Principal.NavBar.Tabs.Items[0].Active := true;
  Frm_Principal.btnListarContas.Enabled := true;
end;

procedure TFrm_ListarContas.FormCreate(Sender: TObject);
begin
  Frm_Principal.btnListarContas.Enabled := false;
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

procedure TFrm_ListarContas.rg_VencimentoPagarClick(Sender: TObject);
begin
  dataDePagar.Enabled := (rg_VencimentoPagar.ItemIndex <> 0);
  dataAPagar.Enabled := (rg_VencimentoPagar.ItemIndex <> 0);
end;

procedure TFrm_ListarContas.rg_VencimentoReceberClick(Sender: TObject);
begin
  dataDeReceber.Enabled := (rg_VencimentoReceber.ItemIndex <> 0);
  dataAReceber.Enabled := (rg_VencimentoReceber.ItemIndex <> 0);  
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

  rg_VencimentoReceber.ItemIndex := 0;
  rg_VencimentoPagar.ItemIndex := 0;

  dataDeReceber.Date := Date;
  dataAReceber.Date := Date;
  dataDePagar.Date := Date;
  dataAPagar.Date := Date;

  DM_Financeiro.Q_Soma.Open;

  WindowState := wsMaximized;
  AtualizaValor;
  AtualizaBotao;


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
   totalBar.Panels.Items[2].Text := 'Total L?quido: R$ ' + FormatCurr('##.###,##',DM_Financeiro.Q_SomaTOTAL.AsCurrency);
  end;

procedure TFrm_ListarContas.AtualizaBotao;
  begin
    if cb_Status.ItemIndex = 0 then
      begin
        btnPagar.Enabled := true;
        btnEstornarPagar.Enabled := true;
      end;

    if cb_Status.ItemIndex = 1 then
      begin
        btnPagar.Enabled := (not DM_Financeiro.Q_CPagarFiltro.IsEmpty);
        btnEstornarPagar.Enabled := false;
      end;

    if cb_Status.ItemIndex = 2 then
      begin
        btnPagar.Enabled := false;
        btnEstornarPagar.Enabled := (not DM_Financeiro.Q_CPagarFiltro.IsEmpty);
      end;

      if cb_StatusReceber.ItemIndex = 0 then
      begin
        btnReceber.Enabled := true;
        btnEstornar.Enabled := true;
      end;

    if cb_StatusReceber.ItemIndex = 1 then
      begin
        btnReceber.Enabled := (not DM_Financeiro.Q_CReceberFiltro.IsEmpty);
        btnEstornar.Enabled := false;
      end;

    if cb_StatusReceber.ItemIndex = 2 then
      begin
        btnReceber.Enabled := false;
        btnEstornar.Enabled := (not DM_Financeiro.Q_CReceberFiltro.IsEmpty);
      end;
  end;
end.
