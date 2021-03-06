unit U_Funcoes;

interface

uses
  Windows, filectrl, Printers, Winsock, MMSystem, Forms, ShellApi, SysUtils, DB,
  MD5, IBX.IB, StdCtrls, Classes, registry, IBX.IBDatabase, DBCtrls, Messages, IniFiles,
  Controls, IBX.IBStoredProc, Urlmon, Buttons, Dialogs, IBX.IBQuery, Menus,  IdHTTP, IdFTP, IdMultiPartFormData, IdAntiFreeze, IdAntiFreezeBase, IdStackWindows,
  cxTextEdit;

const
  Letra: Array[0..9] of String = ('S', 'V', 'A', 'I', 'C', 'O', 'M', 'D', 'E', 'U');

  Palavra1: Array[0..5, 0..4] of String = (
    ('Sabedoria', 'Sabor', 'S?bio', 'Saber', 'S?bado'),
    ('Dom?nio', 'Domador', 'Domic?lio', 'Domin?', 'Dom?stico'),
    ('Seguran?a', 'Seguinte', 'Seguir', 'Segundo', 'Seguidor'),
    ('Ternura', 'Terabyte', 'Terminal', 'Terceirizar', 'T?rmico'),
    ('Qualidade', 'Quatrocentos', 'Qu?ntico', 'Quantidade', 'Quarenta'),
    ('Quimeras', 'Quilometragem', 'Quilograma', 'Quilowatt', 'Qu?mica')
  );

  Palavra2: Array[0..9, 0..4] of String = (
    ('J?ia', 'Janela', 'Janeiro', 'Jogador', 'Jornalismo'),
    ('Automa??o', 'Acesso', 'Atalho', 'Aplicativo', 'Arquivo'),
    ('Backup', 'Bot?o', 'Byte', 'Blog', 'BIOS'),
    ('Contratos', 'CD-ROM', 'Chip', 'Circuito', 'Computador'),
    ('Demonstra??o', 'Desktop', 'Disquete', 'Documento', 'DVD'),
    ('Empresa', 'Endere?o', 'Engenharia', 'Emoticons', 'Editor'),
    ('Fatura', 'F?rum', 'Fibra', 'Favorito', 'Ferramenta'),
    ('Garantia', 'Gerenciador', 'Gigabyte', 'G?nio', 'Gabarito'),
    ('Hor?rios', 'Hardware', 'Home-Page', 'Hiperm?dia', 'HDTV'),
    ('Irradia??o', '?cone', 'Internet', 'Imagem', 'Inform?tica')
  );

  Palavra3: Array[0..1, 0..4] of String = (
    ('Ambiente', '?udio', 'Antena', 'ADSL', 'Anal?gico'),
    ('Digital', 'Diret?rio', 'Disco', 'Data', 'Download')
  );  

  Numero: Array['A'..'V'] of Integer = (2, 10, 4, 7, 8, 10, 10, 10, 3, 10, 10, 10, 6, 10, 5, 10, 10, 10, 0, 10, 9, 1);
  DiadaSemana : Array[1..7] of String = ('Domingo', 'Segunda-feira', 'Ter?a-feira', 'Quarta-feira', 'Quinta-feira', 'Sexta-feira', 'S?bado');

type
  Tag = Record
  ValidMPEGText     : String;
  FileSizeText      : String;
  MPEGTypeText      : String;
  BitRateText       : String;
  SampleRateText    : String;
  ChannelModeText   : String;
  DurationText      : String;
  FirstFrameAtText  : String;
  CRCProtectionText : String;
  TotalFramesText   : String;
  CopyrightText     : String;
  OriginalText      : String;
  EmphasisText      : String;
  EncoderText       : String;
  TagExistsValue    : String;
  TagVersionValue   : String;
  SizeValue         : String;
  TitleEdit         : String;
  ArtistEdit        : String;
  AlbumEdit         : String;
  TrackEdit         : String;
  YearEdit          : String;
  GenreEdit         : String;
  CommentEdit       : String;
  ComposerEdit      : String;
  EncoderEdit       : String;
  CopyrightEdit     : String;
  LanguageEdit      : String;
  GravadoraEdit     : String;
  VocalEdit         : String;
  AvaliacaoEdit     : String;
  TipoPeriodoEdit   : String;
  PeriodoInicioEdit : String;
  PeriodoFimEdit    : String;
  LinkEdit          : String;
  RitimoEdit        : String;
  IntroEdit         : String;
  ExtensaoEdit      : String;
  SubGeneroEdit     : String;
  IDMusicaEdit      : String;
  CarimboEdit       : String;
  VinhetaEdit       : String;
  MixInicioEdit     : String;
  MixFimEdit        : String;
  RefraoInicioEdit  : String;
  RefraoFimEdit     : String;
  PontoMix          : String;
end;

type
  Memoria = Record
  Total: String;
  Livre: String;
end;

type
  Monitor = Record
  Cores      : Integer;
  Largura    : Integer;
  Comprimento: Integer;
end;

type
  FileInf = Record
  Empresa      : String;
  Descricao    : String;
  VersaoArquivo: String;
  NomeInterno  : String;
  Copyrigh     : String;
  NomeOriginal : String;
  Produto      : String;
  VersaoProduto: String;
  Comentarios  : String;
end;

type
  SerialProcessador = Record
  Modelo : String;
  Familia: String;
  CPUID1 : String;
  CPUID2 : String;
  CPUID3 : String;
  CPUID4 : String;
  PValue : String;
  SValue : String;
  Vendor : String;
end;

type
  ConverteSegundos = record
  Dia  : String;
  Resto: String;
end;

  function GetVersionEx(lpVersionInformation: Pointer): BOOL; stdcall; external 'kernel32.dll' name 'GetVersionExA'
  function VerificaDataNasc(Idade: String): String;
  function EnquadraTelaLargura(LTotal, LAtual: Integer): Integer;
  function EnquadraTelaAltura(ATotal, AAtual: Integer): Integer;
  function SaveLogError(Const Tela, Usuario, Descricao, Tipo, Processo: string): integer;
  function CarregaBemVindo: String;
  function CriaFormulario(Classe: TFormClass; Modal, SubTela: Boolean): TForm;
  function CriaFormularioModal(Classe : TFormClass):TForm;
  function CriaFormularioReferencia(Classe: TFormClass): TForm;
  function ZeroEsquerda(sTexto: String; iTamanho: Integer): String;
  function BuscaCaminho(Arquivo: String) :String;
  function ExisteArquivo(Arquivo, Transmissao, Mono: String) :String;
  function Diretorio(Pasta, Transmissao, Mono: String) :String;
  function ExecExplorer(OpenAtPath: string; OpenWithExplorer, OpenAsRoot: Boolean): boolean;
  function VersaoSistema(Programa: String) : String;
  function DownloadFile(Source, Dest: string): Boolean;
  function FileCopy(source,dest: String): Boolean;
  function TestaPlaca: Boolean;
  function Percentdisk(unidade: byte): Integer;
  function CorrentPrinter :String;
  function NetIsPresent: boolean;
  function ExecAndWait(const FileName, Params: string; const WindowState: Word): boolean;
  function TotalMemoria: Memoria;
  function NumeroDrive(const Drive: Char): byte;
  function GetIP: String;
  function HostName(strIPAddress: String): String;
  procedure VerificaArquivoRelatorio(iCodRelCliente: Integer; sArquivoRelCliente: String);
  function retornaData(iDia, iMes, iAno: Integer): TDate;
  function formatarCPF_CNPJ(sTexto: String): String;
  function formatarCEP(sTexto: String): String;
  function removerAspas(sTexto: String): String;
  function trocarVirgulasPonto(sTexto: String): String;
  function gerarGUID: String;
  function CoresMonitor: Monitor;
  Function TiraAcento(ca_frase:STRING):String;
  Function QuebraLinha(Texto: String; Tamanho: Integer): String;
  Function QuebraLinhaParcial(Texto: String; Tamanho: Integer): String; //Para cortar a palavra e colocar "..." no final
  function CPUSpeed: Double;
  Function VerificaHD: String;
  Function padC( s1:string; s2:char; nlen:integer ):string;
  Function padL( s1:string; s2:char; nlen:integer ):string;
  Function padR( s1:string; s2:char; nlen:integer ):string;
  function Cgc( xCGC:String ):Boolean;
  function Cpf( xCPF:String ):Boolean;
  function FileVerInfo(const FileName: string): FileInf;
  function SerialdoProcessador: SerialProcessador;
  function SecToDuracao(Segundos: Integer): String;
  Function SecToDuracaoHora(Segundos: Integer): String;
  Function SecToDuracaoDia(Segundos: Integer): ConverteSegundos;
  Function DuracaoToSec(Duracao: String): Integer;
  function DuracaoToMilSec(sDuracao: String): Double;
  Function DuracaoToSecHora(Duracao: String): Integer;
  function DeleteFolder(Folder: String; PouparFolder: Boolean): Boolean;
  function TipoDrive(Drive:Char):String;
  function DriveLetra: string;
  function TamanhoArquivo(Arquivo: string): Integer;
  function CriptografiaMD5(sTexto: String): String;
  function EnDecryptString(StrValue : String; Chave: Word) : String;
  function EncodeDecode(const Str: AnsiString): AnsiString;
  function TiraE(mcaption : String) : String;
  function AjustaString(Str:String):String;
//  function VerificaDuracao(Arquivo: String): Integer;
  function AutoCompletar(Database: TIBDatabase; Campo, Tabela : ShorTString ; TextoBusca : TDBEdit; isLista: Boolean; Lista: TListBox ) : ShortString;
  function ContaArquivos(Dir: String): Integer;
  function CarregaTemperatura: String;
  Function WinVersion: string;
  function LocalizaWMA(Dir: String): Boolean;
  function LocalizaOGG(Dir: String): Boolean;
  function RemoveCaracterInvalido(sTexto: String): String;
  function RemoveCaracterFone(sTexto: String): String;
  function VerificaTeclaConsulta(pStrTecla: Char): Boolean;
  function ChamarTelaConsulta(Classe: TFormClass; pStrTecla: Char = ' '; pBlnAbrir: Boolean = True): TForm;
//  function GravaTag(Arquivo, Musica, Interprete, Compositor, Album, Ano, Faixa, ID, Genero, SubGenero, Ritmo, Idioma, Gravadora, Vocal, Avaliacao, TipoPeriodo, PeriodoInicio, PeriodoFim, Extensao, Comentario, Intro, Carimbo, Vinheta, MixInicio, MixFim, RefraoInicio, RefraoFim, PontoMix: String): boolean;
  function MoverArquivo(Origem, Destino: String): Boolean;
  function BuscaValor(Database: TIBDatabase; Tabela, CampoRetorno, CampoCodigo: String; VlrCampoCodigo: Integer; FiltroExtra: String = ''): String;
  function RetornaFiltroSqlPerfil(BancoDados: TIBDatabase; pStrCondicaoSql: String): String;
  function BuscaPath(pStrPath: String; pBlnMono: Boolean): String;
  function SerialFisicoHD: String;
  function RetornaArquivoPath(pStrArquivo: String; pBlnMono: Boolean): String;
  function RetornaArquivoRede(pStrPath, pStrServidor: String; pBlnMono: Boolean): String;
  function RetornaVersaoAplicativo: String;
  function RetornaDiaSemana(Data:TDateTime): String;

  procedure DeletaArquivosPasta(Pasta: String);
  procedure DrivesExistentes(Combo: TComboBox);
  procedure GeraExcecao(Tela, Usuario: String; E: Exception);
  procedure GravaBemVindo(ExibeBemVindo: String);
  procedure CarregaListaSkin(caminho: string; Combobox: TComboBox);
  procedure CarregaListaPlugin(caminho: string; Combobox: TComboBox);
  procedure ClicaMouse;
  procedure AbreWebSite(Endereco : PChar);
  procedure FecharPrograma(Nome: String);
//  procedure IniciaTag(Extensao: String);
//  procedure LimpaTag;
//  procedure RemoveTag(Arquivo: String);
//  procedure CarregaTAG(Arquivo: String);
//  procedure FinalizaTag(Extensao: String);
  procedure CopyDirToDir(const cFrom, cTo : string);
  procedure MoveDirToDir(const cFrom, cTo : string);
  procedure Split(const Delimiter: Char; Input: string; const Strings: TStrings);
  procedure CopiarArquivo(Origem, Destino: String);
