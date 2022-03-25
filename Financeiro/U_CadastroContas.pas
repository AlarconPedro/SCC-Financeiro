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
    dxRibbonStatusBar1: TdxRibbonStatusBar;
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
    procedure btnSairContasClick(Sender: TObject);
    procedure btnSalvarContasClick(Sender: TObject);
    procedure btnCancelarContasClick(Sender: TObject);
    procedure btnEditContasClick(Sender: TObject);
    procedure btnDeleteContasClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure rg_FPagamentoPagarChange(Sender: TObject);
    procedure ds_ContasPagarStateChange(Sender: TObject);
    procedure btnCPagarCadClick(Sender: TObject);
  private
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
end;

procedure TFrm_CadastroContas.btnCPagarCadClick(Sender: TObject);
begin
 pnlContasPagar.Visible := true;
 DM_Financeiro.Q_ContasPagar.Append;
end;

procedure TFrm_CadastroContas.btnDeleteContasClick(Sender: TObject);
begin
 DM_Financeiro.Q_ContasPagar.Delete;
end;

procedure TFrm_CadastroContas.btnEditContasClick(Sender: TObject);
begin
 DM_Financeiro.Q_ContasPagar.Edit;
end;

procedure TFrm_CadastroContas.btnSairContasClick(Sender: TObject);
begin
 Close;
end;

procedure TFrm_CadastroContas.btnSalvarContasClick(Sender: TObject);
begin
 DM_Financeiro.Q_ContasPagar.Post;
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
   end;
end;

procedure TFrm_CadastroContas.FormShow(Sender: TObject);
begin
 DM_Financeiro.Q_ContasPagar.Close;
 DM_Financeiro.Q_ContasPagar.Open;
 DM_Financeiro.Q_Categorias.Close;
 DM_Financeiro.Q_Categorias.Open;
 DM_Financeiro.Q_Categorias.FetchAll;
end;

procedure TFrm_CadastroContas.rg_FPagamentoPagarChange(Sender: TObject);
begin
  edtParcelasPagar.Enabled := (rg_FPagamentoPagar.Value = '1');
end;

end.