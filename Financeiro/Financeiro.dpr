program Financeiro;

uses
  Vcl.Forms,
  Vcl.Themes,
  Vcl.Styles,
  U_DM in 'U_DM.pas' {DM_Financeiro: TDataModule},
  U_Login in 'U_Login.pas' {F_Login},
  U_Principal in 'U_Principal.pas' {Frm_Principal};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TDM_Financeiro, DM_Financeiro);
  F_Login := TF_Login.Create(Application);
  F_Login.ShowModal;

  Application.Run;
end.