//  procedure AlteraCadastrada(Arquivo, Status: String);
  procedure RetiraReadOnlyArquivo(sArquivo: String);
  procedure AtualizaScroll(Sender: TControl; DataSet: TDataSet);
  function ChamaFormaPagamentos(Form: TForm; FormClass : TFormClass):Boolean;
  procedure AbrirRelatorio(blnDesigner: Boolean; Arquivo : String; DataSource : TDataSource);
  function Criptografia(Action, Src: String): String;
  function AnoBiSexto(Ano: Integer): Boolean;
  function DiasPorMes(Ano, Mes: Integer): Integer;
  function DataExtenso(Data: TDateTime; tipo: integer): String;
  function MesExtenso(iMes: Integer): String;
var
  AlturaForm, LarguraForm, NOR_SET, iCodRefLog: Integer;
  MDIMain   : TForm;
  VarSubTela: Boolean;
  iTag      : Tag;

implementation

const
  ID_BIT = $200000; //EFLAGS ID bit

type
  TCPUID  = array[1..4]  of Longint;
  TVendor = array[0..11] of char;

function IsCPUID_Available : Boolean; register;
asm
  PUSHFD             {direct access to flags no possible, only via stack}
  POP     EAX        {flags to EAX}
  MOV     EDX,EAX    {save current flags}
  XOR     EAX,ID_BIT {not ID bit}
  PUSH    EAX        {onto stack}
  POPFD              {from stack to flags, with not ID bit}
  PUSHFD             {back to stack}
  POP     EAX        {get back to EAX}
  XOR     EAX,EDX    {check if ID bit affected}
  JZ      @exit      {no, CPUID not availavle}
  MOV     AL,True    {Result=True}
  @exit:
end;

function GetCPUID : TCPUID; assembler; register;
asm
  PUSH    EBX        {Save affected register}
  PUSH    EDI
  MOV     EDI,EAX    {@Resukt}
  MOV     EAX,1
  DW      $A20F      {CPUID Command}
  STOSD              {CPUID[1]}
  MOV     EAX,EBX
  STOSD              {CPUID[2]}
  MOV     EAX,ECX
  STOSD              {CPUID[3]}
  MOV     EAX,EDX
  STOSD              {CPUID[4]}
  POP     EDI        {Restore registers}
  POP     EBX
end;

function GetCPUVendor : TVendor; assembler; register;
asm
  PUSH    EBX             {Save affected register}
  PUSH    EDI
  MOV     EDI,EAX         {@Result (TVendor)}
  MOV     EAX,0
  DW      $A20F           {CPUID Command}
  MOV     EAX,EBX
  XCHG          EBX,ECX   {save ECX result}
  MOV               ECX,4
@1:
  STOSB
  SHR     EAX,8
  LOOP    @1
  MOV     EAX,EDX
  MOV               ECX,4
@2:
  STOSB
  SHR     EAX,8
  LOOP    @2
  MOV     EAX,EBX
  MOV               ECX,4
@3:
  STOSB
  SHR     EAX,8
  LOOP    @3
  POP     EDI             {Restore registers}
  POP     EBX
end;

function SerialdoProcessador: SerialProcessador;
var
  CPUID: TCPUID;
  I    : Integer;
  S    : TVendor;
begin
  for I := Low(CPUID) to High(CPUID)  do
  begin
    CPUID[I] := -1;
    if IsCPUID_Available then
    begin
      CPUID := GetCPUID;
      Result.CPUID1  := 'CPUID[1] = ' + IntToHex(CPUID[1],8);
      Result.CPUID2  := 'CPUID[2] = ' + IntToHex(CPUID[2],8);
      Result.CPUID3  := 'CPUID[3] = ' + IntToHex(CPUID[3],8);
      Result.CPUID4  := 'CPUID[4] = ' + IntToHex(CPUID[4],8);
      Result.PValue  := IntToStr(CPUID[1] shr 12 and 3);
      Result.Familia := IntToStr(CPUID[1] shr 8 and $f);
      Result.Modelo  := IntToStr(CPUID[1] shr 4 and $f);
      Result.SValue  := IntToStr(CPUID[1] and $f);
      S := GetCPUVendor;
      Result.Vendor  := 'Vendor: ' + S;
    end else
    begin
      Result.Vendor  := 'CPUID not available';
    end;
  end;
end;

function VerificaDataNasc(Idade: String): String;
var
  NIdade,Dia, Mes, Ano: Word;
begin
  DecodeDate(Date, Ano, Mes, Dia);
  NIdade := StrToInt(Idade);
  Ano := Ano - NIdade;
  Result := DateToStr(EncodeDate(Ano, Mes, Dia));
end;

function EnquadraTelaLargura(LTotal, LAtual: Integer): Integer;
var
  Valor: Real;
begin
  Valor := LTotal - LAtual;
  Result := round(Valor / 2);
end;

function EnquadraTelaAltura(ATotal, AAtual: Integer): Integer;
var
  Valor: Real;
begin
  Valor := ATotal - AAtual;
  Result := round(Valor / 2);
end;

Function CriaFormulario(Classe: TFormClass; Modal, SubTela: Boolean): TForm;
Var
  i: integer;
  nArea, nPosicao: Currency;
Begin
  VarSubTela := SubTela;
  if Modal then                                                //Formul?rio Modal.
  begin
//    Application.CreateForm(Classe, Objeto);
    Result := Classe.Create(Application);                           //N?o existe.
    Result.BorderIcons := [biSystemMenu];
    nArea := MDIMain.Height;
    nPosicao := (nArea - Result.Height) / 2 + 35;
    Result.Top := StrToInt(CurrToStr(Round(nPosicao)));
    Result.ShowModal;
    Result.Release;
    Result := nil;
  end else                                                     //Formul?rio Normal.
  begin
    for i := 0 To MDIMain.MDIChildCount - 1 Do
    begin
      if MDIMain.MDIChildren[i] Is Classe then
      begin
        Result := MDIMain.MDIChildren[i];
        MDIMain.MDIChildren[i].Show;
        MDIMain.MDIChildren[i].WindowState := wsNormal;
        Exit;
      end;
    end;
    Result := Classe.Create(Application);                           //N?o existe.
    Result.FormStyle := fsMDIChild;

    nArea := MDIMain.Height;
    if Screen.Height <= 720 then
      nPosicao := 0
    else
      nPosicao := 8; //(nArea - Result.Height) / 2 - 50;
    Result.Top := StrToInt(CurrToStr(Round(nPosicao)));
    Result.Left := Round((MDIMain.Width - Result.Width) / 2) - 12;
    if Result.Left < 8 then
      Result.Left := 8;
  end;
end;

function CriaFormularioModal(Classe : TFormClass):TForm;
begin
//  Application.CreateForm(Classe, Objeto);
  Result := Classe.Create(Application);                           //N?o existe.
  Result.BorderIcons := [biSystemMenu];
  Result.Position := poScreenCenter;
  Result.ShowModal;
  Result.Release;
  Result := nil;
end;

function CriaFormularioReferencia(Classe: TFormClass): TForm;
var
  i: integer;
  nArea, nPosicao: Currency;
begin
  for i := 0 to MDIMain.MDIChildCount - 1 do
  begin
    if MDIMain.MDIChildren[i] is Classe then
    begin
      Result := MDIMain.MDIChildren[i];
      Exit;
    end;
  end;

  Result := Classe.Create(Application); //Se n?o existir
  nArea := MDIMain.Height;
  nPosicao := (nArea - Result.Height) / 2 - 50;
  Result.Top := StrToInt(CurrToStr(Round(nPosicao)));
  Result.Left := round((MDIMain.Width - Result.Width) / 2) - 12;
end;

function SaveLogError(Const Tela, Usuario, Descricao, Tipo, Processo: string): integer;
var
  VLogFile: TextFile;
begin
  try
    AssignFile(VLogFile, ExtractFileDir(Application.ExeName)+'\Erros.log');
    if FileExists(ExtractFileDir(Application.ExeName)+'\Erros.log') then
    begin
      Append(VLogFile);
      Writeln(VLogFile,'--------------------------------------------------------------');
      Writeln(VLogFile,'');
    end else
    begin
      Rewrite(VLogFile);
      Writeln(VLogFile,'Omega Sistemas - '+ Application.Title);
      Writeln(VLogFile,'Fone: (44)3624-9785 - E-Mail: falecom@omegasistemas.com.br');
      Writeln(VLogFile,'Rua Dr. Rui Ferraz de Carvalho, n? 4212 11? andar - Sala 1101');
      Writeln(VLogFile,'87.501-250 - Umuarama-PR');
      Writeln(VLogFile,'==============================================================');
      Writeln(VLogFile,'');
    end;
    Writeln(VLogFile,format('Data/Hora............: %s',[DateTimeToStr(Now)]));
    Writeln(VLogFile,format('Tela...........: %s',[Tela]));
    Writeln(VLogFile,format('Usuario..........: %s',[Usuario]));
    Writeln(VLogFile,format('Tipo de Erro...........: %s',[Tipo]));
    Writeln(VLogFile,format('Descri??o..........: %s',[Descricao]));
    Writeln(VLogFile,format('Processo....: %s',[Processo]));
    Writeln(VLogFile,'');
    CloseFile(VLogFile);
    Result := IOResult;
  except
    Result := -1;
  end;
end;

procedure GeraExcecao(Tela, Usuario: String; E: Exception);
begin
  if E is EConvertError then
  begin
    with EConvertError(E) do
      if Pos('date and time', Message) > 0 then
        ShowMessage('Informe uma data v?lida')
      else if Pos('is not a valid time', Message) > 0 then
        ShowMessage('Informe uma hora v?lida')
      else if Pos('is not a valid date', Message) > 0 then
        ShowMessage('Informe uma data v?lida')
      else
        Application.ShowException(E);
  end else if E is EIBError then
  begin
    with EIBError(E) do
      if Pos('FOREIGN KEY', Message) > 0 then
        ShowMessage('A??o n?o permitida! Existem depend?ncias deste registro')
      else if pos('PRIMARY', message) > 0 then
        ShowMessage('J? existe um registro com esse c?digo')
      else if pos('UPDATE FAILED', message) > 0 then
        ShowMessage('Altera??o n?o efetuada')
      else
        Application.ShowException(E);
  end else if E is EIBInterBaseError then
  begin
    with EIBInterBaseError(E) do
      if Pos('FOREIGN KEY', Message) > 0 then
        ShowMessage('A??o n?o permitida! Existem depend?ncias deste registro')
      else if pos('PRIMARY', message) > 0 then
        ShowMessage('J? existe um registro com esse c?digo')
      else if pos('UPDATE FAILED', message) > 0 then
        ShowMessage('Altera??o n?o efetuada')
      else
        Application.ShowException(E);
  end else
    Application.ShowException(E);

  SaveLogError(Tela, Usuario, E.Message, E.ClassName, '');
end;

function CarregaBemVindo: String;
var
  data: TIniFile;
  Arquivo: String;
begin
  if FileExists(ExtractFilePath(Application.ExeName)+'Config.ini') then
  begin
    Arquivo := ExtractFilePath(Application.ExeName)+'Config.ini';
    Data := TiniFile.Create(Arquivo);
    Result := Data.ReadString('Entrada','BemVindo', '');
    Data.Free;
  end;
end;

procedure GravaBemVindo(ExibeBemVindo: String);
var
  data:TIniFile;
  Arquivo: String;
begin
  Arquivo := ExtractFilePath(Application.ExeName)+'Config.ini';
  Data := TIniFile.Create(Arquivo);
  Data.WriteString('Entrada','BemVindo', ExibeBemVindo);
  Data.Free;
end;

procedure CarregaListaSkin(caminho: string; Combobox: TComboBox);
var
  sts: Integer;
  SR: TSearchRec;
  list: Tstringlist;

  procedure AddFile;
  begin
    list.add(copy(sr.name, 1, Length(sr.name)-4));
  end;

