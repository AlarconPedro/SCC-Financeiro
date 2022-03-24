unit U_CadastroCategorias;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, dxSkinsCore, dxSkinsDefaultPainters,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, dxRibbonSkins,
  dxRibbonCustomizationForm, dxBar, cxClasses, dxRibbon;

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
    procedure btnSairClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frm_CadastroCategoria: TFrm_CadastroCategoria;

implementation

{$R *.dfm}

procedure TFrm_CadastroCategoria.btnSairClick(Sender: TObject);
begin
 Close;
end;

end.
