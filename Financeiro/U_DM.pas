unit U_DM;

interface

uses
  System.SysUtils, Vcl.Dialogs, Vcl.Forms, System.Inifiles, System.Classes, Data.DB, Data.FMTBcd, Data.SqlExpr,
  IBX.IBCustomDataSet, IBX.IBDatabase, IBX.IBQuery;

type
  TDM_Financeiro = class(TDataModule)
    DB_Financeiro: TIBDatabase;
    Q_Usuario: TIBQuery;
    Trans_Financeiro: TIBTransaction;
    Q_UsuarioLOGIN: TIBStringField;
    Q_UsuarioSENHA: TIBStringField;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
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

end.