begin
  list := Tstringlist.create;
  try
    sts := FindFirst(caminho + '*.skn' , faAnyFile , SR);
    if sts = 0 then begin
        if (SR.Name <> '.') and (SR.Name <> '..') then begin
            if pos('.', SR.Name) <> 0 then
              Addfile;
        end;
        while FindNext(SR) = 0 do begin
            if (SR.Name <> '.') and (SR.Name <> '..') then begin
                if Pos('.', SR.Name) <> 0 then  Addfile;
            end;
        end;
    end ;
    FindClose(SR);
    list.Sort;
    Combobox.items.assign(list);
  finally
    list.free;
  end;
end;

procedure CarregaListaPlugin(caminho: string; Combobox: TComboBox);
var
  sts: Integer;
  SR: TSearchRec;
  list: Tstringlist;

  procedure AddFile;
  begin
    list.add(copy(sr.name, 1, Length(sr.name)-4));
  end;

begin
  list := Tstringlist.create;
  try
    sts := FindFirst(caminho + '*.dll' , faAnyFile , SR);
    if sts = 0 then
    begin
      if (SR.Name <> '.') and (SR.Name <> '..') then
      begin
        if pos('.', SR.Name) <> 0 then
          Addfile;
      end;
      while FindNext(SR) = 0 do
      begin
        if (SR.Name <> '.') and (SR.Name <> '..') then
        begin
          if Pos('.', SR.Name) <> 0 then  Addfile;
        end;
      end;
    end ;
    FindClose(SR);
    list.Sort;
    Combobox.items.assign(list);
  finally
    list.Free;
  end;
end;

function ZeroEsquerda(sTexto: String; iTamanho: Integer): String;
var
  iTamanhoTexto, i: Integer;
  s: String;
begin
  iTamanhoTexto := length(Trim(sTexto));

  for i := 1 To iTamanho - iTamanhoTexto Do
     s := s + '0';

  Result := s + sTexto;
end;

procedure ClicaMouse;
var
  Pt: TPoint;
  Win: HWnd;
  Msg: TMsg;
  FlagMouseDown, FlagMouseUp: DWord;
begin
  FlagMouseDown := MOUSEEVENTF_LEFTDOWN;
  FlagMouseUp := MOUSEEVENTF_LEFTUP;

  { Obt?m o handle da janela que est? sob o cursor }
  Windows.GetCursorPos(Pt);
  Win := Windows.WindowFromPoint(Pt);

  { Inicia o click }
  mouse_event(FlagMouseDown, 0, 0, 0, 0);

  { Processa as mensagens do mouse pertencentes ? janela sob o cursor }
  while PeekMessage(Msg, Win, WM_LBUTTONDOWN, WM_LBUTTONDOWN, PM_REMOVE) do
    DispatchMessage(Msg);

  { Conclui o click }
  mouse_event(FlagMouseUp, 0, 0, 0, 0);
end;

function BuscaCaminho(Arquivo: String) :String;
var
  Path, Drive: String;
begin
  Path  := ExtractFilePath(Arquivo);
  Drive := ExtractFileDrive(Arquivo);
  Result := StringReplace(Path, Drive, '', [rfIgnoreCase]) + ExtractFileName(Arquivo);
end;

function ExisteArquivo(Arquivo, Transmissao, Mono: String) :String;
begin
  Result:='';
  if Mono = 'S' then
  begin
    if FileExists('C:' + Arquivo) then
      Result := 'C:' + Arquivo
    else if FileExists('D:' + Arquivo) then
      Result := 'D:' + Arquivo
    else if FileExists('E:' + Arquivo) then
      Result := 'E:' + Arquivo
    else if FileExists('F:' + Arquivo) then
      Result := 'F:' + Arquivo
  end else
  begin
    if FileExists('\\' + TRANSMISSAO + '\C' + Arquivo) then
      Result := '\\' + TRANSMISSAO + '\C' + Arquivo
    else if FileExists('\\' + TRANSMISSAO + '\D' + Arquivo) then
      Result := '\\' + TRANSMISSAO + '\D' + Arquivo
    else if FileExists('\\' + TRANSMISSAO + '\E' + Arquivo) then
      Result := '\\' + TRANSMISSAO + '\E' + Arquivo
    else if FileExists('\\' + TRANSMISSAO + '\F' + Arquivo) then
      Result := '\\' + TRANSMISSAO + '\F' + Arquivo
  end;
end;

