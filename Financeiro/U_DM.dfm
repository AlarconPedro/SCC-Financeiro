object DM_Financeiro: TDM_Financeiro
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 519
  Width = 722
  object DB_Financeiro: TIBDatabase
    Connected = True
    DatabaseName = 'C:\UniAlfa\SCC\SCCDB.FDB'
    Params.Strings = (
      'user_name=SYSDBA'
      'password=masterkey')
    LoginPrompt = False
    DefaultTransaction = Trans_Financeiro
    ServerType = 'IBServer'
    Left = 48
    Top = 24
  end
  object Q_Login: TIBQuery
    Database = DB_Financeiro
    Transaction = Trans_Financeiro
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'SELECT usu_codigo, login, senha'
      'FROM'
      'TB_USUARIOS'
      'WHERE login = :userLogin'
      'AND senha = :senhaLogin')
    Left = 208
    Top = 24
    ParamData = <
      item
        DataType = ftString
        Name = 'userLogin'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'senhaLogin'
        ParamType = ptInput
      end>
    object Q_LoginLOGIN: TIBStringField
      FieldName = 'LOGIN'
      Origin = '"TB_USUARIOS"."LOGIN"'
      Required = True
      Size = 25
    end
    object Q_LoginSENHA: TIBStringField
      FieldName = 'SENHA'
      Origin = '"TB_USUARIOS"."SENHA"'
      Required = True
      Size = 32
    end
    object Q_LoginUSU_CODIGO: TIntegerField
      FieldName = 'USU_CODIGO'
      Origin = '"TB_USUARIOS"."USU_CODIGO"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
  end
  object Trans_Financeiro: TIBTransaction
    Active = True
    DefaultDatabase = DB_Financeiro
    Left = 136
    Top = 24
  end
  object Up_Usuario: TIBUpdateSQL
    RefreshSQL.Strings = (
      'Select '
      '  USU_CODIGO,'
      '  NOME,'
      '  LOGIN,'
      '  SENHA'
      'from TB_USUARIOS '
      'where'
      '  USU_CODIGO = :USU_CODIGO')
    ModifySQL.Strings = (
      'update TB_USUARIOS'
      'set'
      '  USU_CODIGO = :USU_CODIGO,'
      '  NOME = :NOME,'
      '  LOGIN = :LOGIN,'
      '  SENHA = :SENHA'
      'where'
      '  USU_CODIGO = :OLD_USU_CODIGO')
    InsertSQL.Strings = (
      'insert into TB_USUARIOS'
      '  (USU_CODIGO, NOME, LOGIN, SENHA)'
      'values'
      '  (:USU_CODIGO, :NOME, :LOGIN, :SENHA)')
    DeleteSQL.Strings = (
      'delete from TB_USUARIOS'
      'where'
      '  USU_CODIGO = :OLD_USU_CODIGO')
    Left = 304
    Top = 80
  end
  object Q_Usuario: TIBQuery
    Database = DB_Financeiro
    Transaction = Trans_Financeiro
    AfterDelete = Q_UsuarioAfterDelete
    AfterPost = Q_UsuarioAfterPost
    BeforePost = Q_UsuarioBeforePost
    BufferChunks = 1000
    CachedUpdates = True
    ParamCheck = True
    SQL.Strings = (
      'SELECT *'
      'FROM'
      'TB_USUARIOS')
    UpdateObject = Up_Usuario
    GeneratorField.Field = 'USU_CODIGO'
    GeneratorField.Generator = 'GEN_TB_USUARIOS_ID'
    Left = 208
    Top = 80
    object Q_UsuarioUSU_CODIGO: TIntegerField
      FieldName = 'USU_CODIGO'
    end
    object Q_UsuarioNOME: TIBStringField
      FieldName = 'NOME'
      Origin = '"TB_USUARIOS"."NOME"'
      Size = 50
    end
    object Q_UsuarioLOGIN: TIBStringField
      FieldName = 'LOGIN'
      Origin = '"TB_USUARIOS"."LOGIN"'
      Required = True
      Size = 25
    end
    object Q_UsuarioSENHA: TIBStringField
      FieldName = 'SENHA'
      Origin = '"TB_USUARIOS"."SENHA"'
      Required = True
      Size = 32
    end
  end
  object Q_ContasPagar: TIBQuery
    Database = DB_Financeiro
    Transaction = Trans_Financeiro
    AfterDelete = Q_ContasPagarAfterDelete
    AfterInsert = Q_ContasPagarAfterInsert
    AfterPost = Q_ContasPagarAfterPost
    BeforeOpen = Q_ContasPagarBeforeOpen
    BufferChunks = 1000
    CachedUpdates = True
    ParamCheck = True
    SQL.Strings = (
      'SELECT *  FROM TB_CPAGAR'
      'WHERE usu_codigo = :usuario'
      '')
    UpdateObject = Up_ContasPagar
    GeneratorField.Field = 'CP_CODIGO'
    GeneratorField.Generator = 'GEN_TB_CPAGAR_ID'
    Left = 208
    Top = 136
    ParamData = <
      item
        DataType = ftInteger
        Name = 'usuario'
        ParamType = ptInput
      end>
    object Q_ContasPagarCP_CODIGO: TIntegerField
      FieldName = 'CP_CODIGO'
      Origin = '"TB_CPAGAR"."CP_CODIGO"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object Q_ContasPagarDESCRICAO: TIBStringField
      FieldName = 'DESCRICAO'
      Origin = '"TB_CPAGAR"."DESCRICAO"'
      Size = 200
    end
    object Q_ContasPagarVALOR: TIBBCDField
      FieldName = 'VALOR'
      KeyFields = 'VALOR'
      Origin = '"TB_CPAGAR"."VALOR"'
      Required = True
      currency = True
      Precision = 18
      Size = 2
    end
    object Q_ContasPagarF_PAGAMENTO: TIntegerField
      FieldName = 'F_PAGAMENTO'
      Origin = '"TB_CPAGAR"."F_PAGAMENTO"'
      Required = True
      MaxValue = 1
    end
    object Q_ContasPagarPARCELAS: TIntegerField
      FieldName = 'PARCELAS'
      KeyFields = 'PARCELAS'
      Origin = '"TB_CPAGAR"."PARCELAS"'
    end
    object Q_ContasPagarVENCIMENTO: TDateField
      FieldName = 'VENCIMENTO'
      Origin = '"TB_CPAGAR"."VENCIMENTO"'
      Required = True
      EditMask = '00/99/0000;'
    end
    object Q_ContasPagarCAT_CODIGO: TIntegerField
      FieldName = 'CAT_CODIGO'
      Origin = '"TB_CPAGAR"."CAT_CODIGO"'
      Required = True
    end
    object Q_ContasPagarUSU_CODIGO: TIntegerField
      FieldName = 'USU_CODIGO'
      Origin = '"TB_CPAGAR"."USU_CODIGO"'
      Required = True
    end
  end
  object Q_Categorias: TIBQuery
    Database = DB_Financeiro
    Transaction = Trans_Financeiro
    AfterDelete = Q_CategoriasAfterDelete
    AfterInsert = Q_CategoriasAfterInsert
    AfterPost = Q_CategoriasAfterPost
    BufferChunks = 1000
    CachedUpdates = True
    ParamCheck = True
    SQL.Strings = (
      'SELECT * FROM TB_CATEGORIA')
    UpdateObject = Up_Categoria
    GeneratorField.Field = 'CAT_CODIGO'
    GeneratorField.Generator = 'GEN_TB_CATEGORIA_ID'
    Left = 208
    Top = 248
    object Q_CategoriasCAT_CODIGO: TIntegerField
      FieldName = 'CAT_CODIGO'
      Origin = '"TB_CATEGORIA"."CAT_CODIGO"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object Q_CategoriasNOME: TIBStringField
      FieldName = 'NOME'
      Origin = '"TB_CATEGORIA"."NOME"'
      Required = True
      Size = 50
    end
  end
  object Up_Categoria: TIBUpdateSQL
    RefreshSQL.Strings = (
      'Select '
      '  CAT_CODIGO,'
      '  NOME'
      'from TB_CATEGORIA '
      'where'
      '  CAT_CODIGO = :CAT_CODIGO')
    ModifySQL.Strings = (
      'update TB_CATEGORIA'
      'set'
      '  CAT_CODIGO = :CAT_CODIGO,'
      '  NOME = :NOME'
      'where'
      '  CAT_CODIGO = :OLD_CAT_CODIGO')
    InsertSQL.Strings = (
      'insert into TB_CATEGORIA'
      '  (CAT_CODIGO, NOME)'
      'values'
      '  (:CAT_CODIGO, :NOME)')
    DeleteSQL.Strings = (
      'delete from TB_CATEGORIA'
      'where'
      '  CAT_CODIGO = :OLD_CAT_CODIGO')
    Left = 304
    Top = 248
  end
  object Up_ContasPagar: TIBUpdateSQL
    RefreshSQL.Strings = (
      'Select '
      '  CP_CODIGO,'
      '  DESCRICAO,'
      '  VALOR,'
      '  F_PAGAMENTO,'
      '  PARCELAS,'
      '  VENCIMENTO,'
      '  CAT_CODIGO,'
      '  USU_CODIGO'
      'from TB_CPAGAR '
      'where'
      '  CP_CODIGO = :CP_CODIGO')
    ModifySQL.Strings = (
      'update TB_CPAGAR'
      'set'
      '  CP_CODIGO = :CP_CODIGO,'
      '  DESCRICAO = :DESCRICAO,'
      '  VALOR = :VALOR,'
      '  F_PAGAMENTO = :F_PAGAMENTO,'
      '  PARCELAS = :PARCELAS,'
      '  VENCIMENTO = :VENCIMENTO,'
      '  CAT_CODIGO = :CAT_CODIGO,'
      '  USU_CODIGO = :USU_CODIGO'
      'where'
      '  CP_CODIGO = :OLD_CP_CODIGO')
    InsertSQL.Strings = (
      'insert into TB_CPAGAR'
      
        '  (CP_CODIGO, DESCRICAO, VALOR, F_PAGAMENTO, PARCELAS, VENCIMENT' +
        'O, CAT_CODIGO, '
      '   USU_CODIGO)'
      'values'
      
        '  (:CP_CODIGO, :DESCRICAO, :VALOR, :F_PAGAMENTO, :PARCELAS, :VEN' +
        'CIMENTO, '
      '   :CAT_CODIGO, :USU_CODIGO)')
    DeleteSQL.Strings = (
      'delete from TB_CPAGAR'
      'where'
      '  CP_CODIGO = :OLD_CP_CODIGO')
    Left = 304
    Top = 136
  end
  object Q_ContasReceber: TIBQuery
    Database = DB_Financeiro
    Transaction = Trans_Financeiro
    AfterDelete = Q_ContasReceberAfterDelete
    AfterInsert = Q_ContasReceberAfterInsert
    AfterPost = Q_ContasReceberAfterPost
    BeforeOpen = Q_ContasReceberBeforeOpen
    BufferChunks = 1000
    CachedUpdates = True
    ParamCheck = True
    SQL.Strings = (
      'SELECT * FROM TB_CRECEBER'
      'WHERE usu_codigo = :usuario')
    UpdateObject = Up_ContasReceber
    GeneratorField.Field = 'CR_CODIGO'
    GeneratorField.Generator = 'GEN_TB_CRECEBER_ID'
    Left = 208
    Top = 192
    ParamData = <
      item
        DataType = ftInteger
        Name = 'usuario'
        ParamType = ptInput
      end>
    object Q_ContasReceberCR_CODIGO: TIntegerField
      FieldName = 'CR_CODIGO'
      KeyFields = 'CR_CODIGO'
      Origin = 'TB_CRECEBER.CR_CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object Q_ContasReceberDESCRICAO: TIBStringField
      FieldName = 'DESCRICAO'
      Origin = 'TB_CRECEBER.DESCRICAO'
      Size = 200
    end
    object Q_ContasReceberVALOR: TIBBCDField
      FieldName = 'VALOR'
      KeyFields = 'VALOR'
      Origin = 'TB_CRECEBER.VALOR'
      Required = True
      currency = True
      Precision = 18
      Size = 2
    end
    object Q_ContasReceberDATA_RECEBER: TDateField
      FieldName = 'DATA_RECEBER'
      KeyFields = 'DATA_RECEBER'
      Origin = 'TB_CRECEBER.DATA_RECEBER'
      Required = True
      EditMask = '99/99/0000;'
    end
    object Q_ContasReceberF_PAGAMENTO: TIntegerField
      FieldName = 'F_PAGAMENTO'
      Origin = 'TB_CRECEBER.F_PAGAMENTO'
      Required = True
    end
    object Q_ContasReceberPARCELAS: TIntegerField
      FieldName = 'PARCELAS'
      Origin = 'TB_CRECEBER.PARCELAS'
    end
    object Q_ContasReceberCAT_CODIGO: TIntegerField
      FieldName = 'CAT_CODIGO'
      Origin = 'TB_CRECEBER.CAT_CODIGO'
      Required = True
    end
    object Q_ContasReceberUSU_CODIGO: TIntegerField
      FieldName = 'USU_CODIGO'
      Origin = '"TB_CRECEBER"."USU_CODIGO"'
      Required = True
    end
  end
  object Up_ContasReceber: TIBUpdateSQL
    RefreshSQL.Strings = (
      'Select '
      '  CR_CODIGO,'
      '  DESCRICAO,'
      '  VALOR,'
      '  DATA_RECEBER,'
      '  F_PAGAMENTO,'
      '  PARCELAS,'
      '  CAT_CODIGO,'
      '  USU_CODIGO'
      'from TB_CRECEBER '
      'where'
      '  CR_CODIGO = :CR_CODIGO')
    ModifySQL.Strings = (
      'update TB_CRECEBER'
      'set'
      '  CR_CODIGO = :CR_CODIGO,'
      '  DESCRICAO = :DESCRICAO,'
      '  VALOR = :VALOR,'
      '  DATA_RECEBER = :DATA_RECEBER,'
      '  F_PAGAMENTO = :F_PAGAMENTO,'
      '  PARCELAS = :PARCELAS,'
      '  CAT_CODIGO = :CAT_CODIGO,'
      '  USU_CODIGO = :USU_CODIGO'
      'where'
      '  CR_CODIGO = :OLD_CR_CODIGO')
    InsertSQL.Strings = (
      'insert into TB_CRECEBER'
      
        '  (CR_CODIGO, DESCRICAO, VALOR, DATA_RECEBER, F_PAGAMENTO, PARCE' +
        'LAS, CAT_CODIGO, '
      '   USU_CODIGO)'
      'values'
      
        '  (:CR_CODIGO, :DESCRICAO, :VALOR, :DATA_RECEBER, :F_PAGAMENTO, ' +
        ':PARCELAS, '
      '   :CAT_CODIGO, :USU_CODIGO)')
    DeleteSQL.Strings = (
      'delete from TB_CRECEBER'
      'where'
      '  CR_CODIGO = :OLD_CR_CODIGO')
    Left = 304
    Top = 192
  end
  object Q_Soma: TIBQuery
    Database = DB_Financeiro
    Transaction = Trans_Financeiro
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'SELECT r.treceber, p.tpagar, (r.treceber - p.tpagar) AS TOTAL'
      
        'FROM (SELECT SUM(valor) AS tpagar FROM tb_cpagar where usu_codig' +
        'o = :pusuario) p,'
      
        '     (SELECT SUM(valor) AS treceber FROM tb_creceber where usu_c' +
        'odigo = :rusuario) r')
    Left = 208
    Top = 304
    ParamData = <
      item
        DataType = ftInteger
        Name = 'pusuario'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'rusuario'
        ParamType = ptInput
      end>
    object Q_SomaTRECEBER: TIBBCDField
      FieldName = 'TRECEBER'
      ProviderFlags = []
      Precision = 18
      Size = 2
    end
    object Q_SomaTPAGAR: TIBBCDField
      FieldName = 'TPAGAR'
      ProviderFlags = []
      Precision = 18
      Size = 2
    end
    object Q_SomaTOTAL: TIBBCDField
      FieldName = 'TOTAL'
      ProviderFlags = []
      Precision = 18
      Size = 2
    end
  end
end
