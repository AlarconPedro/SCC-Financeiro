unit U_CadastroUsuario;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, dxRibbonSkins, dxSkinsCore, dxSkinsDefaultPainters,
  dxRibbonCustomizationForm, dxBar, dxRibbon, cxClasses;

type
  TFrm_CadastroUsuarios = class(TForm)
    NavBar: TdxRibbon;
    NavBarContas: TdxRibbonTab;
    NavBarCadastro: TdxRibbonTab;
    NavBarEditar: TdxRibbonTab;
    NavBarLogin: TdxRibbonTab;
    navCadastroUsuario: TdxBarManager;
    navCpagar: TdxBar;
    navNovaCategoria: TdxBar;
    navNovaContaFixa: TdxBar;
    navEditar: TdxBar;
    navUsu�rio: TdxBar;
    btnCPagar: TdxBarLargeButton;
    btnContasReceber: TdxBarLargeButton;
    btnNovaCategoria: TdxBarLargeButton;
    btnAlterarConta: TdxBarLargeButton;
    btnSairConta: TdxBarLargeButton;
    btnContaFixa: TdxBarLargeButton;
    btnFluxoCaixa: TdxBarLargeButton;
    btnListarContas: TdxBarLargeButton;
    btnCalendario: TdxBarLargeButton;
    btnContasFixas: TdxBarLargeButton;
    dxBarLargeButton1: TdxBarLargeButton;
    dxBarLargeButton2: TdxBarLargeButton;
    dxBarLargeButton3: TdxBarLargeButton;
    dxBarLargeButton4: TdxBarLargeButton;
    itensCadastro: TdxRibbonPopupMenu;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frm_CadastroUsuarios: TFrm_CadastroUsuarios;

implementation

{$R *.dfm}

end.