object DM_Financeiro: TDM_Financeiro
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 519
  Width = 722
  object DB_Financeiro: TIBDatabase
    Connected = True
    DatabaseName = 'C:\UniAlfa\SCCDB.FDB'
    Params.Strings = (
      'user_name=SYSDBA'
      'password=masterkey')
    LoginPrompt = False
    DefaultTransaction = Trans_Financeiro
    ServerType = 'IBServer'
    Left = 48
    Top = 24
  end
  object Q_Usuario: TIBQuery
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
        DataType = ftUnknown
        Name = 'userLogin'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'senhaLogin'
        ParamType = ptUnknown
      end>
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
      Size = 25
    end
  end
  object Trans_Financeiro: TIBTransaction
    Active = True
    DefaultDatabase = DB_Financeiro
    Left = 136
    Top = 24
  end
end
