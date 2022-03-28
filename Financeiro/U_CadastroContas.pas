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
    DBLookupComboBox1: TDBLookupComboBox;
    Label2: TLabel;
    rg_FPagamentoPagar: TDBRadioGroup;
    pnlContasReceber: TPanel;
    GroupBox2: TGroupBox;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    edtDescricaoReceber: TDBEdit;
    edtVencimentoReceber: TDBEdit;
    edtValorReceber: TDBEdit;
    edtParcelasReceber: TDBEdit;
    edtCatReceber: TDBLookupComboBox;
    DBRadioGroup1: TDBRadioGroup;
    dgContasReceber: TDBGrid;
    ds_ContasReceber: TDataSource;
    totalBar: TdxRibbonStatusBar;
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
  private
    procedure AtualizaValor;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frm_CadastroContas: TFrm_CadastroContas;

implementation

uses U_DM;

{$R *.dfm}

procedure TFrm_CadastroContas.btnCancelarContasClick(Sender: TObject);
begin
 DM_Financeiro.Q_ContasPagar.Cancel;
 DM_Financeiro.Q_ContasReceber.Cancel;
 AtualizaValor;
end;

procedure TFrm_CadastroContas.btnCPagarCadClick(Sender: TObject);
begin
 pnlContasReceber.Visible := false;
 pnlContasPagar.Visible := true;
 DM_Financeiro.Q_ContasPagar.Append;
 AtualizaValor;
end;

procedure TFrm_CadastroContas.btnCReceberCadClick(Sender: TObject);
begin
 pnlContasPagar.Visible := false;
 pnlContasReceber.Visible := true;
 DM_Financeiro.Q_ContasReceber.Append;
 AtualizaValor;
end;

procedure TFrm_CadastroContas.btnDeleteContasClick(Sender: TObject);
begin
  if pnlContasPagar.Visible then
   if (ds_ContasPagar.DataSet.State = dsBrowse) and (not ds_ContasPagar.DataSet.IsEmpty) then
      DM_Financeiro.Q_ContasPagar.Delete;
      AtualizaValor;

  if pnlContasReceber.Visible then
   if (ds_ContasReceber.DataSet.State = dsBrowse) and (not ds_ContasReceber.DataSet.IsEmpty) then
      DM_Financeiro.Q_ContasReceber.Delete;
      AtualizaValor;
end;

procedure TFrm_CadastroContas.btnEditContasClick(Sender: TObject);
begin
  if pnlContasPagar.Visible then
   if (ds_ContasPagar.DataSet.State = dsBrowse) and (not ds_ContasPagar.DataSet.IsEmpty) then
      DM_Financeiro.Q_ContasPagar.Edit;
      AtualizaValor;

  if pnlContasReceber.Visible then
   if (ds_ContasReceber.DataSet.State = dsBrowse) and (not ds_ContasReceber.DataSet.IsEmpty) then
      DM_Financeiro.Q_ContasReceber.Edit;
      AtualizaValor;
end;

procedure TFrm_CadastroContas.btnSairContasClick(Sender: TObject);
begin
 Close;
end;

procedure TFrm_CadastroContas.btnSalvarContasClick(Sender: TObject);
begin
 if pnlContasPagar.Visible then
   if ds_ContasPagar.DataSet.State <> dsBrowse then
      DM_Financeiro.Q_ContasPagar.Post;
      AtualizaValor;

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
    btnEditContas.Enabled := (State = dsBrowse) and (not IsEmpty);
    btnDeleteContas.Enabled := (State = dsBrowse) and (not IsEmpty);
    btnSalvarContas.Enabled := (State <> dsBrowse);
    btnCancelarContas.Enabled := (State <> dsBrowse);
    btnCReceberCad.Enabled := (State = dsBrowse);
    AtualizaValor;
   end;
end;

procedure TFrm_CadastroContas.ds_ContasReceberStateChange(Sender:  TObject);
begin
 with ds_ContasReceber.DataSet do
   begin
    btnCReceberCad.Enabled := (State = dsBrowse);
    btnEditContas.Enabled := (State = dsBrowse) and (not IsEmpty);
    btnDeleteContas.Enabled := (State = dsBrowse) and (not IsEmpty);
    btnSalvarContas.Enabled := (State <> dsBrowse);
    btnCancelarContas.Enabled := (State <> dsBrowse);
    btnCPagarCad.Enabled := (State = dsBrowse);
    AtualizaValor;
   end;
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
 DM_Financeiro.Q_Soma.Open;

end;

procedure TFrm_CadastroContas.rg_FPagamentoPagarChange(Sender: TObject);
begin
  edtParcelasPagar.Enabled := (rg_FPagamentoPagar.Value = '1');
end;

procedure TFrm_CadastroContas.AtualizaValor;
begin
 totalBar.Panels.Items[0].Text := 'Total a Pagar: ' + DM_Financeiro.Q_SomaTOTALPAGAR.AsString;
 totalBar.Panels.Items[1].Text := 'Total a Receber: ' + DM_Financeiro.Q_SomaTOTALRECEBER.AsString;
 totalBar.Panels.Items[2].Text := 'Total L�quido: ' + DM_Financeiro.Q_SomaTOTALGERAL.AsString;
end;

end.
