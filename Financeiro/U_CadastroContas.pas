unit U_CadastroContas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, dxRibbonSkins, dxSkinsCore, dxSkinsDefaultPainters,
  dxRibbonCustomizationForm, dxBar, cxClasses, dxRibbon, Data.DB, Vcl.Grids,
  Vcl.DBGrids, dxStatusBar, dxRibbonStatusBar;

type
  TFrm_CadastroContas = class(TForm)
    navContasCadastro: TdxBarManager;
    navContasBar1: TdxBar;
    navContasBar2: TdxBar;
    navContasBar3: TdxBar;
    btnCPaagarCad: TdxBarLargeButton;
    btnCReceberCad: TdxBarLargeButton;
    btnEditContas: TdxBarLargeButton;
    btnSairContas: TdxBarLargeButton;
    btnDeleteContas: TdxBarLargeButton;
    btnCancelarContas: TdxBarLargeButton;
    btnSalvarContas: TdxBarLargeButton;
    navContasBar: TdxRibbon;
    NavBarContas: TdxRibbonTab;
    itensCadastro: TdxRibbonPopupMenu;
    DBGrid1: TDBGrid;
    dxRibbonStatusBar1: TdxRibbonStatusBar;
    ds_Contas: TDataSource;
    procedure btnSairContasClick(Sender: TObject);
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

procedure TFrm_CadastroContas.btnSairContasClick(Sender: TObject);
begin
 Close;
end;

end.
