unit U_Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.ExtCtrls, JvExExtCtrls,
  JvExtComponent, JvPanel, JvOfficeColorPanel, ShellApi, Vcl.StdCtrls,
  Vcl.Buttons, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  dxRibbonSkins, dxSkinsCore, dxSkinsDefaultPainters, dxRibbonCustomizationForm,
  cxClasses, dxRibbon, dxBar, Vcl.ComCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids,
  dxStatusBar, dxRibbonStatusBar;

type
  TFrm_Principal = class(TForm)
    navBarRibbon: TdxBarManager;
    NavBarCadastro: TdxRibbonTab;
    NavBar: TdxRibbon;
    itensRibbon: TdxRibbonPopupMenu;
    NavBarEditar: TdxRibbonTab;
    NavBarLogin: TdxRibbonTab;
    NavBarContas: TdxRibbonTab;
    navCpagar: TdxBar;
    navFluxoCaixa: TdxBar;
    btnCPagar: TdxBarLargeButton;
    btnContasReceber: TdxBarLargeButton;
    navNovaCategoria: TdxBar;
    navNovaContaFixa: TdxBar;
    navEditar: TdxBar;
    navUsuário: TdxBar;
    btnNovaCategoria: TdxBarLargeButton;
    btnAlterarConta: TdxBarLargeButton;
    btnSairConta: TdxBarLargeButton;
    btnContaFixa: TdxBarLargeButton;
    btnFluxoCaixa: TdxBarLargeButton;
    navContas: TdxBar;
    btnListarContas: TdxBarLargeButton;
    btnCalendario: TdxBarLargeButton;
    btnContasFixas: TdxBarLargeButton;
    dxBarLargeButton1: TdxBarLargeButton;
    dxBarLargeButton2: TdxBarLargeButton;
    dxBarLargeButton3: TdxBarLargeButton;
    dxBarLargeButton4: TdxBarLargeButton;
    dxRibbonStatusBar1: TdxRibbonStatusBar;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnAlterarContaClick(Sender: TObject);
    procedure btnSairContaClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dxBarLargeButton3Click(Sender: TObject);

  private
    { Private declarations }
  public
  end;

var
  Frm_Principal: TFrm_Principal;

implementation

{$R *.dfm}

uses U_Login, U_Contas, U_CadastroUsuario;

procedure TFrm_Principal.btnAlterarContaClick(Sender: TObject);
  begin
    ShellExecute(Handle, 'open', PWideChar(Application.ExeName), nil, nil, SW_SHOWNORMAL) ;
    Application.Terminate;
  end;

procedure TFrm_Principal.btnSairContaClick(Sender: TObject);
begin
       Close;
end;

procedure TFrm_Principal.dxBarLargeButton3Click(Sender: TObject);
  begin
     Application.CreateForm(TFrm_CadastroUsuarios, Frm_CadastroUsuarios);
     Frm_CadastroUsuarios.ShowModal
  end;

procedure TFrm_Principal.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    Application.Terminate;
  end;

procedure TFrm_Principal.FormShow(Sender: TObject);
begin
if not Assigned(Frm_Contas)then
    begin
        Frm_Contas := TFrm_Contas.Create(Self);
    end;
    Frm_Contas.Show;
end;

end.
