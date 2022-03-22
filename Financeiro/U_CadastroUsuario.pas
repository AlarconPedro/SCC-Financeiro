unit U_CadastroUsuario;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, dxRibbonSkins, dxSkinsCore, dxSkinsDefaultPainters,
  dxRibbonCustomizationForm, dxBar, dxRibbon, cxClasses, Data.DB, Vcl.Grids,
  Vcl.DBGrids, dxStatusBar, dxRibbonStatusBar, Vcl.StdCtrls;

type
  TFrm_CadastroUsuarios = class(TForm)
    NavBar: TdxRibbon;
    NavBarCadastro: TdxRibbonTab;
    navCadastroUsuario: TdxBarManager;
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
    navCadastroUsuarioBar1: TdxBar;
    dxBarLargeButton5: TdxBarLargeButton;
    dxBarLargeButton6: TdxBarLargeButton;
    GroupBox1: TGroupBox;
    edtNomeCadastro: TEdit;
    edtNomeUsuario: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    edtLoginUsuario: TEdit;
    edtSenhaUsuario: TEdit;
    dxRibbonStatusBar1: TdxRibbonStatusBar;
    navCadastroUsuarioBar2: TdxBar;
    dxBarLargeButton7: TdxBarLargeButton;
    dxBarLargeButton8: TdxBarLargeButton;
    dxBarLargeButton9: TdxBarLargeButton;
    dxBarLargeButton10: TdxBarLargeButton;
    ds_Usuarios: TDataSource;
    DBGrid1: TDBGrid;
    navCadastroUsuarioBar3: TdxBar;
    dxBarLargeButton11: TdxBarLargeButton;
    procedure dxBarLargeButton11Click(Sender: TObject);
    procedure dxBarLargeButton5Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frm_CadastroUsuarios: TFrm_CadastroUsuarios;

implementation

uses U_DM, U_Login;

{$R *.dfm}

procedure TFrm_CadastroUsuarios.dxBarLargeButton11Click(Sender: TObject);
  begin
    close;
  end;

procedure TFrm_CadastroUsuarios.dxBarLargeButton5Click(Sender: TObject);
  begin
    {DM_Financeiro.Q_InsertUsuario.Close;
    DM_Financeiro.Q_InsertUsuario.ParamByName('userLogin').AsString := edtLoginUsuario.Text;
    DM_Financeiro.Q_InsertUsuario.ParamByName('userNome').AsString := edtNomeUsuario.Text;
    DM_Financeiro.Q_InsertUsuario.ParamByName('userSenha').AsString := edtSenhaUsuario.Text;
    DM_Financeiro.Q_InsertUsuario.Open;}
  end;

end.
