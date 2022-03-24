unit U_DM;

interface

uses
  System.SysUtils, Vcl.Dialogs, Vcl.Forms, System.Inifiles, System.Classes, Data.DB, Data.FMTBcd, Data.SqlExpr,
  IBX.IBCustomDataSet, IBX.IBDatabase, IBX.IBQuery, IBX.IBUpdateSQL, MD5;

type
  TDM_Financeiro = class(TDataModule)
    DB_Financeiro: TIBDatabase;
    Q_Login: TIBQuery;
    Trans_Financeiro: TIBTransaction;
    Q_LoginLOGIN: TIBStringField;
    Q_LoginSENHA: TIBStringField;
    Up_Usuario: TIBUpdateSQL;
    Q_Usuario: TIBQuery;
    Q_UsuarioUSU_CODIGO: TIntegerField;
    Q_UsuarioNOME: TIBStringField;
    Q_UsuarioLOGIN: TIBStringField;
    Q_UsuarioSENHA: TIBStringField;
    Q_Contas: TIBQuery;
    procedure DataModuleCreate(Sender: TObject);
    procedure Q_UsuarioAfterPost(DataSet: TDataSet);
    procedure Q_UsuarioBeforePost(DataSet: TDataSet);
    procedure Q_UsuarioAfterDelete(DataSet: TDataSet);
  private
    { Private declarations }
  public
    SenhaAtual: String;
  end;

var
  DM_Financeiro: TDM_Financeiro;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}


procedure TDM_Financeiro.DataModuleCreate(Sender: TObject);
var
  data: TIniFile;
  Arquivo, strCaminho: String;
begin
  DB_Financeiro.Connected := False;

  if FileExists(ExtractFilePath(Application.ExeName) + 'Base.ini') then
  begin
    Arquivo := ExtractFilePath(Application.ExeName) + 'Base.ini';
    Data := TiniFile.Create(Arquivo);
    strCaminho := Data.ReadString('BANCO', 'CAMINHO', '');
    Data.Free;

    DB_Financeiro.DatabaseName := strCaminho;

    try
      DB_Financeiro.Connected := True;
    except
      ShowMessage('N�o foi posss�vel conectar com o Banco de Dados');
    end;
  end;

end;

procedure TDM_Financeiro.Q_UsuarioAfterDelete(DataSet: TDataSet);
begin
  Q_Usuario.ApplyUpdates;
  Trans_Financeiro.CommitRetaining;

end;

procedure TDM_Financeiro.Q_UsuarioAfterPost(DataSet: TDataSet);
begin
  Q_Usuario.ApplyUpdates;
  Trans_Financeiro.CommitRetaining;
end;

procedure TDM_Financeiro.Q_UsuarioBeforePost(DataSet: TDataSet);
begin
    if Q_UsuarioSENHA.AsString <> SenhaAtual then
    begin
        Q_Usuario.Edit;
        Q_UsuarioSENHA.AsString := MD5Print(MD5String(DM_Financeiro.Q_UsuarioSENHA.AsString));
    end;
end;

end.
