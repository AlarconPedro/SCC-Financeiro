unit U_CadastroCategorias;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, dxSkinsCore, dxSkinsDefaultPainters,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, dxRibbonSkins,
  dxRibbonCustomizationForm, dxBar, cxClasses, dxRibbon, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls, dxStatusBar,
  dxRibbonStatusBar;

type
  TFrm_CadastroCategoria = class(TForm)
    navCadastroCategorias: TdxBarManager;
    itensCadastro: TdxRibbonPopupMenu;
    navBarCadCategorias: TdxRibbonTab;
    RibbonCategorias: TdxRibbon;
    navCadastroCategoriasBar1: TdxBar;
    btnNovaCategoria: TdxBarLargeButton;
    btnSalvarCategoria: TdxBarLargeButton;
    navCadastroCategoriasBar2: TdxBar;
    btnEditarCategoria: TdxBarLargeButton;
    btnExcluirCategoria: TdxBarLargeButton;
    btnCancelar: TdxBarLargeButton;
    navCadastroCategoriasBar3: TdxBar;
    btnSair: TdxBarLargeButton;
    dxRibbonStatusBar1: TdxRibbonStatusBar;
    GroupBox1: TGroupBox;
    dbEditNome: TDBEdit;
    Label1: TLabel;
    dbGridCategorias: TDBGrid;
    ds_Categorias: TDataSource;
    procedure btnSairClick(Sender: TObject);
    procedure btnNovaCategoriaClick(Sender: TObject);
    procedure btnSalvarCategoriaClick(Sender: TObject);
    procedure btnEditarCategoriaClick(Sender: TObject);
    procedure btnExcluirCategoriaClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ds_CategoriasStateChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frm_CadastroCategoria: TFrm_CadastroCategoria;

implementation

uses U_DM;

{$R *.dfm}

procedure TFrm_CadastroCategoria.btnCancelarClick(Sender: TObject);
begin
 DM_Financeiro.Q_Categorias.Cancel;
end;

procedure TFrm_CadastroCategoria.btnEditarCategoriaClick(Sender: TObject);
begin
 DM_Financeiro.Q_Categorias.Edit;
end;

procedure TFrm_CadastroCategoria.btnExcluirCategoriaClick(Sender: TObject);
begin
   if (Application.MessageBox(PChar('Deseja realmente excluir est? conta?'+#13#13+'Obs: Todas as contas cadastradas com essa categoria ser?o excluidas, Deseja continuar?'), 'SCC', MB_YESNO + mb_DefButton1 + MB_ICONQUESTION + mb_TaskModal) = IDYES) then
     DM_Financeiro.Q_Categorias.Delete;
end;

procedure TFrm_CadastroCategoria.btnNovaCategoriaClick(Sender: TObject);
begin
 DM_Financeiro.Q_Categorias.Append;
 dbEditNome.SetFocus;
end;

procedure TFrm_CadastroCategoria.btnSairClick(Sender: TObject);
begin
 Close;
end;

procedure TFrm_CadastroCategoria.btnSalvarCategoriaClick(Sender: TObject);
begin
 DM_Financeiro.Q_Categorias.Post;
end;

procedure TFrm_CadastroCategoria.ds_CategoriasStateChange(Sender: TObject);
begin
  with ds_Categorias.DataSet do
    begin
      btnNovaCategoria.Enabled := (State = dsBrowse);
      btnEditarCategoria.Enabled := (State = dsBrowse) and (not IsEmpty);
      btnExcluirCategoria.Enabled := (State = dsBrowse) and (not IsEmpty);
      btnCancelar.Enabled := (State <> dsBrowse);
      btnSalvarCategoria.Enabled := (State <> dsBrowse);
      dbEditNome.Enabled := (State <> dsBrowse);
    end;
end;

procedure TFrm_CadastroCategoria.FormShow(Sender: TObject);
begin
  DM_Financeiro.Q_Categorias.Close;
  DM_Financeiro.Q_Categorias.Open;
end;

end.
