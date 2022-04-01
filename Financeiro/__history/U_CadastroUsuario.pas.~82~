unit U_CadastroUsuario;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, dxRibbonSkins, dxSkinsCore, dxSkinsDefaultPainters,
  dxRibbonCustomizationForm, dxBar, dxRibbon, cxClasses, Data.DB, Vcl.Grids,
  Vcl.DBGrids, dxStatusBar, dxRibbonStatusBar, Vcl.StdCtrls, Vcl.Mask,
  Vcl.DBCtrls, MD5;

type
  TFrm_CadastroUsuarios = class(TForm)
    NavBar: TdxRibbon;
    NavBarCadastro: TdxRibbonTab;
    navCadastroUsuario: TdxBarManager;
    itensCadastro: TdxRibbonPopupMenu;
    navCadastroUsuarioBar: TdxBar;
    btnSalvarUser: TdxBarLargeButton;
    btnAddUser: TdxBarLargeButton;
    GroupBox1: TGroupBox;
    edtNomeUsuario: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    dxRibbonStatusBar1: TdxRibbonStatusBar;
    navEditarCadastro: TdxBar;
    btnEditUser: TdxBarLargeButton;
    btnExcluirUser: TdxBarLargeButton;
    btnCancelarCad: TdxBarLargeButton;
    ds_Usuarios: TDataSource;
    DBGrid1: TDBGrid;
    navCadastroSair: TdxBar;
    btnSairCad: TdxBarLargeButton;
    dbeditLogin: TDBEdit;
    dbeditNome: TDBEdit;
    dbeditSenha: TDBEdit;
    procedure btnSairCadClick(Sender: TObject);
    procedure btnSalvarUserClick(Sender: TObject);
    procedure btnAddUserClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnEditUserClick(Sender: TObject);
    procedure btnExcluirUserClick(Sender: TObject);
    procedure btnCancelarCadClick(Sender: TObject);
    procedure ds_UsuariosStateChange(Sender: TObject);
  private
    { Private declarations }
  public

  end;

var
  Frm_CadastroUsuarios: TFrm_CadastroUsuarios;

implementation

uses U_DM, U_Login;

{$R *.dfm}

procedure TFrm_CadastroUsuarios.btnCancelarCadClick(Sender: TObject);
begin
  DM_Financeiro.Q_Usuario.Cancel;
end;

procedure TFrm_CadastroUsuarios.btnEditUserClick(Sender: TObject);
begin
  DM_Financeiro.SenhaAtual := DM_Financeiro.Q_UsuarioSENHA.AsString;
  DM_Financeiro.Q_Usuario.Edit;
end;

procedure TFrm_CadastroUsuarios.btnExcluirUserClick(Sender: TObject);
begin
  if (Application.MessageBox(PChar('Deseja realmente excluir este usuário?'), 'SCC', MB_YESNO + mb_DefButton1 + MB_ICONQUESTION + mb_TaskModal) = IDYES) then
    DM_Financeiro.Q_Usuario.Delete;
end;

procedure TFrm_CadastroUsuarios.btnSairCadClick(Sender: TObject);
  begin
    close;
  end;

procedure TFrm_CadastroUsuarios.btnSalvarUserClick(Sender: TObject);
  begin
    DM_Financeiro.Q_Usuario.Post;
  end;

procedure TFrm_CadastroUsuarios.ds_UsuariosStateChange(Sender: TObject);
begin
    with ds_Usuarios.Dataset do
    begin
      btnAddUser.Enabled := (State = dsBrowse);
      btnEditUser.Enabled := (State = dsBrowse) and (not IsEmpty);
      btnExcluirUser.Enabled := (State = dsBrowse) and (not IsEmpty);
      btnCancelarCad.Enabled := (State <> dsBrowse);
      btnSalvarUser.Enabled := (State <> dsBrowse);
    end;
end;

procedure TFrm_CadastroUsuarios.btnAddUserClick(Sender: TObject);
  begin
    dbeditNome.SetFocus;
    DM_Financeiro.Q_Usuario.Append;
  end;

procedure TFrm_CadastroUsuarios.FormShow(Sender: TObject);
begin
  DM_Financeiro.Q_Usuario.Close;
  DM_Financeiro.Q_Usuario.Open;
end;

end.
