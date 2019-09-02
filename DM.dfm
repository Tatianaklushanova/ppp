object DataModule2: TDataModule2
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 534
  Top = 214
  Height = 416
  Width = 610
  object clients: TTable
    DatabaseName = 'MEDIC2'
    FieldDefs = <
      item
        Name = 'Kod'
        Attributes = [faReadonly]
        DataType = ftAutoInc
      end
      item
        Name = 'INN'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'Famil'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'Name'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'Otch'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'Pol'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'Data_r'
        DataType = ftDate
      end
      item
        Name = 'Profesion'
        DataType = ftSmallint
      end
      item
        Name = 'Company'
        DataType = ftSmallint
      end
      item
        Name = 'Cex'
        DataType = ftSmallint
      end
      item
        Name = 'New'
        DataType = ftString
        Size = 1
      end>
    IndexDefs = <
      item
        Name = 'clientsIndex1'
        Fields = 'INN'
        Options = [ixPrimary, ixUnique]
      end
      item
        Name = 'CexIndex'
        Fields = 'Cex'
        Options = [ixCaseInsensitive]
      end
      item
        Name = 'ProfIndex'
        Fields = 'Profesion'
        Options = [ixCaseInsensitive]
      end
      item
        Name = 'CompanyIndex'
        Fields = 'Company'
        Options = [ixCaseInsensitive]
      end>
    StoreDefs = True
    TableName = 'clients.db'
    Left = 88
    Top = 8
    object clientsINN: TStringField
      FieldName = 'INN'
      Size = 10
    end
    object clientsFamil: TStringField
      FieldName = 'Famil'
      Size = 30
    end
    object clientsName: TStringField
      FieldName = 'Name'
    end
    object clientsOtch: TStringField
      FieldName = 'Otch'
    end
    object clientsPol: TStringField
      FieldName = 'Pol'
      Size = 1
    end
    object clientsData_r: TDateField
      FieldName = 'Data_r'
    end
    object clientsProfesion: TSmallintField
      FieldName = 'Profesion'
    end
    object clientsLooPfof: TStringField
      FieldKind = fkLookup
      FieldName = 'LooPfof'
      LookupDataSet = profesion
      LookupKeyFields = 'Kod'
      LookupResultField = 'Name'
      KeyFields = 'Profesion'
      Size = 50
      Lookup = True
    end
    object clientsCompany: TSmallintField
      FieldName = 'Company'
    end
    object clientsLooComp: TStringField
      FieldKind = fkLookup
      FieldName = 'LooComp'
      LookupDataSet = company
      LookupKeyFields = 'Kod'
      LookupResultField = 'Name'
      KeyFields = 'Company'
      Lookup = True
    end
    object clientsCex: TSmallintField
      FieldName = 'Cex'
    end
    object clientsLooCex: TStringField
      Alignment = taCenter
      FieldKind = fkLookup
      FieldName = 'LooCex'
      LookupDataSet = cex
      LookupKeyFields = 'Kod'
      LookupResultField = 'Name'
      KeyFields = 'Cex'
      Lookup = True
    end
    object clientsNew: TStringField
      FieldName = 'New'
      Size = 1
    end
    object clientsKod: TAutoIncField
      FieldName = 'Kod'
      ReadOnly = True
    end
  end
  object DataSource1: TDataSource
    DataSet = clients
    Left = 24
    Top = 8
  end
  object DataSource2: TDataSource
    DataSet = profesion
    Left = 24
    Top = 64
  end
  object profesion: TTable
    DatabaseName = 'MEDIC2'
    IndexFieldNames = 'Kod'
    MasterFields = 'Profesion'
    TableName = 'profession.db'
    Left = 88
    Top = 64
    object profesionName: TStringField
      Tag = 3
      DisplayLabel = '                              '#1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1087#1088#1086#1092#1077#1089#1089#1080#1080
      DisplayWidth = 50
      FieldName = 'Name'
      Size = 50
    end
    object profesionKod: TSmallintField
      FieldName = 'Kod'
    end
  end
  object DataSource3: TDataSource
    DataSet = city
    Left = 336
    Top = 128
  end
  object city: TTable
    DatabaseName = 'MEDIC2'
    TableName = 'city.db'
    Left = 408
    Top = 128
    object cityKod: TAutoIncField
      FieldName = 'Kod'
      ReadOnly = True
    end
    object cityName: TStringField
      FieldName = 'Name'
      Size = 30
    end
  end
  object DataSource4: TDataSource
    DataSet = wwork
    Left = 216
    Top = 64
  end
  object DataSource5: TDataSource
    DataSet = company
    Left = 344
    Top = 64
  end
  object wwork: TTable
    DatabaseName = 'MEDIC2'
    TableName = 'wwork.DB'
    Left = 272
    Top = 64
    object wworkKod: TAutoIncField
      FieldName = 'Kod'
      ReadOnly = True
    end
    object wworkName: TStringField
      FieldName = 'Name'
      Size = 100
    end
    object wworkFm1: TStringField
      FieldName = 'Fm1'
      Size = 25
    end
    object wworkFm2: TStringField
      FieldName = 'Fm2'
      Size = 25
    end
    object wworkFm3: TStringField
      FieldName = 'Fm3'
      Size = 25
    end
    object wworkFm4: TStringField
      FieldName = 'Fm4'
      Size = 25
    end
    object wworkFm5: TStringField
      FieldName = 'Fm5'
      Size = 25
    end
    object wworkFm6: TStringField
      FieldName = 'Fm6'
      Size = 25
    end
    object wworkFm7: TStringField
      FieldName = 'Fm7'
      Size = 25
    end
    object wworkFm8: TStringField
      FieldName = 'Fm8'
      Size = 25
    end
    object wworkFm9: TStringField
      FieldName = 'Fm9'
      Size = 25
    end
  end
  object company: TTable
    DatabaseName = 'MEDIC2'
    TableName = 'company.db'
    Left = 408
    Top = 64
    object companyKod: TAutoIncField
      FieldName = 'Kod'
      ReadOnly = True
    end
    object companyName: TStringField
      FieldName = 'Name'
      Size = 50
    end
    object companyEdrpoy: TStringField
      FieldName = 'Edrpoy'
      Size = 8
    end
    object companyCity: TSmallintField
      FieldName = 'City'
    end
    object companyLooCity: TStringField
      FieldKind = fkLookup
      FieldName = 'LooCity'
      LookupDataSet = city
      LookupKeyFields = 'Kod'
      LookupResultField = 'Name'
      KeyFields = 'City'
      Lookup = True
    end
  end
  object DataSource6: TDataSource
    DataSet = cex
    Left = 336
    Top = 192
  end
  object cex: TTable
    DatabaseName = 'MEDIC2'
    OnFilterRecord = cexFilterRecord
    TableName = 'cex.DB'
    Left = 408
    Top = 192
    object cexName: TStringField
      FieldName = 'Name'
      Size = 50
    end
    object cexKodcompany: TSmallintField
      Alignment = taCenter
      DisplayLabel = #1050#1086#1076' '#1087#1088#1077#1076#1087#1088#1080#1103#1090#1080#1103
      FieldName = 'Kodcompany'
    end
    object cexLooCompany: TStringField
      Alignment = taCenter
      DisplayLabel = #1055#1088#1077#1076#1087#1088#1080#1103#1090#1080#1077
      FieldKind = fkLookup
      FieldName = 'LooCompany'
      LookupDataSet = company
      LookupKeyFields = 'Kod'
      LookupResultField = 'Name'
      KeyFields = 'Kodcompany'
      Size = 50
      Lookup = True
    end
    object cexKod: TSmallintField
      FieldName = 'Kod'
    end
  end
  object DataSource7: TDataSource
    DataSet = testing
    Left = 24
    Top = 144
  end
  object testing: TTable
    DatabaseName = 'MEDIC2'
    TableName = 'testing.db'
    Left = 88
    Top = 144
    object testingKod: TAutoIncField
      FieldName = 'Kod'
      ReadOnly = True
    end
    object testingData: TDateField
      FieldName = 'Data'
    end
    object testingINN: TStringField
      FieldName = 'INN'
      Size = 10
    end
    object testingRez1: TFloatField
      FieldName = 'Rez1'
    end
    object testingBall1: TSmallintField
      FieldName = 'Ball1'
    end
    object testingRez2: TFloatField
      FieldName = 'Rez2'
    end
    object testingBall2: TSmallintField
      FieldName = 'Ball2'
    end
    object testingRez3: TFloatField
      FieldName = 'Rez3'
    end
    object testingBall3: TSmallintField
      FieldName = 'Ball3'
    end
    object testingRez4: TFloatField
      FieldName = 'Rez4'
    end
    object testingBall4: TSmallintField
      FieldName = 'Ball4'
    end
    object testingRez5: TFloatField
      FieldName = 'Rez5'
    end
    object testingBall5: TSmallintField
      FieldName = 'Ball5'
    end
    object testingRez6: TFloatField
      FieldName = 'Rez6'
    end
    object testingBall6: TSmallintField
      FieldName = 'Ball6'
    end
    object testingRez7: TFloatField
      FieldName = 'Rez7'
    end
    object testingBall7: TSmallintField
      FieldName = 'Ball7'
    end
    object testingRez8: TFloatField
      FieldName = 'Rez8'
    end
    object testingBall8: TSmallintField
      FieldName = 'Ball8'
    end
    object testingRez9: TFloatField
      FieldName = 'Rez9'
    end
    object testingBall9: TSmallintField
      FieldName = 'Ball9'
    end
    object testingWork1: TSmallintField
      Alignment = taCenter
      FieldName = 'Work1'
    end
    object testingNew: TStringField
      FieldName = 'New'
      Size = 1
    end
  end
  object quMaxKodProf: TQuery
    DatabaseName = 'MEDIC2'
    SQL.Strings = (
      'select max(kod) as maxkod from profession;')
    Left = 120
    Top = 64
    object quMaxKodProfmaxkod: TSmallintField
      FieldName = 'maxkod'
      Origin = 'MEDIC2."profession.DB".Kod'
    end
  end
  object quMaxKodCex: TQuery
    DatabaseName = 'MEDIC2'
    SQL.Strings = (
      'select max(kod) as maxkod from cex;')
    Left = 448
    Top = 224
    object quMaxKodCexmaxkod: TSmallintField
      FieldName = 'maxkod'
      Origin = 'MEDIC2."cex.DB".Kod'
    end
  end
  object Query1: TQuery
    DatabaseName = 'Medic2'
    Left = 112
    Top = 256
  end
  object DataSource8: TDataSource
    DataSet = Query1
    Left = 56
    Top = 272
  end
end
