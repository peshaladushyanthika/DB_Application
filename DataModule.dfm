object DM: TDM
  Height = 750
  Width = 1000
  PixelsPerInch = 120
  object Connection: TMyConnection
    Database = 'customers'
    Username = 'root'
    Connected = True
    LoginPrompt = False
    Left = 168
    Top = 120
  end
  object QrySelect: TMyQuery
    Connection = Connection
    SQL.Strings = (
      '')
    Left = 472
    Top = 136
  end
  object QryInsert: TMyQuery
    Connection = Connection
    Left = 304
    Top = 336
  end
  object QryDelete: TMyQuery
    Connection = Connection
    Left = 568
    Top = 240
  end
  object QryUpdate: TMyQuery
    Connection = Connection
    Left = 520
    Top = 416
  end
  object QrySelectDetails: TMyQuery
    Connection = Connection
    Left = 256
    Top = 504
  end
end