function Diretorio(Pasta, Transmissao, Mono: String) :String;
begin
  if Mono = 'S' then
  begin
    if DirectoryExists('C:' + Pasta) then
      Result := 'C:\' + Pasta
    else if DirectoryExists('D:' + Pasta) then
      Result := 'D:\' + Pasta
    else if DirectoryExists('E:' + Pasta) then
      Result := 'E:\' + Pasta
    else if DirectoryExists('F:' + Pasta) then
      Result := 'F:\' + Pasta
  end else
  begin
    if DirectoryExists('\\' + Transmissao + '\C\' + Pasta) then
      Result := '\\' + Transmissao + '\C\' + Pasta
    else if DirectoryExists('\\' + Transmissao + '\D\' + Pasta) then
      Result := '\\' + Transmissao + '\D\' + Pasta
    else if DirectoryExists('\\' + Transmissao + '\E\' + Pasta) then
      Result := '\\' + Transmissao + '\E\' + Pasta
    else if DirectoryExists('\\' + Transmissao + '\F\' + Pasta) then
      Result := '\\' + Transmissao + '\F\' + Pasta
  end;
end;

function ExecExplorer(OpenAtPath: string; OpenWithExplorer, OpenAsRoot: Boolean): boolean;
//
// Executa o Windows Explorer a partir de uma pasta
// especificada
//
// Requer a unit ShellApi
//
// ex: execExplorer('C:\Temp', True,True);
//
var
s: string;
begin
if OpenWithExplorer then
  begin
  if OpenAsRoot then
  s := ' /e,/root,"' + OpenAtPath + '"'
  else
  s := ' /e,"' + OpenAtPath + '"';
  end
else
  s := '"' + OpenAtPath + '"';
  result := ShellExecute(Application.Handle,PChar('open'),PChar('explorer.exe'),PChar(s),nil,SW_NORMAL) > 32;
end;

procedure AbreWebSite(Endereco : PChar);
begin
 ShellExecute(0, Nil, Endereco, Nil, Nil, SW_NORMAL);
end;

function VersaoSistema(Programa: String) : String;
var
  VerInfoSize: DWORD;
  VerInfo: Pointer;
  VerValueSize: DWORD;
  VerValue: PVSFixedFileInfo;
  Dummy: DWORD;
  V1, V2, V3, V4: Word;
begin
  VerInfoSize := GetFileVersionInfoSize(PChar(programa), Dummy);
  GetMem(VerInfo, VerInfoSize);
  GetFileVersionInfo(PChar(programa), 0, VerInfoSize, VerInfo);
  VerQueryValue(VerInfo, '\', Pointer(VerValue), VerValueSize);
  with VerValue^ do
  begin
    V1 := dwFileVersionMS shr 16;
    V2 := dwFileVersionMS and $FFFF;
    V3 := dwFileVersionLS shr 16;
    V4 := dwFileVersionLS and $FFFF;
  end;
  FreeMem(VerInfo, VerInfoSize);
  result := IntToStr (v1) + '.' + IntToStr (v2) + '.' + IntToStr (v3) + '.' + IntToStr (v4);
end;

function DownloadFile(Source, Dest: string): Boolean;
begin
  try
    Result:= UrlDownloadToFile(nil, PChar(source),PChar(Dest), 0, nil) = 0;
  except
    Result:= False;
  end;
end;

function FileCopy(source,dest: String): Boolean;
  {copia um arquivo de um lugar para outro. Retornando falso em caso de erro}
var
  fSrc,fDst,len: Integer;
  size: Longint;
  buffer: packed array [0..2047] of Byte;
begin
  if source <> dest then
  begin
    fSrc := FileOpen(source,fmOpenRead);
    if fSrc >= 0 then
    begin
      size := FileSeek(fSrc,0,2);
      FileSeek(fSrc,0,0);
      fDst := FileCreate(dest);
      if fDst >= 0 then
      begin
        while size > 0 do
        begin
          len := FileRead(fSrc,buffer,sizeof(buffer));
          FileWrite(fDst,buffer,len);
          size := size - len;
        end;
        FileSetDate(fDst,FileGetDate(fSrc));
        FileClose(fDst);
        FileSetAttr(dest,FileGetAttr(source));
        Result := True;
      end else
      begin
        Result := False;
      end;
      FileClose(fSrc);
    end;
  end;
end;

Function TestaPlaca: Boolean;
{Testa se existe uma placa de som no seu computador}
begin
if WaveOutGetNumDevs > 0 then
  begin
  result := True
  end
else
  begin
  Result := False;
  end;
end;


function Percentdisk(unidade: byte): Integer;
{Retorna a porcentagem de espa?o livre em uma unidade de disco}
var
  A,B, Percentual : longint;
begin
  if DiskFree(Unidade)<> -1 then
  begin
    A := DiskFree(Unidade) div 1024;
    B := DiskSize(Unidade) div 1024;
    Percentual:= round((A / B) * 100);
    result := Percentual;
  end else
  begin
    result := -1;
  end;
end;


function CorrentPrinter :String;
  // Retorna a impressora padr?o do windows
  // Requer a unit printers declarada na clausula uses da unit
var
  Device : array[0..255] of char;
  Driver : array[0..255] of char;
  Port   : array[0..255] of char;
  hDMode : THandle;
begin
  Printer.GetPrinter(Device, Driver, Port, hDMode);
  Result := Device + ' na porta ' + Port;
end;

function NetIsPresent: boolean;
begin
  Result := GetSystemMetrics(SM_NETWORK) <> 0;
end;

Procedure FecharPrograma(Nome: String);
begin
  if not PostMessage(FindWindow(nil, PChar(Nome)), WM_CLOSE,0,0) then
  begin
    showmessage('Finalize o sistema antes de efetuar atualiza??es');
    abort;
  end;
end;


function ExecAndWait(const FileName, Params: string; const WindowState: Word): boolean;
{Exemplo de uso: ExecAndWait('c:\windows\notepad.exe', '', SW_SHOW);}
var
  SUInfo: TStartupInfo;
  ProcInfo: TProcessInformation;
  CmdLine: string;
begin
  { Coloca o nome do arquivo entre aspas. Isto ? necess?rio devido aos espa?os contidos em nomes longos }
  CmdLine := '"' + Filename + '"' + Params;
  FillChar(SUInfo, SizeOf(SUInfo), #0);
  with SUInfo do
  begin
    cb := SizeOf(SUInfo);
    dwFlags := STARTF_USESHOWWINDOW;
    wShowWindow := WindowState;
  end;
  Result := CreateProcess(nil, PChar(CmdLine), nil, nil, false,
  CREATE_NEW_CONSOLE or NORMAL_PRIORITY_CLASS, nil,
  PChar(ExtractFilePath(Filename)), SUInfo, ProcInfo);
  { Aguarda at? ser finalizado }
  if Result then
  begin
    WaitForSingleObject(ProcInfo.hProcess, INFINITE);
    { Libera os Handles }
    CloseHandle(ProcInfo.hProcess);
    CloseHandle(ProcInfo.hThread);
  end;
end;


function TotalMemoria: Memoria;
var
  MemoryStatus: TMemoryStatus;
begin
  MemoryStatus.dwLength:= sizeof(MemoryStatus);
  GlobalMemoryStatus(MemoryStatus);
  Result.Total := IntToStr((MemoryStatus.dwTotalPhys div 1024)div 1000) + ' MBytes';
  Result.Livre := IntToStr((MemoryStatus.dwAvailPhys div 1024)div 1000) + ' MBytes';
end;


procedure DrivesExistentes(Combo: TComboBox);
  { Uso: S := tbDriveLetters; - retorna 'ACD' se existir as unidades
  A:, C: e D: }
var
  Drives: LongWord;
  I: byte;
begin
  Drives := GetLogicalDrives;
  if Drives <> 0 then
  for I := 65 to 90 do
  if ((Drives shl (31 - (I - 65))) shr 31) = 1 then
  Combo.Items.Add(AnsiChar(I));
end;

function NumeroDrive(const Drive: Char): byte;
begin
  if Drive = #0 then
  Result := 0
  else
  Result := Ord(UpCase(Drive)) - 64;
end;


function CoresMonitor : Monitor;
{Retorna a quantidade atual de cores no Windows (16, 256, 65536 = 16 ou 24 bit}
var
  DC:HDC;
  BitsPorPixel: Integer;
begin
  Dc := GetDc(0); // 0 = v?deo
  BitsPorPixel := GetDeviceCaps(Dc,BitsPixel);
  Result.Largura := GetDeviceCaps(Dc, HORZRES);
  Result.Comprimento := GetDeviceCaps(Dc, VERTRES);
  Result.Cores := BitsPorPixel;
end;

Function tira_acento(ca_frase:STRING):String;
Begin
  ca_frase := StringReplace(ca_frase,'?',#133,[rfReplaceAll]);
  ca_frase := StringReplace(ca_frase,'?',#131,[rfReplaceAll]);
  ca_frase := StringReplace(ca_frase,'?',#160,[rfReplaceAll]);
  ca_frase := StringReplace(ca_frase,'?',#126 + #8 + 'a',[rfReplaceAll]);
  ca_frase := StringReplace(ca_frase,'?',#126 + #8 + 'A',[rfReplaceAll]);
  ca_frase := StringReplace(ca_frase,'?',#39 + #8 + 'A',[rfReplaceAll]);
  ca_frase := StringReplace(ca_frase,'?',#143,[rfReplaceAll]);
  ca_frase := StringReplace(ca_frase,'?',#96 + #8 + 'A',[rfReplaceAll]);
  ca_frase := StringReplace(ca_frase,'?',#130,[rfReplaceAll]);
  ca_frase := StringReplace(ca_frase,'?',#136,[rfReplaceAll]) ;
  ca_frase := StringReplace(ca_frase,'?',#94 + #8 + 'E',[rfReplaceAll]);
  ca_frase := StringReplace(ca_frase,'?',#144,[rfReplaceAll]);
  ca_frase := StringReplace(ca_frase,'?',#161,[rfReplaceAll]);
  ca_frase := StringReplace(ca_frase,'?',#39 + #8 + 'I',[rfReplaceAll]);
  ca_frase := StringReplace(ca_frase,'?',#126 + #8 + 'o',[rfReplaceAll]);
  ca_frase := StringReplace(ca_frase,'?',#147,[rfReplaceAll]);
  ca_frase := StringReplace(ca_frase,'?',#162,[rfReplaceAll]);
  ca_frase := StringReplace(ca_frase,'?',#126 + #8 + 'O',[rfReplaceAll]);
  ca_frase := StringReplace(ca_frase,'?',#39 + #8 + 'O',[rfReplaceAll]);
  ca_frase := StringReplace(ca_frase,'?',#94 + #8 + 'O',[rfReplaceAll]);
  ca_frase := StringReplace(ca_frase,'?',#163,[rfReplaceAll]);
  ca_frase := StringReplace(ca_frase,'?',#129,[rfReplaceAll]);
  ca_frase := StringReplace(ca_frase,'?',#39 + #8 + 'U',[rfReplaceAll]);
  ca_frase := StringReplace(ca_frase,'?',#154,[rfReplaceAll]);
  ca_frase := StringReplace(ca_frase,'?',#135,[rfReplaceAll]);
  ca_frase := StringReplace(ca_frase,'?',#128,[rfReplaceAll]);
  ca_frase := StringReplace(ca_frase,'?',#167,[rfReplaceAll]);
  ca_frase := StringReplace(ca_frase,'?',#166,[rfReplaceAll]);
  Result   := ca_frase;
END;

Function  padC( s1:string; s2:char; nlen:integer ):string;
var
  N,INI:INTEGER;
begin
  IF length( s1 ) > NLEN THEN
  BEGIN
    result := COPY(s1,1,NLEN) ;
    Exit;
  END;
  N      := length( s1 ) ;
  INI    := (NLEN div 2) - (N div 2);
  Result := StringOfChar(s2, INI)+S1+StringOfChar(s2, INI)
end;

Function padL( s1:string; s2:char; nlen:integer ):string;
var
  x:string;
begin
  x:=StringOfChar( s2, nlen );
  s1:= TrimLeft( s1 );
  IF length( s1 ) > NLEN THEN
  BEGIN
    result := COPY(s1,1,NLEN) ;
    EXIT;
  END;
  s1:= copy( x, 1, nlen - length( s1 ) ) + s1;
  result := s1 ;
end;

Function  padR( s1:string; s2:char; nlen:integer ):string;
var
  x:string;
begin
  x:=StringOfChar( s2, nlen );
  s1:= TrimRIGHT( s1 );
  IF length( s1 ) > NLEN THEN
  BEGIN
    result := COPY(s1,1,NLEN) ;
    EXIT;
  END;
  s1:= S1+ copy( x, 1, nlen - length( s1 ) );
  result := s1 ;
end;

function Cgc( xCGC:String ):Boolean;
Var
  d1,d4,xx,nCount,fator,resto,digito1,digito2 : Integer;
  Check : String;
begin
  d1 := 0; d4 := 0; xx := 1;
  for nCount := 1 to Length( xCGC )-2 do
  begin
    if Pos( Copy( xCGC, nCount, 1 ), '/-.' ) = 0 then
    begin
      if xx < 5 then fator := 6 - xx else fator := 14 - xx;
      d1 := d1 + StrToInt( Copy( xCGC, nCount, 1 ) ) * fator;
      if xx < 6 then fator := 7 - xx else fator := 15 - xx;
      d4 := d4 + StrToInt( Copy( xCGC, nCount, 1 ) ) * fator;
      xx := xx+1;
    end;
  end;
  resto := (d1 mod 11);
  if resto < 2 then
    digito1 := 0
  else
    digito1 := 11 - resto;
  d4 := d4 + 2 * digito1;
  resto := (d4 mod 11);
  if resto < 2 then
    digito2 := 0
  else
    digito2 := 11 - resto;
  Check := IntToStr(Digito1) + IntToStr(Digito2);
//  if Check <> Right( xCGC, 2 ) then
//    Result := False
//  else
//    Result := True;
end;

function Cpf( xCPF:String ):Boolean;
Var
  d1,d4,xx,nCount,resto,digito1,digito2 : Integer;
  Check : String;
begin
  d1 := 0; d4 := 0; xx := 1;
  for nCount := 1 to Length( xCPF )-2 do
  begin
    if Pos( Copy( xCPF, nCount, 1 ), '/-.' ) = 0 then
    begin
      d1 := d1 + ( 11 - xx ) * StrToInt( Copy( xCPF, nCount, 1 ) );
      d4 := d4 + ( 12 - xx ) * StrToInt( Copy( xCPF, nCount, 1 ) );
      xx := xx+1;
    end;
  end;
  resto := (d1 mod 11);
  if resto < 2 then
    digito1 := 0
  else
    digito1 := 11 - resto;
  d4 := d4 + 2 * digito1;
  resto := (d4 mod 11);
  if resto < 2 then
    digito2 := 0
  else
    digito2 := 11 - resto;
  Check := IntToStr(Digito1) + IntToStr(Digito2);
//  if Check <> Right( xCPF, 2 ) then
//    Result := False
//  else
//    Result := True;
end;

function FileVerInfo(const FileName: string): FileInf;
const
  Key: array[1..9] of string =('CompanyName', 'FileDescription', 'FileVersion',
    'InternalName', 'LegalCopyright', 'OriginalFilename', 'ProductName',
    'ProductVersion', 'Comments');
var
  Dummy : Cardinal; // THandle;
  BufferSize, Len : Cardinal; // Integer;

  Buffer : PChar;
  LoCharSet, HiCharSet : Word;
  Translate, Return : Pointer;
  StrFileInfo, Flags : string;
  i : Byte;
begin
  If not FileExists(FileName) then
  begin
    showmessage('Arquivo n?o encontrado');
    exit;
  end;

  {$IFDEF VER140} // D6

    BufferSize := GetFileVersionInfoSize(PChar(FileName), Dummy);

  {$ELSE}

    BufferSize := GetFileVersionInfoSize(PWideChar(FileName), Dummy);

  {$ENDIF}



  if BufferSize <> 0 then
  begin
    GetMem(Buffer, Succ(BufferSize));
    try
      if GetFileVersionInfo(PChar(FileName), 0, BufferSize,Buffer) then
      begin
        if VerQueryValue(Buffer, '\VarFileInfo\Translation', Translate, UINT(Len)) then
        begin
          LoCharSet := LoWord(Longint(Translate^));
          HiCharSet := HiWord(Longint(Translate^));
          for i := 1 to 9 do
          begin
            StrFileInfo := Format('\StringFileInfo\0%x0%x\%s',[LoCharSet, HiCharSet, Key[i]]);
            if VerQueryValue(Buffer,PChar(StrFileInfo), Return,UINT(Len)) then
            begin
              case i of
                1: Result.Empresa := PChar(Return);
                2: Result.Descricao := PChar(Return);
                3: Result.VersaoArquivo := PChar(Return);
                4: Result.NomeInterno := PChar(Return);
                5: Result.Copyrigh := PChar(Return);
                6: Result.NomeOriginal := PChar(Return);
                7: Result.Produto := PChar(Return);
                8: Result.VersaoProduto := PChar(Return);
                9: Result.Comentarios := PChar(Return);
              end;
            end;
          end;
        end;
      end;
    finally
      FreeMem(Buffer, Succ(BufferSize));
    end;
  end;
end;

FUNCTION TiraAcento(ca_frase:STRING): STRING;
BEGIN
  ca_frase := StringReplace(ca_frase,'?','a',[rfReplaceAll]);
  ca_frase := StringReplace(ca_frase,'?','a',[rfReplaceAll]);
  ca_frase := StringReplace(ca_frase,'?','a',[rfReplaceAll]);
  ca_frase := StringReplace(ca_frase,'?','a',[rfReplaceAll]);
  ca_frase := StringReplace(ca_frase,'?','A',[rfReplaceAll]);
  ca_frase := StringReplace(ca_frase,'?','A',[rfReplaceAll]);
  ca_frase := StringReplace(ca_frase,'?','A',[rfReplaceAll]);
  ca_frase := StringReplace(ca_frase,'?','A',[rfReplaceAll]);
  ca_frase := StringReplace(ca_frase,'?','e',[rfReplaceAll]);
  ca_frase := StringReplace(ca_frase,'?','e',[rfReplaceAll]) ;
  ca_frase := StringReplace(ca_frase,'?','E',[rfReplaceAll]);
  ca_frase := StringReplace(ca_frase,'?','E',[rfReplaceAll]);
  ca_frase := StringReplace(ca_frase,'?','i',[rfReplaceAll]);
  ca_frase := StringReplace(ca_frase,'?','I',[rfReplaceAll]);
  ca_frase := StringReplace(ca_frase,'?','o',[rfReplaceAll]);
  ca_frase := StringReplace(ca_frase,'?','o',[rfReplaceAll]);
  ca_frase := StringReplace(ca_frase,'?','o',[rfReplaceAll]);
  ca_frase := StringReplace(ca_frase,'?','O',[rfReplaceAll]);
  ca_frase := StringReplace(ca_frase,'?','O',[rfReplaceAll]);
  ca_frase := StringReplace(ca_frase,'?','O',[rfReplaceAll]);
  ca_frase := StringReplace(ca_frase,'?','u',[rfReplaceAll]);
  ca_frase := StringReplace(ca_frase,'?','u',[rfReplaceAll]);
  ca_frase := StringReplace(ca_frase,'?','U',[rfReplaceAll]);
  ca_frase := StringReplace(ca_frase,'?','U',[rfReplaceAll]);
  ca_frase := StringReplace(ca_frase,'?','c',[rfReplaceAll]);
  ca_frase := StringReplace(ca_frase,'?','C',[rfReplaceAll]);
  ca_frase := StringReplace(ca_frase,'?','o',[rfReplaceAll]);
  ca_frase := StringReplace(ca_frase,'?','a',[rfReplaceAll]);

  RESULT:= ca_frase;
END;

Function QuebraLinha(Texto: String; Tamanho: Integer): String;
var
  I : Integer;
  T : String;
begin
  T := '';

  if (Length(Texto)) < Tamanho then   // se o tamanho do texto for menor que a largura do bot?o
  begin
    Result := Texto;
  end else
  begin
    for I := 1 to (Length(Texto) div Tamanho) do //percorre todo o texto cortando em peda?os de acordo com a largura do bot?o
    begin
      T := T + Trim(copy(Texto, 1, Tamanho)) + '...' + #13; //Copia o peda?o referente ao tamanho do bot?o, caso seja maior preeche o restante com trez pontos.
      Texto := copy(Texto, Tamanho + 1, Length(Texto) - Tamanho); //copia o resto da string;
      if pos(' ', texto) > 0 then
      begin
        Texto := Trim(copy(Texto, pos(' ', Texto) + 1, Length(Texto))) //se houver mais alguma palavra ap?s a anterior aponta direto para o in?cio dela
      end else
      begin
        Result := T; // caso contr?rio abandona o processo;
        Break;
      end;
    end;
    Result := T;
  end;
end;

Function QuebraLinhaParcial(Texto: String; Tamanho: Integer): String; //Para cortar a palavra e colocar "..." no final
begin
  if (Length(Texto)) < Tamanho then   // se o tamanho do texto for menor que a largura do bot?o
  begin
    Result := Texto;
  end else
  begin
    Result := copy(Texto, 1, Tamanho - 3) + '...';
  end;
end;

function CPUSpeed: Double;
const
  DelayTime = 500; // divide o tempo em ms
var
  TimerHi, TimerLo: DWORD;
  PriorityClass, Priority: Integer;
begin
  PriorityClass := GetPriorityClass(GetCurrentProcess);
  Priority := GetThreadPriority(GetCurrentThread);
  SetPriorityClass(GetCurrentProcess, REALTIME_PRIORITY_CLASS);
  SetThreadPriority(GetCurrentThread, THREAD_PRIORITY_TIME_CRITICAL);

  Sleep(10);

  asm
    dw 310Fh // rdtsc
    mov TimerLo, eax
    mov TimerHi, edx
  end;

  Sleep(DelayTime);

  asm
    dw 310Fh // rdtsc
    sub eax, TimerLo
    sbb edx, TimerHi
    mov TimerLo, eax
    mov TimerHi, edx
  end;

  SetThreadPriority(GetCurrentThread, Priority);
  SetPriorityClass(GetCurrentProcess, PriorityClass);
  Result := TimerLo / (1000.0 * DelayTime);
end;

Function VerificaHD: String;
var
  Serial:DWord;
  DirLen,Flags: DWord;
  DLabel : Array[0..11] of Char;
begin
  Try
    GetVolumeInformation(PChar('C:\'),dLabel,12,@Serial,DirLen,Flags,nil,0);
    Result := IntToHex(Serial,8);
  Except
    Result :='';
  end;
end;

Function SecToDuracao(Segundos: Integer): String;
var
  minuto, segundo: String;
begin
  minuto:=floattostr((round(Segundos))div 60);
  segundo:=floattostr((round(Segundos))mod 60);
  Result := PadL(minuto, '0', 2) + ':' + PadL(segundo, '0', 2);
end;

Function SecToDuracaoHora(Segundos: Integer): String;
var
  resto: real;
  hora, minuto, segundo: String;
begin
  hora := floattostr((round(Segundos))div 3600);
  resto := (Segundos mod 3600);
  minuto:=floattostr((round(resto))div 60);
  segundo:=floattostr((round(resto))mod 60);
  Result := PadL(hora, '0', 2) + ':' + PadL(minuto, '0', 2) + ':' + PadL(segundo, '0', 2);
end;

Function SecToDuracaoDia(Segundos: Integer): ConverteSegundos;
begin
  Result.Dia := padL(floattostr((round(Segundos))div 86400), '0', 2);
  Result.resto := SecToDuracaoHora(Segundos mod 86400);
end;

Function DuracaoToSecHora(Duracao: String): Integer;
var
  hora, minuto, segundo: Integer;
begin
  hora := StrToInt(Duracao[1]+Duracao[2]);
  minuto := StrToInt(Duracao[4]+Duracao[5]);
  segundo := StrToInt(Duracao[7]+Duracao[8]);

  Result := ((hora * 60) * 60) + (minuto * 60) + segundo;
end;

Function DuracaoToSec(Duracao: String): Integer;
var
  minuto, segundo: Integer;
begin
  Duracao := StringReplace(Duracao, '.', ',', [rfReplaceAll]);
  minuto := StrToInt(Copy(Duracao, 1, Pos(':',Duracao)-1));
  segundo := Round(StrToFloat(Copy(Duracao, Pos(':',Duracao)+1, (length(Duracao) - Pos(':',Duracao)))));

  Result := (minuto * 60) + segundo;
end;

function DuracaoToMilSec(sDuracao: String): Double;
var
  iMinuto: Integer;
  iSegundo: Double;
begin
  sDuracao := StringReplace(sDuracao, '.', ',', [rfReplaceAll]);
  iMinuto := StrToInt(Copy(sDuracao, 1, Pos(':', sDuracao) - 1));
  iSegundo := StrToFloat(Copy(sDuracao, Pos(':', sDuracao) + 1, (Length(sDuracao) - Pos(':', sDuracao))));
  Result := ((iMinuto * 60) + iSegundo) * 1000;
end;

function DeleteFolder(Folder: String; PouparFolder: Boolean): Boolean;
var
  r: TshFileOpStruct;
begin
  Result := False;
  if not DirectoryExists(Folder) then
  begin
    Result := True;
    Exit;
  end;
  if PouparFolder then
    Folder := Folder + ' *.* '
  else
    if Folder[Length(Folder)] = ' \ ' then
  Delete(Folder,Length(Folder), 1);
  FillChar(r, SizeOf(r), 0);
  r.wFunc := FO_DELETE;
  r.pFrom := PChar(Folder);
  r.fFlags := FOF_ALLOWUNDO or FOF_NOCONFIRMATION;
  Result := ((ShFileOperation(r) = 0) and (not r.fAnyOperationsAborted));
end;

procedure DeletaArquivosPasta(Pasta: String);
var
  SR: TSearchRec;
  I: integer;
begin
  I := FindFirst(Pasta+'*.*', faAnyFile, SR);
  while I = 0 do
  begin
    if (SR.Attr and faDirectory) <> faDirectory then
      if not DeleteFile(Pasta + SR.Name) then
        ShowMessage('N?o foi poss?vel excluir '+SR.Name);
      I := FindNext(SR);
  end;
end;

procedure CopyDirToDir(const cFrom, cTo : string);
var
  OpStruc : TSHFileOpStruct;
  frombuf, tobuf : array[0..128] of Char;
begin
  FillChar(frombuf, Sizeof(frombuf), 0);
  FillChar(tobuf, Sizeof(tobuf), 0);
  StrPCopy(frombuf, cFrom);
  StrPCopy(tobuf, cTo);
  with OpStruc do
  begin
    Wnd := Application.Handle;
    wFunc := FO_COPY;
    pFrom := @frombuf;
    pTo := @tobuf;
    fFlags := FOF_NOCONFIRMATION or FOF_RENAMEONCOLLISION;
    fAnyOperationsAborted := False;
    hNameMappings := nil;
    lpszProgressTitle := nil;
  end; // with
  ShFileOperation(OpStruc);
end; // CopyDir

procedure MoveDirToDir(const cFrom, cTo : string);
var
  OpStruc : TSHFileOpStruct;
  frombuf, tobuf : array[0..128] of Char;
begin
  FillChar(frombuf, Sizeof(frombuf), 0);
  FillChar(tobuf, Sizeof(tobuf), 0);
  StrPCopy(frombuf, cFrom);
  StrPCopy(tobuf, cTo);
  with OpStruc do
  begin
    Wnd := Application.Handle;
    wFunc := FO_MOVE;
    pFrom := @frombuf;
    pTo := @tobuf;
    fFlags := FOF_NOCONFIRMATION or FOF_RENAMEONCOLLISION;
    fAnyOperationsAborted := False;
    hNameMappings := nil;
    lpszProgressTitle := nil;
  end; // with
  ShFileOperation(OpStruc);
end; // CopyDir

function DriveLetra: string;
  { Uso: S := tbDriveLetters; - retorna 'ACD' se existir as unidades
  A:, C: e D: }
var
  Drives: LongWord;
  I: byte;
begin
  Result := '';
  Drives := GetLogicalDrives;
  if Drives <> 0 then
  for I := 65 to 90 do
  if ((Drives shl (31 - (I - 65))) shr 31) = 1 then
  Result := Result + AnsiChar(I);
end;

Function TipoDrive(Drive:Char):String;
Const
  Drive_Removable = 2;
  Drive_Fixed = 3;
  Drive_Remote = 4;
  Drive_CdRom = 5;
  Drive_RamDisk = 6;
var
  Tipo: byte;
begin
  Tipo := GetDriveType(PChar(Drive + ':\'));
  Case Tipo of
    0: Result := 'Indeterminado';
    1: Result := 'Inexistente ';
    2: Result := 'Remov?vel';
    3: Result := 'Fixo';
    4: Result := 'Rede';
    5: Result := 'CD-ROM';
    6: Result := 'RAM Disk';
  else
    Result := ' Erro';
  end;
end;

function TamanhoArquivo(Arquivo: string): Integer;
begin
  with TFileStream.Create(Arquivo, fmOpenRead or fmShareExclusive) do
  try
    Result := Size;
  finally
    Free;
  end;
end;

function EnDecryptString(StrValue: String; Chave: Word) : String;
var
  I, Tam: Integer;
  OutValue: String;
  OutValueAnsi, StrValueAnsi: AnsiString;
begin
  {$IFDEF VER140}
    // D6
    OutValue := '';
    for I := 1 to Length(StrValue) do
      OutValue := OutValue + Char(not(Ord(StrValue[I]) - Chave));
    Result := OutValue;
  {$ELSE}
    // XE8 migracao 09/06/2016
    StrValueAnsi := StrValue;
    OutValueAnsi := '';
    for I := 1 to Length(StrValueAnsi) do
      OutValueAnsi := OutValueAnsi + AnsiChar(not(Ord(StrValueAnsi[I]) - Chave));
    Result := OutValueAnsi;
  {$ENDIF}
end;

function EncodeDecode(const Str: AnsiString): AnsiString;
const
  Id: AnsiString = '^%12h2DBC3f41~~#6093fn7mY7eujEhbFD3DZ|R9aSDVvUY@dk79*7a-|-  Q';
var
  I: Integer;
begin
  Result := Str;
  for I := 1 to Length(Result) do
    Result[I] := AnsiChar(ord(Result[I]) xor not (ord(Id[I mod Length (Id) + 1])));
end;

function TiraE(mcaption : String) : String;
Var
  i : Integer;
  mvolta : String;
begin
  mvolta := '';

  For i := 1 to Length(mcaption) Do
  Begin
    If mcaption[i] <> '&' Then
      mvolta := mvolta + mcaption[i]
  End;
  Result := mvolta;
end;


function BuscaValor(Database: TIBDatabase; Tabela, CampoRetorno, CampoCodigo: String; VlrCampoCodigo: Integer; FiltroExtra: String = ''): String;
var
  Q: TIBQuery;
begin
  Q := TIBQuery.Create(nil);
  try
    Q.Database := Database;
    Q.SQL.Add('SELECT ' + CampoRetorno + ' FROM ' + Tabela);
    Q.SQL.Add('WHERE ' + CampoCodigo + ' = ' + IntToStr(VlrCampoCodigo) + FiltroExtra);
    Q.Open;
    if not Q.IsEmpty then
      Result := Q.Fields[0].AsString
    else
      Result := '';
  finally
    Q.Free;
  end;
end;

procedure Split(const Delimiter: Char; Input: string; const Strings: TStrings);
begin
   Assert(Assigned(Strings)) ;
   Strings.Clear;
   Strings.Delimiter := Delimiter;
   Strings.DelimitedText := Input;
end;

procedure CopiarArquivo(Origem, Destino: String);
var
  Dados: TSHFileOpStruct;
begin
  FillChar(Dados,SizeOf(Dados), 0);
  with Dados do
  begin
    wFunc := FO_COPY;
    pFrom := PChar(Origem);
    pTo := PChar(Destino);
    fFlags:= FOF_SILENT;
  end;
  SHFileOperation(Dados);
end;

function MoverArquivo(Origem, Destino: String): Boolean;
var
  Dados: TSHFileOpStruct;
begin
  FillChar(Dados,SizeOf(Dados), 0);
  with Dados do
  begin
    wFunc := FO_MOVE;
    pFrom := PChar(Origem);
    pTo := PChar(Destino);
    fFlags:= FOF_SILENT or FOF_NOCONFIRMATION or FOF_FILESONLY;
  end;
  Result := SHFileOperation(Dados) = 0;
end;

Function AjustaString(Str:String):String;
var
  Antes, s:String;
  x:Integer;
Begin
  s:='';  Str := UpperCase(Str);
  Antes := Str ;
  For x:=1 to Length(Antes) do
  begin
    If Antes[X] in ['?','?','?','?','?','?','?','?','?','?','?','?','?','?','?','?','?','?','?','?','?','?','?','?','?','?','?','?','?','?','?','?'] then
      S:= S + '_'
    else
      S:= S + Antes[X];
  end;
  Result := S;
End;

Function AutoCompletar(Database: TIBDatabase; Campo, Tabela : ShorTString ; TextoBusca : TDBEdit; IsLista: Boolean; Lista: TListBox ) : ShortString;
var
  Q: TIBQuery;
begin
  if (NOR_SET <> 0) and (NOR_SET <> 1) then
    NOR_SET := 0;

  if (Trim(TextoBusca.Text)='') or (NOR_SET=0) then
  begin
    Result:='';
    exit;
  end;

  Q := TIBQuery.Create(Application);
  try
    Q.Database := Database;
    Q.SQL.add('Select distinct('+Campo+') From '+Tabela+' Where '+Campo+' like '+#39+''+Copy(TextoBusca.Text,1,TextoBusca.SelStart)+'%'+#39);
    Q.SQL.add('Order by '+Campo);
    Q.Open;
    result := copy(TextoBusca.text,0,TextoBusca.SelStart) + copy(Q.Fieldbyname(CAMPO).AsString, TextoBusca.SelStart + 1,255);
    if isLista then
    begin
      Q.First;
      Lista.Items.Clear;
      While not Q.Eof do
      begin
        Lista.Items.Add(Q.fieldbyname(Campo).AsString);
        Q.Next;
      end;
    end;
  finally
    Q.Free;
  end;

  if NOR_SET=0 then
    NOR_SET:=1
  else
    NOR_SET:=0;
end;

function ContaArquivos(Dir: String): Integer;
var
  SR: TSearchRec;
  Cont,I: integer;
begin
  Cont := 0;
  I := FindFirst(Dir + '*.MP3', faAnyFile, SR);
  while I = 0 do
  begin
    if (SR.Attr and faDirectory) <> faDirectory then
    begin
      inc(Cont);
      I := FindNext(SR);
    end;
  end;
  I := FindFirst(Dir + '*.WAV', faAnyFile, SR);
  while I = 0 do
  begin
    if (SR.Attr and faDirectory) <> faDirectory then
    begin
      inc(Cont);
      I := FindNext(SR);
    end;
  end;
  Result := Cont;
end;

function LocalizaWMA(Dir: String): Boolean;
var
  SR: TSearchRec;
  Cont,I: integer;
begin
  Cont := 0;
  I := FindFirst(Dir + '*.WMA', faAnyFile, SR);
  while I = 0 do
  begin
    if (SR.Attr and faDirectory) <> faDirectory then
    begin
      inc(Cont);
      I := FindNext(SR);
    end;
  end;
  Result := Cont > 0;
end;

function LocalizaOGG(Dir: String): Boolean;
var
  SR: TSearchRec;
  Cont,I: integer;
begin
  Cont := 0;
  I := FindFirst(Dir + '*.OGG', faAnyFile, SR);
  while I = 0 do
  begin
    if (SR.Attr and faDirectory) <> faDirectory then
    begin
      inc(Cont);
      I := FindNext(SR);
    end;
  end;
  Result := Cont > 0;
end;

function CarregaTemperatura: String;
var
  Txt     : TextFile;
  Entrada, TMP : String;
begin
  AssignFile(Txt, ExtractFilePath(Application.ExeName)+'Temperatura.html');
  Reset(Txt);

  while not Eoln(Txt) do
  begin
    ReadLn(Txt,Entrada);
    if copy(entrada, 01, 11) = 'Temperature' then
    begin
      TMP := Trim(StringReplace(copy(entrada, 13, 4), '&', '', [rfReplaceAll]));
      TMP := StringReplace(TMP, ',', '', [rfReplaceAll]);
      TMP := StringReplace(TMP, 'd', '', [rfReplaceAll]);
      if TMP <> 'N/A' then
        Result := TMP;
    end;
  end;
  CloseFile(Txt);
end;

Function WinVersion: string;
var
  VersionInfo: TOSVersionInfo;
begin
  VersionInfo.dwOSVersionInfoSize := SizeOf(VersionInfo);

  {$IFDEF VER140} // D6
    GetVersionExA(VersionInfo);
  {$ENDIF}

  with VersionInfo do
  begin
    case dwPlatformid of
      0 : begin
            result := 'Windows 3.11';
          end;

      1 : begin
            case dwMinorVersion of
              0 : result := 'Windows 95';
              10: begin
                    if ( szCSDVersion[ 1 ] = 'A' ) then
                      Result :='Windows 98 SE'
                    else
                      Result := 'Windows 98';
                  end;
              90 : result := 'Windows Millenium';
            else
              result := 'Vers?o Desconhecida';
            end;
          end;

      2 : begin
            case dwMajorVersion of
              3 : result := 'Windows NT ' + IntToStr(dwMajorVersion) + '.' + IntToStr(dwMinorVersion);
              4 : result := 'Windows NT ' + IntToStr(dwMajorVersion) + '.' + IntToStr(dwMinorVersion);
              5 : begin
                    case dwMinorVersion of
                      0 : result := 'Windows 2000';
                      1 : result := 'Windows XP';
                    end;
                  end;
            6 : result := 'Windows Vista';
            7 : result := 'Windows 7';
            else
               result := 'Vers?o Desconhecida';
            end;
            if szCSDVersion <> '' then
              result := result + ' ' + szCSDVersion;
          end;
    else
      result := 'Plataforma Desconhecida';
    end;
    result := result + ' Build: ' + IntToStr(Loword(dwBuildNumber)) ;
  end;
end;

function RemoveCaracterInvalido(sTexto: String): String;
begin
  sTexto := StringReplace(sTexto, '\', ' ', [rfReplaceAll]);
  sTexto := StringReplace(sTexto, '/', ' ', [rfReplaceAll]);
  sTexto := StringReplace(sTexto, ':', ' ', [rfReplaceAll]);
  sTexto := StringReplace(sTexto, '*', ' ', [rfReplaceAll]);
  sTexto := StringReplace(sTexto, '?', ' ', [rfReplaceAll]);
  sTexto := StringReplace(sTexto, '"', ' ', [rfReplaceAll]);
  sTexto := StringReplace(sTexto, '<', ' ', [rfReplaceAll]);
  sTexto := StringReplace(sTexto, '>', ' ', [rfReplaceAll]);
  sTexto := StringReplace(sTexto, '|', ' ', [rfReplaceAll]);
  Result := sTexto;
end;

function RemoveCaracterFone(sTexto: String): String;
begin
  sTexto := StringReplace(sTexto, '(', '', [rfReplaceAll]);
  sTexto := StringReplace(sTexto, ')', '', [rfReplaceAll]);
  sTexto := StringReplace(sTexto, '-', '', [rfReplaceAll]);
  sTexto := StringReplace(sTexto, ' ', '', [rfReplaceAll]);
  sTexto := StringReplace(sTexto, '+', '', [rfReplaceAll]);
  Result := sTexto;
end;


function CriptografiaMD5(sTexto: String): String;
begin
  Result := MD5Print(MD5String(sTexto));
end;

function VerificaTeclaConsulta(pStrTecla: Char): Boolean;
begin
  if not(pStrTecla in ['0'..'9','A'..'Z','a'..'z',',','.',':',';','/','?','[','{','-','_','=',
        '+','}',']', '?','?','!', '@','#','$','%','?','&','*','(',')','"','%']) and (Word(pStrTecla) <> VK_SPACE) then
    Result := False
  else
    Result := True;
end;

function ChamarTelaConsulta(Classe: TFormClass; pStrTecla: Char = ' '; pBlnAbrir: Boolean = True): TForm;
var
  iCont: Integer;
  nPosicao: Real;
  onChangeCampo: TNotifyEvent;
begin
  VarSubTela := True;
  Result := Classe.Create(Application);
  Result.BorderIcons := [biSystemMenu];
  Result.FormStyle := fsNormal;
  Result.Visible := False;
  nPosicao := ((MDIMain.Height - Result.Height) / 2) + 35;
  Result.Top := StrToInt(CurrToStr(Round(nPosicao)));

  if (pStrTecla <> ' ') then
  begin
    for iCont := 0 to Result.ComponentCount - 1 do
    begin
      if (UpperCase(Result.Components[iCont].Name) = UpperCase('EdPesquisa')) then
      begin
        onChangeCampo := TEdit(Result.Components[iCont]).OnChange;
        TEdit(Result.Components[iCont]).OnChange := nil; //Retirando o onChange para n?o executar duas vezes
        TEdit(Result.Components[iCont]).Text := pStrTecla;
        TEdit(Result.Components[iCont]).OnChange := onChangeCampo;
        Break;
      end;
    end;
  end;

  if pBlnAbrir then
    Result.ShowModal;
end;

procedure RetiraReadOnlyArquivo(sArquivo: String);
var
 S:TSearchRec;
begin
  try
    if (FindFirst(sArquivo, faAnyFile-faDirectory, S) = 0) then
    begin
      if (S.Attr and SysUtils.faReadOnly) > 0 then
        SetFileAttributes(PChar(sArquivo), FILE_ATTRIBUTE_NORMAL);
    end;
    FindClose(S)
  except
  end;
end;

function RetornaFiltroSqlPerfil(BancoDados: TIBDatabase; pStrCondicaoSql: String): String;
var
  sSqlOriginal, sCondicao, sAux, sOperador, sAno, sRetorno, sCondicaoOriginal: String;
  iAnoInicio, iAnoFim: Integer;
  queryAux: TIBQuery;
begin
  sSqlOriginal := pStrCondicaoSql;
  sCondicao := sSqlOriginal;

  while Pos('TB_CLASSIFICACAOMUSICAL', sCondicao) > 0 do
  begin
    sRetorno := '';
    sCondicao := Copy(sCondicao, Pos('TB_CLASSIFICACAOMUSICAL', sCondicao), Length(sCondicao));
    sAux := Copy(sCondicao, 0, Pos(')', sCondicao) - 1);
    sCondicaoOriginal := sAux;
    sAux := Copy(sAux, 35, Length(sAux));
    sOperador := Trim(Copy(sAux, 0, Pos('''', sAux) - 1));
    sAux := Trim(Copy(sAux, Pos(sOperador, sAux) + Length(sOperador), Length(sAux)));
    sCondicao := Copy(sCondicao, Pos(sAux, sCondicao), Length(sCondicao));

    queryAux := TIBQuery.Create(nil);
    try
      with queryAux do
      begin
        Database := BancoDados;
        SQL.Add('SELECT Cla_AnoInicio, Cla_AnoFim FROM Tb_ClassificacaoMusical');
        SQL.Add('WHERE Cla_Codigo = ' + sAux);
        Open;
        First;
        sAux := '';
        while not Eof do
        begin
          DateTimeToString(sAno, 'YYYY', Date);
          iAnoInicio := StrToInt(sAno) - FieldByName('Cla_AnoInicio').AsInteger;
          iAnoFim := StrToInt(sAno) - FieldByName('Cla_AnoFim').AsInteger;
          if sOperador = '=' then
            sAux := sAux + '(Tb_Musicas.Mus_Ano <= ' + IntToStr(iAnoInicio) + ' AND Tb_Musicas.Mus_Ano >= ' + IntToStr(iAnoFim) + ')'
          else
            sAux := sAux + '(NOT(Tb_Musicas.Mus_Ano <= ' + IntToStr(iAnoInicio) + ' AND Tb_Musicas.Mus_Ano >= ' + IntToStr(iAnoFim) + '))';
          Next;
        end;
        if sRetorno = '' then
          sRetorno := sRetorno + sAux
        else
          sRetorno := sRetorno + ' OR ' + sAux;
      end;
      sSqlOriginal := StringReplace(sSqlOriginal, sCondicaoOriginal, sRetorno, [rfReplaceAll]);
    finally
      queryAux.Free;
    end;
  end;

  Result := sSqlOriginal;
end;

function SerialFisicoHD: String; //Get first IDE harddisk serial number
const
  IDENTIFY_BUFFER_SIZE = 512; 
type 
  TIDERegs = packed record 
    bFeaturesReg: BYTE;    //Used for specifying SMART "commands".
    bSectorCountReg: BYTE; //IDE sector count register
    bSectorNumberReg: BYTE;//IDE sector number register
    bCylLowReg: BYTE;      //IDE low order cylinder value
    bCylHighReg: BYTE;     //IDE high order cylinder value
    bDriveHeadReg: BYTE;   //IDE drive/head register
    bCommandReg: BYTE;     //Actual IDE command.
    bReserved: BYTE;       //reserved for future use.  Must be zero.
  end;

  TSendCmdInParams = packed record
    cBufferSize: DWORD;    //Buffer size in bytes
    irDriveRegs: TIDERegs; //Structure with drive register values.
    bDriveNumber: BYTE;    //Physical drive number to send command to (0,1,2,3).
    bReserved: Array[0..2] of Byte;
    dwReserved: Array[0..3] of DWORD;
    bBuffer: Array[0..0] of Byte; //Input buffer.
  end;
  
  TIdSector = packed record 
    wGenConfig: Word;
    wNumCyls: Word;
    wReserved: Word;
    wNumHeads: Word;
    wBytesPerTrack: Word;
    wBytesPerSector: Word;
    wSectorsPerTrack: Word;
    wVendorUnique: Array[0..2] of Word;
    sSerialNumber: Array[0..19] of CHAR;
    wBufferType: Word;
    wBufferSize: Word;
    wECCSize: Word;
    sFirmwareRev: Array[0..7] of Char;
    sModelNumber: Array[0..39] of Char;
    wMoreVendorUnique: Word;
    wDoubleWordIO: Word;
    wCapabilities: Word;
    wReserved1: Word;
    wPIOTiming: Word;
    wDMATiming: Word;
    wBS: Word;
    wNumCurrentCyls: Word;
    wNumCurrentHeads: Word;
    wNumCurrentSectorsPerTrack: Word;
    ulCurrentSectorCapacity: DWORD;
    wMultSectorStuff: Word;
    ulTotalAddressableSectors: DWORD;
    wSingleWordDMA: Word;
    wMultiWordDMA: Word;
    bReserved: Array[0..127] of Byte;
  end;
  
  PIdSector = ^TIdSector; 
  TDriverStatus = packed record 
    bDriverError: Byte; //Error code from driver, or 0 if no error.
    bIDEStatus: Byte; //Contents of IDE Error register. Only valid when bDriverError is SMART_IDE_ERROR.
    bReserved: Array[0..1] of Byte;
    dwReserved: Array[0..1] of DWORD; 
  end;
  
  TSendCmdOutParams = packed record 
    cBufferSize: DWORD; //Size of bBuffer in bytes
    DriverStatus: TDriverStatus; //Driver status structure.
    bBuffer: Array[0..0] of Byte; //Buffer of arbitrary length in which to store the data read from the drive.
  end; 

var
  hDevice: THandle;
  cbBytesReturned: DWORD;
  SCIP: TSendCmdInParams;
  aIdOutCmd: Array [0..(SizeOf(TSendCmdOutParams) + IDENTIFY_BUFFER_SIZE - 1) - 1] of Byte;
  IdOutCmd: TSendCmdOutParams absolute aIdOutCmd;

  procedure _ChangeByteOrder(var Data; Size: Integer); 
  var
    ptr : PChar;
    iCont : Integer;
    c : Char; 
  begin 
    ptr := @Data; 
    for iCont := 0 to ((Size shr 1) - 1) do
    begin 
      c := ptr^; 
      ptr^ := (ptr + 1)^; 
      (ptr + 1)^ := c;
      Inc(ptr, 2); 
    end; 
  end;

begin 
  Result := ''; // return empty string on error 
  if SysUtils.Win32Platform = VER_PLATFORM_WIN32_NT then // Windows NT, Windows 2000 
  begin
    hDevice := CreateFile('\\.\PhysicalDrive0', GENERIC_READ or GENERIC_WRITE, FILE_SHARE_READ or FILE_SHARE_WRITE, nil, OPEN_EXISTING, 0, 0); //warning! change name for other drives: ex.: second drive '\\.\PhysicalDrive1\'
  end 
  else // Windows 95 OSR2, Windows 98 
    hDevice := CreateFile('\\.\SMARTVSD', 0, 0, nil, CREATE_NEW, 0, 0);

  if hDevice = INVALID_HANDLE_VALUE then
    Exit;

  try 
    FillChar(SCIP, SizeOf(TSendCmdInParams) - 1, #0);
    FillChar(aIdOutCmd, SizeOf(aIdOutCmd), #0);
    cbBytesReturned := 0;
    
    // Set up data structures for IDENTIFY command.
    with SCIP do 
    begin 
      cBufferSize  := IDENTIFY_BUFFER_SIZE; 

      with irDriveRegs do 
      begin 
        bSectorCountReg := 1;
        bSectorNumberReg := 1;
        bDriveHeadReg := $A0;
        bCommandReg := $EC; 
      end; 
    end;
    
    if not DeviceIoControl(hDevice, $0007c088, @SCIP, SizeOf(TSendCmdInParams) - 1, @aIdOutCmd, SizeOf(aIdOutCmd), cbBytesReturned, nil) then
      Exit;
       
  finally 
    CloseHandle(hDevice); 
  end;
   
  with PIdSector(@IdOutCmd.bBuffer)^ do 
  begin 
    _ChangeByteOrder(sSerialNumber, SizeOf(sSerialNumber)); 
    (PChar(@sSerialNumber) + SizeOf(sSerialNumber))^ := #0; 
    Result := Trim(PChar(@sSerialNumber));
  end;
end;

function RetornaLocal(pStrCaminho: String): String;
var
  sRetorno: string;
begin
  if Pos(':', pStrCaminho) > 0 then
  begin
    Result := pStrCaminho;
  end else
  begin
    if Pos('\\', pStrCaminho) > 0 then
    begin
      sRetorno := Copy(pStrCaminho, 3, Length(pStrCaminho));
      sRetorno := Trim(Copy(sRetorno, Pos('\', sRetorno) + 1, Length(sRetorno)));
      Result := StringReplace(sRetorno, Copy(sRetorno, 1, 1), Copy(sRetorno, 1, 1) + ':', []);
    end;
  end;
end;

function BuscaPath(pStrPath: String; pBlnMono: Boolean): String;
begin
  if pBlnMono then
  begin
    Result := RetornaLocal(pStrPath);
  end else
  begin
    if DirectoryExists(pStrPath) then
      Result := pStrPath
    else
      Result := RetornaLocal(pStrPath);
  end;
end;

function RetornaArquivoPath(pStrArquivo: String; pBlnMono: Boolean): String;
begin
  if pBlnMono then
  begin
    Result := RetornaLocal(pStrArquivo);
  end else
  begin
    if FileExists(pStrArquivo) then
      Result := pStrArquivo
    else
      Result := RetornaLocal(pStrArquivo);
  end;
end;

function RetornaArquivoRede(pStrPath, pStrServidor: String; pBlnMono: Boolean): String;
var
 sHost, strTeste: String;
begin
  if pBlnMono then
  begin
    Result := RetornaLocal(pStrPath);
  end else
  begin
    if Pos('\\', '_' + pStrPath) > 0 then
    begin
      if Pos(pStrServidor, '_' + pStrPath) > 0 then
      begin
        Result := pStrPath;
      end else
      begin
        sHost := Copy(pStrPath, Pos('\\', pStrPath) + 2, Pos('\', Copy(pStrPath, 3, Length(pStrPath))) - 1);
        pStrPath := StringReplace(pStrPath, sHost, pStrServidor, [rfReplaceAll, rfIgnoreCase]);
        Result := pStrPath;
      end;
    end else
    begin
      Result := '\\' + pStrServidor + '\' + StringReplace(pStrPath, ':', '', [rfReplaceAll]);
    end;
  end;
end;

procedure AtualizaScroll(Sender: TControl; DataSet: TDataSet);
begin
  try
    if ((Sender <> nil) and (DataSet <> nil)) and (DataSet.IsEmpty) then
    begin
      Sender.Height := Sender.Height + 1;
      Sender.Height := Sender.Height - 1;
    end;
  except
  end;
end;

function RetornaVersaoAplicativo: String;
var
  sVersaoArquivo, sVersaoMes, sVersaoDia, sVersaoSub: String;
begin
  sVersaoArquivo := FileVerInfo(Application.ExeName).VersaoArquivo;
  sVersaoMes := Copy(sVersaoArquivo, 6, Length(sVersaoArquivo));
  sVersaoMes := Copy(sVersaoMes, 1, Pos('.', sVersaoMes) - 1);
  sVersaoDia := Copy(sVersaoArquivo, Pos('.' + sVersaoMes + '.', sVersaoArquivo), Length(sVersaoArquivo));
  sVersaoDia := StringReplace(sVersaoDia, '.' + sVersaoMes + '.', '', []);
  sVersaoSub := Copy(sVersaoDia, Pos('.', sVersaoDia) + 1, Length(sVersaoDia));
  sVersaoDia := Copy(sVersaoDia, 1, Pos('.', sVersaoDia) - 1);
  sVersaoDia := padL(sVersaoDia, '0', 2);
  sVersaoMes := padL(sVersaoMes, '0', 2);
  Result := Copy(sVersaoArquivo, 1, 4) + '.' + sVersaoMes + '.' + sVersaoDia + '.' + sVersaoSub;
end;

function RetornaDiaSemana(Data:TDateTime): String;
{Retorna dia da semana}
var
  NoDia : Integer;
  DiaDaSemana : array [1..7] of String[13];
begin
{ Dias da Semana }
  DiaDasemana [1]:= 'Domingo';
  DiaDasemana [2]:= 'Segunda';
  DiaDasemana [3]:= 'Terca';
  DiaDasemana [4]:= 'Quarta';
  DiaDasemana [5]:= 'Quinta';
  DiaDasemana [6]:= 'Sexta';
  DiaDasemana [7]:= 'Sabado';
  NoDia:=DayOfWeek(Data);
  RetornaDiaSemana:=DiaDasemana[NoDia];
end;

function StrZero( Const nNum: integer; Const nLen: integer ): String;
var
  nTam: integer;
begin
  Result:= '00000000' + IntToStr( nNum ) ;
  nTam  := Length( Result );
  Result:= copy( Result, nTam - nLen + 1, nLen );
end;

function ChamaFormaPagamentos(Form: TForm; FormClass : TFormClass):Boolean;
begin
  Application.CreateForm(FormClass,Form);
  Form.ShowModal;
  Form.Free;
end;

procedure AbrirRelatorio(blnDesigner: Boolean; Arquivo : String; DataSource : TDataSource);
Var
  sNomeArquivo: String;
begin
  {
  sNomeArquivo := ExtractFilePath(Application.ExeName) + 'Relatorios\'+Arquivo;
  if FileExists(sNomeArquivo) or blnDesigner then
  begin
   Application.CreateForm(TfrmGeradorRelatorio, frmGeradorRelatorio);
   frmGeradorRelatorio.intUsuario := DMBanco.Usuario;
   frmGeradorRelatorio.blnAbrirDesigner := blnDesigner;
   if FileExists(sNomeArquivo) then //? refeira a verifica??o porque pode entrar estando em modo de designer
     frmGeradorRelatorio.sEnderecoRelatorio := sNomeArquivo;

   frmGeradorRelatorio.CarregarDataSetDadosBanco(DMBanco.TB_Empresa, 'Financeiro');
   frmGeradorRelatorio.CriarDataSetRelatorio(DataSource, DataSource.Name);

    frmGeradorRelatorio.ShowModal;
    FreeAndNil(frmGeradorRelatorio);
  end;
  }
end;

function Criptografia(Action, Src: String): String;
Label Fim;
var
  Dest, Key: String;
  KeyLen, KeyPos, OffSet, SrcPos, SrcAsc, TmpSrcAsc, Range: Integer;
begin
  if (Src = '') Then
  begin
    Result:= '';
    Goto Fim;
  end;
  Key := 'AQUI VOCE CRIA SUA CHAVE PARA CRIPTOGRAFAR';
  Dest := '';
  KeyLen := Length(Key);
  KeyPos := 0;
  SrcPos := 0;
  SrcAsc := 0;
  Range := 256;
  if (Action = UpperCase('C')) then
  begin
    Randomize;
    OffSet := Random(Range);
    Dest := Format('%1.2x',[OffSet]);
    for SrcPos := 1 to Length(Src) do
    begin
      Application.ProcessMessages;
      SrcAsc := (Ord(Src[SrcPos]) + OffSet) Mod 255;
      if KeyPos < KeyLen then
        KeyPos := KeyPos + 1 else KeyPos := 1;
      SrcAsc := SrcAsc Xor Ord(Key[KeyPos]);
      Dest := Dest + Format('%1.2x',[SrcAsc]);
      OffSet := SrcAsc;
    end;
  end else if (Action = UpperCase('D')) then
  begin
    OffSet := StrToInt('$' + copy(Src,1,2)); //<--- adiciona o $ entra as aspas simples
    SrcPos := 3;
    repeat
      SrcAsc := StrToInt('$' + copy(Src,SrcPos,2)); //<--- adiciona o $ entra as aspas simples
      if (KeyPos < KeyLen) Then
        KeyPos := KeyPos + 1
      else
        KeyPos := 1;
      TmpSrcAsc := SrcAsc Xor Ord(Key[KeyPos]);
      if TmpSrcAsc <= OffSet then
        TmpSrcAsc := 255 + TmpSrcAsc - OffSet
      else
        TmpSrcAsc := TmpSrcAsc - OffSet;
      Dest := Dest + Chr(TmpSrcAsc);
      OffSet := SrcAsc;
      SrcPos := SrcPos + 2;
    until (SrcPos >= Length(Src));
  end;
  Result:= Dest;
  Fim:
end;

function AnoBiSexto(Ano: Integer): Boolean;
begin
  //Verifica se o ano ? Bi-Sexto
  Result := (Ano mod 4 = 0) and ((Ano mod 100 <> 0) or (Ano mod 400 = 0));
end;

function DiasPorMes(Ano, Mes: Integer): Integer;
  const DaysInMonth: array[1..12] of Integer = (31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31);
begin
  Result := DaysInMonth[Mes];
  if (Mes = 2) and AnoBiSexto(Ano) then
    Inc(Result);
end;

function DataExtenso(Data: TDateTime; Tipo: Integer): String;
{Retorna uma data por extenso}
//tipo 1: "Segunda-Feira, 01 de Janeiro de 2007"
//tipo 2: "Segunda-Feira"
//tipo 3: "Janeiro de 2007"
//tipo 4: "3 de Jan"
//tipo 5: "03 de Janeiro"
//tipo 6: "03"
//tipo 7: "Segunda, 03 de Janeiro"
//tipo 8: "03 de Janeiro de 2007"
var
  NoDia: Integer;
  DiaDaSemana: array [1..7] of String;
  DiaDaSemanaAbr: array [1..7] of String;
  Meses: array [1..12] of String;
  MesesAbreviado: array [1..12] of String;
  Dia, Mes, Ano: Word;
begin
{ Dias da Semana }
  DiaDasemana [1]:= 'Domingo';
  DiaDasemana [2]:= 'Segunda-Feira';
  DiaDasemana [3]:= 'Ter?a-Feira';
  DiaDasemana [4]:= 'Quarta-Feira';
  DiaDasemana [5]:= 'Quinta-Feira';
  DiaDasemana [6]:= 'Sexta-Feira';
  DiaDasemana [7]:= 'S?bado';
{ Dias da SemanaAbreviado }
  DiaDasemanaAbr [1]:= 'Domingo';
  DiaDasemanaAbr [2]:= 'Segunda';
  DiaDasemanaAbr [3]:= 'Ter?a';
  DiaDasemanaAbr [4]:= 'Quarta';
  DiaDasemanaAbr [5]:= 'Quinta';
  DiaDasemanaAbr [6]:= 'Sexta';
  DiaDasemanaAbr [7]:= 'S?bado';
{ Meses do ano }
  Meses [1] := 'Janeiro';
  Meses [2] := 'Fevereiro';
  Meses [3] := 'Mar?o';
  Meses [4] := 'Abril';
  Meses [5] := 'Maio';
  Meses [6] := 'Junho';
  Meses [7] := 'Julho';
  Meses [8] := 'Agosto';
  Meses [9] := 'Setembro';
  Meses [10]:= 'Outubro';
  Meses [11]:= 'Novembro';
  Meses [12]:= 'Dezembro';
{ Meses do ano abreviados }
  MesesAbreviado [1] := 'Jan';
  MesesAbreviado [2] := 'Fev';
  MesesAbreviado [3] := 'Mar';
  MesesAbreviado [4] := 'Abr';
  MesesAbreviado [5] := 'Mai';
  MesesAbreviado [6] := 'Jun';
  MesesAbreviado [7] := 'Jul';
  MesesAbreviado [8] := 'Ago';
  MesesAbreviado [9] := 'Set';
  MesesAbreviado [10]:= 'Out';
  MesesAbreviado [11]:= 'Nov';
  MesesAbreviado [12]:= 'Dez';
  DecodeDate (Data, Ano, Mes, Dia);
  NoDia := DayOfWeek (Data);

  case Tipo of
    1: Result := DiaDaSemana[NoDia] + ', ' + IntToStr(Dia) + ' de ' + Meses[Mes]+ ' de ' + IntToStr(Ano);
    2: Result := DiaDaSemana[NoDia];
    3: Result := Meses[Mes] + ' de ' + IntToStr(Ano);
    4: Result := InttoStr(Dia) + ' de ' + MesesAbreviado[Mes];
    5: Result := FormatFloat('00',Dia) + ' de ' + Meses[Mes];
    6: Result := FormatFloat('00',Dia);
    7: Result := DiaDaSemanaAbr[NoDia] + ', ' + FormatFloat('00',Dia) + ' de ' + Meses[Mes];
    8: Result := IntToStr(Dia) + ' de ' + Meses[Mes]+ ' de ' + IntToStr(Ano);
  end;
end;

function MesExtenso(iMes: Integer): String;
var
  Meses: array [1..12] of String;
begin
{ Meses do ano }
  Meses [1] := 'Janeiro';
  Meses [2] := 'Fevereiro';
  Meses [3] := 'Mar?o';
  Meses [4] := 'Abril';
  Meses [5] := 'Maio';
  Meses [6] := 'Junho';
  Meses [7] := 'Julho';
  Meses [8] := 'Agosto';
  Meses [9] := 'Setembro';
  Meses [10]:= 'Outubro';
  Meses [11]:= 'Novembro';
  Meses [12]:= 'Dezembro';
  Result := Meses[iMes];
end;

// Ajustada para D6 ou XE e superior
function GetIP:string;
//--> Declare a Winsock na clausula uses da unit
var
  WSAData: TWSAData;
  HostEnt: PHostEnt;
  Name:string;
begin
  WSAStartup(2, WSAData);
  SetLength(Name, 255);

  {$IFDEF VER140} // D6
    Gethostname(PChar(Name), 255);
  {$ELSE}
    Gethostname(PAnsiChar(Name), 255);
  {$ENDIF}

  SetLength(Name, StrLen(PChar(Name)));

  {$IFDEF VER140} // D6
    HostEnt := gethostbyname(PChar(Name));
  {$ELSE}
    HostEnt := gethostbyname(PAnsiChar(Name));
  {$ENDIF}


  with HostEnt^ do
  begin
    Result := Format('%d.%d.%d.%d',
    [Byte(h_addr^[0]),Byte(h_addr^[1]),
    Byte(h_addr^[2]),Byte(h_addr^[3])]);
  end;
  WSACleanup;
end;

// Ajustada para D6 ou XE8 e superior
function HostName(strIPAddress : String) : String;
//
// Retorna o Host onde seu TCP/IP est? conectado
//
// Requer a Winsock declarada na clausula uses da unit
//
var
  strHost : String ;
  pszIPAddress : PChar ;
  pReturnedHostEnt : PHostEnt ;
  InternetAddr : u_long ;
  GInitData : TWSADATA ;
  IdStackWin: TIdStackWindows;
begin
  strHost := '';
  {$IFDEF VER140}
    // D6
    if WSAStartup($101, GInitData) = 0 then
    begin
      pszIPAddress := StrAlloc( Length( strIPAddress ) + 1 ) ;
      StrPCopy( pszIPAddress, strIPAddress ) ;
      InternetAddr := Inet_Addr(pszIPAddress);
      //InternetAddr := Inet_Addr(PAnsiChar(pszIPAddress));
      StrDispose(pszIPAddress);
      pReturnedHostEnt := GetHostByAddr( PChar(@InternetAddr),4, PF_INET );
      try
        strHost := pReturnedHostEnt^.h_name;
        WSACleanup;
        Result := strHost ;
      except
        Result := 'Host inv?lido ou n?o encontrado';
      end;
    end;
  {$ELSE}
    // XE8
    try
      IdStackWin := TIdStackWindows.Create;
      try
        strHost := IdStackWin.HostByAddress(PChar(strIPAddress));
        Result := strHost;
      except
        Result := 'Host inv?lido ou n?o encontrado';
      end;

    finally
      IdStackWin.Free;
    end;
 {$ENDIF}
end;


procedure VerificaArquivoRelatorio(iCodRelCliente: Integer; sArquivoRelCliente: String);
var
  sArquivoOriginal, sArquivoCliente: String;
begin
  sArquivoOriginal := ExtractFilePath(Application.ExeName) + 'Relatorios\' + sArquivoRelCliente + '.fr3';
  sArquivoCliente := ExtractFilePath(Application.ExeName) + 'Relatorios\Cli' +
    IntToStr(iCodRelCliente) + '_' + sArquivoRelCliente + '.fr3';

  if FileExists(sArquivoCliente) = False then
    CopyFile(PWideChar(sArquivoOriginal), PWideChar(sArquivoCliente), true);
end;

function retornaData(iDia, iMes, iAno: Integer): TDate;
var
  dtRetorno: TDate;
  blnErro: Boolean;
begin
  repeat
    try
      blnErro := False;
      dtRetorno := StrToDate(IntToStr(iDia) + '/' + IntToStr(iMes) + '/' + IntToStr(iAno));
    except
      if iDia > 1 then
      begin
        iDia := iDia - 1;
        blnErro := True;
      end;
    end;
  until blnErro = False;
  Result := dtRetorno;
end;

function formatarCPF_CNPJ(sTexto: String): String;
begin
  try
    sTexto := StringReplace(StringReplace(StringReplace(sTexto, '.', '', [rfReplaceAll, rfIgnoreCase]), '/', '', [rfReplaceAll, rfIgnoreCase]), '-', '', [rfReplaceAll, rfIgnoreCase]);
    if Length(sTexto) <= 11 then
      Result := Copy(sTexto, 1, 3) + '.' + Copy(sTexto, 4, 3) + '.' + Copy(sTexto, 7, 3) + '-' + Copy(sTexto, 10, 2)
    else
      Result := Copy(sTexto, 1, 2) + '.' + Copy(sTexto, 3, 3) + '.' + Copy(sTexto, 6, 3) + '/' + Copy(sTexto, 9, 4) + '-' + Copy(sTexto, 13, 2);
  except
    Result := sTexto;
  end;
end;

function formatarCEP(sTexto: String): String;
begin
  try
    sTexto := StringReplace(StringReplace(sTexto, '-', '', [rfReplaceAll, rfIgnoreCase]), ' ', '', [rfReplaceAll, rfIgnoreCase]);
    Result := Copy(sTexto, 1, 5) + '-' + Copy(sTexto, 6, 3);
  except
    Result := sTexto;
  end;
end;

function removerAspas(sTexto: String): String;
begin
  Result := StringReplace(StringReplace(sTexto, '"', '', [rfReplaceAll, rfIgnoreCase]), '''', '', [rfReplaceAll, rfIgnoreCase]);
end;

function trocarVirgulasPonto(sTexto: String): String;
begin
  Result := StringReplace(sTexto, ',', '.', [rfReplaceAll, rfIgnoreCase]);
end;

function gerarGUID: String;
var
  Uid: TGuid;
begin
  CreateGuid(Uid);
  Result := GuidToString(Uid);
end;

end.
