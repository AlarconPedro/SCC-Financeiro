unit U_ListarContas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, dxSkinsCore, dxSkinsDefaultPainters,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, dxRibbonSkins,
  dxRibbonCustomizationForm, dxBar, dxRibbon, cxClasses, dxStatusBar,
  dxRibbonStatusBar;

type
  TFrm_ListarContas = class(TForm)
    barManagerContas: TdxBarManager;
    navbarListarContasTab1: TdxRibbonTab;
    navbarListarContas: TdxRibbon;
    itensContas: TdxRibbonPopupMenu;
    navbarListarContasTab2: TdxRibbonTab;
    totalBar: TdxRibbonStatusBar;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frm_ListarContas: TFrm_ListarContas;

implementation

{$R *.dfm}

end.
