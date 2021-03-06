unit U_DM;

interface

uses
  System.SysUtils, Vcl.Dialogs, Vcl.Forms, System.Inifiles, System.Classes, Data.DB, Data.FMTBcd, Data.SqlExpr,
  IBX.IBCustomDataSet, IBX.IBDatabase, IBX.IBQuery, IBX.IBUpdateSQL, MD5, U_Funcoes;

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
    Q_ContasPagar: TIBQuery;
    Q_Categorias: TIBQuery;
    Up_Categoria: TIBUpdateSQL;
    Q_ContasPagarCP_CODIGO: TIntegerField;
    Q_ContasPagarDESCRICAO: TIBStringField;
    Q_ContasPagarVALOR: TIBBCDField;
    Q_ContasPagarF_PAGAMENTO: TIntegerField;
    Q_ContasPagarVENCIMENTO: TDateField;
    Q_ContasPagarCAT_CODIGO: TIntegerField;
    Up_ContasPagar: TIBUpdateSQL;
    Q_ContasReceber: TIBQuery;
    Up_ContasReceber: TIBUpdateSQL;
    Q_ContasReceberCR_CODIGO: TIntegerField;
    Q_ContasReceberDESCRICAO: TIBStringField;
    Q_ContasReceberVALOR: TIBBCDField;
    Q_ContasReceberDATA_RECEBER: TDateField;
    Q_ContasReceberF_PAGAMENTO: TIntegerField;
    Q_ContasReceberCAT_CODIGO: TIntegerField;
    Q_Soma: TIBQuery;
    Q_SomaTRECEBER: TIBBCDField;
    Q_SomaTPAGAR: TIBBCDField;
    Q_SomaTOTAL: TIBBCDField;
    Q_LoginUSU_CODIGO: TIntegerField;
    Q_ContasPagarUSU_CODIGO: TIntegerField;
    Q_ContasReceberUSU_CODIGO: TIntegerField;
    Q_CategoriasCAT_CODIGO: TIntegerField;
    Q_CategoriasNOME: TIBStringField;
    Q_ContasPagarPARCELA: TIBStringField;
    Q_ContasPagarSTATUS: TIntegerField;
    Q_ContasReceberPARCELA: TIBStringField;
    Q_ContasReceberSTATUS: TIntegerField;
    Q_CPagarFiltro: TIBQuery;
    Q_CReceberFiltro: TIBQuery;
    Q_CPagarFiltroCP_CODIGO: TIntegerField;
    Q_CPagarFiltroDESCRICAO: TIBStringField;
    Q_CPagarFiltroVALOR: TIBBCDField;
    Q_CPagarFiltroF_PAGAMENTO: TIntegerField;
    Q_CPagarFiltroVENCIMENTO: TDateField;
    Q_CPagarFiltroCAT_CODIGO: TIntegerField;
    Q_CPagarFiltroUSU_CODIGO: TIntegerField;
    Q_CPagarFiltroPARCELA: TIBStringField;
    Q_CPagarFiltroSTATUS: TIntegerField;
    Q_CReceberFiltroCR_CODIGO: TIntegerField;
    Q_CReceberFiltroDESCRICAO: TIBStringField;
    Q_CReceberFiltroVALOR: TIBBCDField;
    Q_CReceberFiltroDATA_RECEBER: TDateField;
    Q_CReceberFiltroF_PAGAMENTO: TIntegerField;
    Q_CReceberFiltroCAT_CODIGO: TIntegerField;
    Q_CReceberFiltroUSU_CODIGO: TIntegerField;
    Q_CReceberFiltroPARCELA: TIBStringField;
    Q_CReceberFiltroSTATUS: TIntegerField;
    Q_CatFiltro: TIBQuery;
    Q_CatFiltroCAT_CODIGO: TIntegerField;
    Q_CatFiltroNOME: TIBStringField;
    Up_CPagarFiltro: TIBUpdateSQL;
    Up_CReceberFiltro: TIBUpdateSQL;
    Q_UsuarioISADM: TIBStringField;
    procedure DataModuleCreate(Sender: TObject);
    procedure Q_UsuarioAfterPost(DataSet: TDataSet);
    procedure Q_UsuarioBeforePost(DataSet: TDataSet);
    procedure Q_UsuarioAfterDelete(DataSet: TDataSet);
    procedure Q_ContasPagarAfterPost(DataSet: TDataSet);
    procedure Q_ContasPagarAfterDelete(DataSet: TDataSet);
    procedure Q_ContasPagarAfterInsert(DataSet: TDataSet);
    procedure Q_ContasReceberAfterPost(DataSet: TDataSet);
    procedure Q_ContasReceberAfterDelete(DataSet: TDataSet);
    procedure Q_ContasReceberAfterInsert(DataSet: TDataSet);
    procedure Q_ContasPagarBeforeOpen(DataSet: TDataSet);
    procedure Q_ContasReceberBeforeOpen(DataSet: TDataSet);
    procedure Q_CategoriasAfterDelete(DataSet: TDataSet);
    procedure Q_CategoriasAfterPost(DataSet: TDataSet);
    procedure Q_CPagarFiltroSTATUSGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure Q_CPagarFiltroAfterPost(DataSet: TDataSet);
    procedure Q_CReceberFiltroSTATUSGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure Q_CReceberFiltroAfterPost(DataSet: TDataSet);
    function VerificaTabelaVazia(Database: TIBDatabase; Tabela, CampoCodigo: String): Boolean;
    procedure Q_CPagarFiltroAfterDelete(DataSet: TDataSet);
    procedure Q_CReceberFiltroAfterDelete(DataSet: TDataSet);
  private
    { Private declarations }
  public
    SenhaAtual: String;
    UsuarioLogado: Integer;
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
      ShowMessage('N?o foi posss?vel conectar com o Banco de Dados');
    end;
  end;

