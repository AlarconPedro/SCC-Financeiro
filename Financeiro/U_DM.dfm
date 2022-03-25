object DM_Financeiro: TDM_Financeiro
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 519
  Width = 722
  object DB_Financeiro: TIBDatabase
    Connected = True
    DatabaseName = 'D:\Desenvolvimento\Delphi\SCC-Financeiro\SCCDB.FDB'
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
      'SELECT login, senha'
      'FROM'
      'TB_USUARIOS'
      'WHERE login = :userLogin'
      'AND senha = :senhaLogin')
    Left = 224
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
    Left = 288
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
    Left = 224
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
  object Q_Contas: TIBQuery
    Database = DB_Financeiro
    Transaction = Trans_Financeiro
    Active = True
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'SELECT * FROM TB_CPAGAR'
      '')
    UpdateObject = Up_Contas
    GeneratorField.Field = 'CP_CODIGO'
    GeneratorField.Generator = 'GEN_TB_CPAGAR_ID'
    Left = 224
    Top = 136
  end
  object Up_Contas: TIBUpdateSQL
    RefreshSQL.Strings = (
      'Select '
      '  CP_CODIGO,'
      '  DESCRICAO,'
      '  VALOR,'
      '  F_PAGAMENTO,'
      '  PARCELAS,'
      '  VENCIMENTO,'
      '  CAT_CODIGO'
      'from TB_CPAGAR '
      'where'
      '  CP_CODIGO = :CP_CODIGO and'
      '  DESCRICAO = :DESCRICAO and'
      '  VALOR = :VALOR and'
      '  F_PAGAMENTO = :F_PAGAMENTO and'
      '  PARCELAS = :PARCELAS and'
      '  VENCIMENTO = :VENCIMENTO and'
      '  CAT_CODIGO = :CAT_CODIGO')
    ModifySQL.Strings = (
      'update TB_CPAGAR'
      'set'
      '  CP_CODIGO = :CP_CODIGO,'
      '  DESCRICAO = :DESCRICAO,'
      '  VALOR = :VALOR,'
      '  F_PAGAMENTO = :F_PAGAMENTO,'
      '  PARCELAS = :PARCELAS,'
      '  VENCIMENTO = :VENCIMENTO,'
      '  CAT_CODIGO = :CAT_CODIGO'
      'where'
      '  CP_CODIGO = :OLD_CP_CODIGO and'
      '  DESCRICAO = :OLD_DESCRICAO and'
      '  VALOR = :OLD_VALOR and'
      '  F_PAGAMENTO = :OLD_F_PAGAMENTO and'
      '  PARCELAS = :OLD_PARCELAS and'
      '  VENCIMENTO = :OLD_VENCIMENTO and'
      '  CAT_CODIGO = :OLD_CAT_CODIGO')
    InsertSQL.Strings = (
      'insert into TB_CPAGAR'
      
        '  (CP_CODIGO, DESCRICAO, VALOR, F_PAGAMENTO, PARCELAS, VENCIMENT' +
        'O, CAT_CODIGO)'
      'values'
      
        '  (:CP_CODIGO, :DESCRICAO, :VALOR, :F_PAGAMENTO, :PARCELAS, :VEN' +
        'CIMENTO, '
      '   :CAT_CODIGO)')
    DeleteSQL.Strings = (
      'delete from TB_CPAGAR'
      'where'
      '  CP_CODIGO = :OLD_CP_CODIGO and'
      '  DESCRICAO = :OLD_DESCRICAO and'
      '  VALOR = :OLD_VALOR and'
      '  F_PAGAMENTO = :OLD_F_PAGAMENTO and'
      '  PARCELAS = :OLD_PARCELAS and'
      '  VENCIMENTO = :OLD_VENCIMENTO and'
      '  CAT_CODIGO = :OLD_CAT_CODIGO')
    Left = 288
    Top = 136
  end
end
