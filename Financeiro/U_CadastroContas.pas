unit U_CadastroContas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, dxRibbonSkins, dxSkinsCore, dxSkinsDefaultPainters,
  dxRibbonCustomizationForm, dxBar, cxClasses, dxRibbon, dxStatusBar,
  dxRibbonStatusBar, Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls, Vcl.DBCtrls,
  Vcl.StdCtrls, Vcl.Mask;

type
  TFrm_CadastroContas = class(TForm)
    navContasCadastro: TdxBarManager;
    navContasBar1: TdxBar;
    navContasBar2: TdxBar;
    navContasBar3: TdxBar;
    btnCPagarCad: TdxBarLargeButton;
    btnCReceberCad: TdxBarLargeButton;
    btnEditContas: TdxBarLargeButton;
    btnSairContas: TdxBarLargeButton;
    btnDeleteContas: TdxBarLargeButton;
    btnCancelarContas: TdxBarLargeButton;
    btnSalvarContas: TdxBarLargeButton;
    navContasBar: TdxRibbon;
    NavBarContas: TdxRibbonTab;
    navItens: TdxRibbonPopupMenu;
    pnlContasPagar: TPanel;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    edtDescricaoPagar: TDBEdit;
    edtVencimentoPagar: TDBEdit;
    Label3: TLabel;
    edtValorPagar: TDBEdit;
    Label4: TLabel;
    edtParcelasPagar: TDBEdit;
    gridContasPagar: TDBGrid;
    ds_ContasPagar: TDataSource;
    ds_Categorias: TDataSource;
    edtCatPagar: TDBLookupComboBox;
    Label2: TLabel;
    rg_FPagamentoPagar: TDBRadioGroup;
    pnlContasReceber: TPanel;
    GroupBox2: TGroupBox;
    lbDescricaoReceber: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    edtDescricaoReceber: TDBEdit;
    edtVencimentoReceber: TDBEdit;
    edtValorReceber: TDBEdit;
    edtParcelasReceber: TDBEdit;
    edtCatReceber: TDBLookupComboBox;
    rg_FPagReceber: TDBRadioGroup;
    dgContasReceber: TDBGrid;
    ds_ContasReceber: TDataSource;
    totalBar: TdxRibbonStatusBar;
    btnNovaConta: TdxBarLargeButton;
    procedure btnSairContasClick(Sender: TObject);
    procedure btnSalvarContasClick(Sender: TObject);
    procedure btnCancelarContasClick(Sender: TObject);
    procedure btnEditContasClick(Sender: TObject);
    procedure btnDeleteContasClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure rg_FPagamentoPagarChange(Sender: TObject);
    procedure ds_ContasPagarStateChange(Sender: TObject);
    procedure btnCReceberCadClick(Sender: TObject);
    procedure ds_ContasReceberStateChange(Sender: TObject);
    procedure btnCPagarCadClick(Sender: TObject);
    procedure btnNovaContaClick(Sender: TObject);
  private
    procedure AtualizaValor;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frm_CadastroContas: TFrm_CadastroContas;

implementation

uses U_DM, U_Principal;

{$R *.dfm}

procedure TFrm_CadastroContas.btnCancelarContasClick(Sender: TObject);
begin
 DM_Financeiro.Q_ContasPagar.Cancel;
 DM_Financeiro.Q_ContasReceber.Cancel;
end;

procedure TFrm_CadastroContas.btnCPagarCadClick(Sender: TObject);
begin
 pnlContasReceber.Visible := false;
 pnlContasPagar.Visible := true;
end;

procedure TFrm_CadastroContas.btnCReceberCadClick(Sender: TObject);
begin
 pnlContasPagar.Visible := false;
 pnlContasReceber.Visible := true;
end;

procedure TFrm_CadastroContas.btnDeleteContasClick(Sender: TObject);
begin
  if pnlContasPagar.Visible then
   if (ds_ContasPagar.DataSet.State = dsBrowse) and (not ds_ContasPagar.DataSet.IsEmpty) then
     if (Application.MessageBox(PChar('Deseja realmente excluir est� conta ?'), 'SCC', MB_YESNO + mb_DefButton1 + MB_ICONQUESTION + mb_TaskModal) = IDYES) then
        DM_Financeiro.Q_ContasPagar.Delete;

  if pnlContasReceber.Visible then
   if (ds_ContasReceber.DataSet.State = dsBrowse) and (not ds_ContasReceber.DataSet.IsEmpty) then
    if (Application.MessageBox(PChar('Deseja realmente excluir est� conta ?'), 'SCC', MB_YESNO + mb_DefButton1 + MB_ICONQUESTION + mb_TaskModal) = IDYES) then
      DM_Financeiro.Q_ContasReceber.Delete;

  AtualizaValor;
end;

procedure TFrm_CadastroContas.btnEditContasClick(Sender: TObject);
begin
  if pnlContasPagar.Visible then
   if (ds_ContasPagar.DataSet.State = dsBrowse) and (not ds_ContasPagar.DataSet.IsEmpty) then
      DM_Financeiro.Q_ContasPagar.Edit;

  if pnlContasReceber.Visible then
   if (ds_ContasReceber.DataSet.State = dsBrowse) and (not ds_ContasReceber.DataSet.IsEmpty) then
      DM_Financeiro.Q_ContasReceber.Edit;