end;

procedure TDM_Financeiro.Q_CategoriasAfterDelete(DataSet: TDataSet);
begin
  Q_Categorias.ApplyUpdates;
  Trans_Financeiro.CommitRetaining;
end;

procedure TDM_Financeiro.Q_CategoriasAfterPost(DataSet: TDataSet);
begin
  Q_Categorias.ApplyUpdates;
  Trans_Financeiro.CommitRetaining;
end;

procedure TDM_Financeiro.Q_ContasPagarAfterDelete(DataSet: TDataSet);
begin
  Q_ContasPagar.ApplyUpdates;
  Trans_Financeiro.CommitRetaining;
  Q_Soma.Close;
  Q_Soma.ParamByName('pusuario').AsInteger := UsuarioLogado;
  Q_Soma.ParamByName('rusuario').AsInteger := UsuarioLogado;
  Q_Soma.Open;
end;

procedure TDM_Financeiro.Q_ContasPagarAfterInsert(DataSet: TDataSet);
begin
  Q_ContasPagarF_PAGAMENTO.AsInteger := 0;
  Q_ContasPagarSTATUS.AsInteger := 0;

  Q_ContasPagarUSU_CODIGO.AsInteger := UsuarioLogado;
end;

procedure TDM_Financeiro.Q_ContasPagarAfterPost(DataSet: TDataSet);
begin
  Q_ContasPagar.ApplyUpdates;
  Trans_Financeiro.CommitRetaining;
  Q_Soma.Close;
  Q_Soma.ParamByName('pusuario').AsInteger := UsuarioLogado;
  Q_Soma.ParamByName('rusuario').AsInteger := UsuarioLogado;
  Q_Soma.Open;
end;

procedure TDM_Financeiro.Q_ContasPagarBeforeOpen(DataSet: TDataSet);
begin
  Q_ContasPagar.ParamByName('usuario').AsInteger := UsuarioLogado;
end;

