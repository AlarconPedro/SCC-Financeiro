unit U_Login;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Buttons, Vcl.Mask, Data.FMTBcd,
  Data.DB, Data.SqlExpr, MD5;

type
  TF_Login = class(TForm)
    pnl_Fundo: TPanel;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    EdUsuario: TEdit;
    Label6: TLabel;
    Label7: TLabel;
    EdSenha: TMaskEdit;
    sbCancelar: TSpeedButton;
    sbConfirmar: TSpeedButton;
    sbCadastrar: TSpeedButton;
    procedure sbCancelarClick(Sender: TObject);
    procedure sbConfirmarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure EdUsuarioKeyPress(Sender: TObject; var Key: Char);
    procedure EdSenhaKeyPress(Sender: TObject; var Key: Char);
    procedure sbCadastrarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_Login: TF_Login;
  Logado: Boolean;

implementation

{$R *.dfm}

uses U_DM, U_Principal, U_CadastroUsuario;

procedure TF_Login.EdSenhaKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    sbConfirmar.Click;

end;

procedure TF_Login.EdUsuarioKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    EdSenha.SetFocus
  else if Key = #27 then
    ShowMessage('Digite seu Usuário e Senha !')
end;

procedure TF_Login.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if Logado then
  begin
    Application.CreateForm(TFrm_Principal, Frm_Principal);
    Frm_Principal.Show;
  end else
    Application.Terminate;
end;

procedure TF_Login.sbCadastrarClick(Sender: TObject);
  begin
    Application.CreateForm(TFrm_CadastroUsuarios, Frm_CadastroUsuarios);
    Frm_CadastroUsuarios.ShowModal;
  end;

procedure TF_Login.sbCancelarClick(Sender: TObject);
  begin
    F_Login.Close;
  end;

procedure TF_Login.sbConfirmarClick(Sender: TObject);
begin

  DM_Financeiro.Q_Login.Close;
  DM_Financeiro.Q_Login.ParamByName('userLogin').AsString := EdUsuario.Text;
  DM_Financeiro.Q_Login.ParamByName('senhaLogin').AsString := MD5Print(MD5String(EdSenha.Text));
  DM_Financeiro.Q_Login.Open;

  if DM_Financeiro.Q_Login.IsEmpty then
  begin
    showmessage('Usuário ou senha inválida!');
  end else
    begin
      Logado := true;
      F_Login.CloseModal;
    end;
end;

end.
