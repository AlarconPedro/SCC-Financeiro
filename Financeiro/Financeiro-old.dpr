 program Financeiro;

uses
  Vcl.Forms,
  Vcl.Themes,
  Vcl.Styles,
  U_DM in 'U_DM.pas' {DM_Financeiro: TDataModule},
  U_Login in 'U_Login.pas' {F_Login},
  U_Principal in 'U_Principal.pas' {Frm_Principal},
  U_CadastroUsuario in 'U_CadastroUsuario.pas' {Frm_CadastroUsuario},
  U_CadastroContas in 'U_CadastroContas.pas' {Frm_CadastroContas},
  U_CadastroCategorias in 'U_CadastroCategorias.pas' {Frm_CadastroCategoria},
  U_CadastroContasFixas in 'U_CadastroContasFixas.pas' {Frm_ContasFixas},
  U_ListarContas in 'U_ListarContas.pas' {Frm_ListarContas},
  U_Funcoes in 'U_Funcoes.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  F_Login := TF_Login.Create(Application);
  Application.CreateForm(TDM_Financeiro, DM_Financeiro);
  F_Login.ShowModal;

  Application.Run;
end.