procedure TDM_Financeiro.Q_ContasReceberAfterDelete(DataSet: TDataSet);
begin
  Q_ContasReceber.ApplyUpdates;
  Trans_Financeiro.CommitRetaining;
  Q_Soma.Close;
  Q_Soma.ParamByName('pusuario').AsInteger := UsuarioLogado;
  Q_Soma.ParamByName('rusuario').AsInteger := UsuarioLogado;
  Q_Soma.Open;
end;

procedure TDM_Financeiro.Q_ContasReceberAfterInsert(DataSet: TDataSet);
begin
  Q_ContasReceberF_PAGAMENTO.AsInteger := 0;
  Q_ContasReceberSTATUS.AsInteger := 0;
  Q_ContasReceberUSU_CODIGO.AsInteger := UsuarioLogado;
end;

procedure TDM_Financeiro.Q_ContasReceberAfterPost(DataSet: TDataSet);
begin
  Q_ContasReceber.ApplyUpdates;
  Trans_Financeiro.CommitRetaining;
  Q_Soma.Close;
  Q_Soma.ParamByName('pusuario').AsInteger := UsuarioLogado;
  Q_Soma.ParamByName('rusuario').AsInteger := UsuarioLogado;
  Q_Soma.Open;
end;

procedure TDM_Financeiro.Q_ContasReceberBeforeOpen(DataSet: TDataSet);
begin
  Q_ContasReceber.ParamByName('usuario').AsInteger := UsuarioLogado;
end;

procedure TDM_Financeiro.Q_CPagarFiltroAfterDelete(DataSet: TDataSet);
begin
  Q_CPagarFiltro.ApplyUpdates;
  Trans_Financeiro.CommitRetaining;
  Q_CPagarFiltro.Close;
  Q_CPagarFiltro.Open;
end;

procedure TDM_Financeiro.Q_CPagarFiltroAfterPost(DataSet: TDataSet);
begin
  Q_CPagarFiltro.ApplyUpdates;
  Trans_Financeiro.CommitRetaining;
  Q_CPagarFiltro.Close;
  Q_CPagarFiltro.Open;
end;

procedure TDM_Financeiro.Q_CPagarFiltroSTATUSGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
  if Sender.Asstring = '0' then
    Text := 'Pendente'
  else
    Text := 'Pago';
  end;

procedure TDM_Financeiro.Q_CReceberFiltroAfterDelete(DataSet: TDataSet);
begin
  Q_CReceberFiltro.ApplyUpdates;
  Trans_Financeiro.CommitRetaining;
  Q_CReceberFiltro.Close;
  Q_CReceberFiltro.Open;
end;

procedure TDM_Financeiro.Q_CReceberFiltroAfterPost(DataSet: TDataSet);
begin
  Q_CReceberFiltro.ApplyUpdates;
  Trans_Financeiro.CommitRetaining;
  Q_CReceberFiltro.Close;
  Q_CReceberFiltro.Open;
end;

procedure TDM_Financeiro.Q_CReceberFiltroSTATUSGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
  if Sender.Asstring = '0' then
    Text := 'Pendente'
  else
    Text := 'Pago';
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
  if VerificaTabelaVazia(DB_Financeiro, 'TB_Usuarios', 'Usu_codigo') then
    Q_UsuarioISADM.AsString := 'S'
  else
    Q_UsuarioISADM.AsString := 'N';

  if Q_UsuarioSENHA.AsString <> SenhaAtual then
    Q_UsuarioSENHA.AsString := MD5Print(MD5String(DM_Financeiro.Q_UsuarioSENHA.AsString));
end;

function TDM_Financeiro.VerificaTabelaVazia(Database: TIBDatabase; Tabela,
  CampoCodigo: String): Boolean;
var
  Q: TIBQuery;
begin
  Q := TIBQuery.Create(nil);
  try
    Q.Database := Database;
    Q.SQL.Add('SELECT ' + CampoCodigo + ' FROM ' + Tabela);
    Q.Open;
    Result := Q.IsEmpty;
  finally
    Q.Free;
  end;
end;



end.
