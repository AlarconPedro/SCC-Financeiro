unit U_CadastroContasFixas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, dxSkinsCore, dxSkinsDefaultPainters,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, dxRibbonSkins,
  dxRibbonCustomizationForm, dxBar, dxRibbon, cxClasses, dxStatusBar,
  dxRibbonStatusBar;

type
  TFrm_ContasFixas = class(TForm)
    navCadastroFixas: TdxBarManager;
    navCadastroCategoriasBar1: TdxBar;
    navCadastroCategoriasBar2: TdxBar;
    navCadastroCategoriasBar3: TdxBar;
    btnNovaFixa: TdxBarLargeButton;
    btnSalvarFixa: TdxBarLargeButton;
    btnEditarFixa: TdxBarLargeButton;
    btnExcluirFixa: TdxBarLargeButton;
    btnCancelar: TdxBarLargeButton;
    btnSair: TdxBarLargeButton;
    RibbonContasFixas: TdxRibbon;
    navBarCadCategorias: TdxRibbonTab;
    itensCadastro: TdxRibbonPopupMenu;
    dxRibbonStatusBar1: TdxRibbonStatusBar;
    procedure btnSairClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frm_ContasFixas: TFrm_ContasFixas;

implementation

{$R *.dfm}

procedure TFrm_ContasFixas.btnSairClick(Sender: TObject);
begin
 Close;
end;

end.