end;

procedure TFrm_CadastroContas.btnSairContasClick(Sender: TObject);
begin
  Close;
end;

procedure TFrm_CadastroContas.btnSalvarContasClick(Sender: TObject);
begin
  if (edtDescricaoPagar.EditText.IsEmpty) then
  begin
    ShowMessage('� Necess�rio adicionar uma descri��o para a conta !');
    Abort
  end;

  if (edtVencimentoPagar.EditText.IsEmpty) then
  begin
    ShowMessage('� Necess�rio adicionar uma data de vencimento para a conta !');
    Abort
  end;

  if (edtValorPagar.EditText.IsEmpty) then
  begin
    ShowMessage('� Necess�rio adicionar um valor para a conta !');
    Abort
  end;


 if pnlContasPagar.Visible then
   if ds_ContasPagar.DataSet.State <> dsBrowse then
      DM_Financeiro.Q_ContasPagar.Post;

 if pnlContasReceber.Visible then
   if ds_ContasReceber.DataSet.State <> dsBrowse then
      DM_Financeiro.Q_ContasReceber.Post;

 AtualizaValor;
end;

procedure TFrm_CadastroContas.ds_ContasPagarStateChange(Sender: TObject);
begin
 with ds_ContasPagar.DataSet do
   begin
    btnCPagarCad.Enabled := (State = dsBrowse);
    btnNovaConta.Enabled := (State = dsBrowse);
    btnEditContas.Enabled := (State = dsBrowse) and (not IsEmpty);
    btnDeleteContas.Enabled := (State = dsBrowse) and (not IsEmpty);
    btnSalvarContas.Enabled := (State <> dsBrowse);
    btnCancelarContas.Enabled := (State <> dsBrowse);
    btnCReceberCad.Enabled := (State = dsBrowse);
    edtDescricaoPagar.Enabled := (State <> dsBrowse);
    edtVencimentoPagar.Enabled := (State <> dsBrowse);
    edtValorPagar.Enabled := (State <> dsBrowse);
    edtCatPagar.Enabled := (State <> dsBrowse);
    rg_FPagamentoPagar.Enabled := (State <> dsBrowse);
   end;
end;

procedure TFrm_CadastroContas.ds_ContasReceberStateChange(Sender:  TObject);
begin
 with ds_ContasReceber.DataSet do
   begin
    btnCReceberCad.Enabled := (State = dsBrowse);
    btnNovaConta.Enabled := (State = dsBrowse);
    btnEditContas.Enabled := (State = dsBrowse) and (not IsEmpty);
    btnDeleteContas.Enabled := (State = dsBrowse) and (not IsEmpty);
    btnSalvarContas.Enabled := (State <> dsBrowse);
    btnCancelarContas.Enabled := (State <> dsBrowse);
    btnCPagarCad.Enabled := (State = dsBrowse);
    edtDescricaoReceber.Enabled := (State <> dsBrowse);
    edtVencimentoReceber.Enabled := (State <> dsBrowse);
    edtValorReceber.Enabled := (State <> dsBrowse);
    edtCatReceber.Enabled := (State <> dsBrowse);
    rg_FPagReceber.Enabled := (State <> dsBrowse);
   end;
end;

procedure TFrm_CadastroContas.btnNovaContaClick(Sender: TObject);
begin
  if pnlContasReceber.Visible then
    DM_Financeiro.Q_ContasReceber.Append;

  if pnlContasPagar.Visible then
     DM_Financeiro.Q_ContasPagar.Append;
end;

procedure TFrm_CadastroContas.FormShow(Sender: TObject);
begin
 DM_Financeiro.Q_ContasPagar.Close;
 DM_Financeiro.Q_ContasPagar.Open;
 DM_Financeiro.Q_ContasReceber.Close;
 DM_Financeiro.Q_ContasReceber.Open;
 DM_Financeiro.Q_Categorias.Close;
 DM_Financeiro.Q_Categorias.Open;
 DM_Financeiro.Q_Categorias.FetchAll;
 DM_Financeiro.Q_Soma.Close;
 DM_Financeiro.Q_Soma.ParamByName('pusuario').AsInteger := DM_Financeiro.UsuarioLogado;
 DM_Financeiro.Q_Soma.ParamByName('rusuario').AsInteger := DM_Financeiro.UsuarioLogado;
 DM_Financeiro.Q_Soma.Open;
 AtualizaValor;
end;

procedure TFrm_CadastroContas.rg_FPagamentoPagarChange(Sender: TObject);
begin
  edtParcelasPagar.Enabled := (rg_FPagamentoPagar.Value = '1');
end;

procedure TFrm_CadastroContas.AtualizaValor;
begin
 totalBar.Panels.Items[0].Text := 'Total a Pagar: R$ ' + FormatCurr('##.###,##',DM_Financeiro.Q_SomaTPAGAR.AsCurrency);
 totalBar.Panels.Items[1].Text := 'Total a Receber: R$ ' + FormatCurr('##.###,##',DM_Financeiro.Q_SomaTRECEBER.AsCurrency);
 totalBar.Panels.Items[2].Text := 'Total L�quido: R$ ' + FormatCurr('##.###,##',DM_Financeiro.Q_SomaTOTAL.AsCurrency);
end;

end.
