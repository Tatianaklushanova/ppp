object fmGetComp: TfmGetComp
  Left = 285
  Top = 353
  Width = 539
  Height = 274
  Caption = #1069#1082#1089#1087#1086#1088#1090' '#1076#1072#1085#1085#1099#1093
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 80
    Top = 24
    Width = 354
    Height = 20
    Caption = #1054#1090#1084#1077#1090#1100#1090#1077' '#1087#1088#1077#1076#1087#1088#1080#1103#1090#1080#1103' '#1076#1083#1103' '#1101#1082#1089#1087#1086#1088#1090#1072' '#1076#1072#1085#1085#1099#1093':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Bevel1: TBevel
    Left = 8
    Top = 8
    Width = 505
    Height = 185
  end
  object chComp: TCheckListBox
    Left = 40
    Top = 48
    Width = 457
    Height = 121
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ItemHeight = 16
    ParentFont = False
    TabOrder = 0
  end
  object BitBtn1: TBitBtn
    Left = 96
    Top = 208
    Width = 75
    Height = 25
    TabOrder = 1
    Kind = bkOK
  end
  object BitBtn2: TBitBtn
    Left = 336
    Top = 208
    Width = 75
    Height = 25
    Caption = #1054#1090#1084#1077#1085#1072
    TabOrder = 2
    Kind = bkCancel
  end
  object tbCompany: TTable
    DatabaseName = 'MedicExport'
    TableName = 'company.DB'
    Left = 248
    Top = 56
    object tbCompanyName: TStringField
      FieldName = 'Name'
      Size = 50
    end
    object tbCompanyEdrpoy: TStringField
      FieldName = 'Edrpoy'
      Size = 8
    end
    object tbCompanyCity: TSmallintField
      FieldName = 'City'
    end
    object tbCompanyKod: TSmallintField
      FieldName = 'Kod'
    end
  end
  object quCity: TQuery
    DatabaseName = 'MEDIC2'
    SQL.Strings = (
      'Select * from city')
    Left = 96
    Top = 56
    object quCityName: TStringField
      FieldName = 'Name'
      Origin = 'MEDIC."city.DB".Name'
      Size = 30
    end
    object quCityKod: TIntegerField
      FieldName = 'Kod'
      Origin = 'MEDIC."city.DB".Kod'
    end
  end
  object tbCity: TTable
    DatabaseName = 'MedicExport'
    TableName = 'city.DB'
    Left = 288
    Top = 56
    object tbCityName: TStringField
      FieldName = 'Name'
      Size = 30
    end
    object tbCityKod: TSmallintField
      FieldName = 'Kod'
    end
  end
  object quCex: TQuery
    DatabaseName = 'MEDIC2'
    SQL.Strings = (
      'Select * from cex')
    Left = 136
    Top = 56
    object quCexKod: TIntegerField
      FieldName = 'Kod'
      Origin = 'MEDIC."cex.DB".Kod'
    end
    object quCexName: TStringField
      FieldName = 'Name'
      Origin = 'MEDIC."cex.DB".Name'
      Size = 50
    end
    object quCexKodcompany: TSmallintField
      FieldName = 'Kodcompany'
      Origin = 'MEDIC."cex.DB".Kodcompany'
    end
  end
  object tbCex: TTable
    DatabaseName = 'MedicExport'
    TableName = 'cex.DB'
    Left = 328
    Top = 56
    object tbCexKod: TSmallintField
      FieldName = 'Kod'
    end
    object tbCexName: TStringField
      FieldName = 'Name'
      Size = 50
    end
    object tbCexKodcompany: TSmallintField
      FieldName = 'Kodcompany'
    end
  end
  object tbProfession: TTable
    DatabaseName = 'MedicExport'
    TableName = 'profession.DB'
    Left = 368
    Top = 56
    object tbProfessionKod: TSmallintField
      FieldName = 'Kod'
    end
    object tbProfessionName: TStringField
      FieldName = 'Name'
      Size = 50
    end
  end
  object quClients: TQuery
    DatabaseName = 'MEDIC2'
    SQL.Strings = (
      'select * from clients')
    Left = 96
    Top = 96
    object quClientsKod: TIntegerField
      FieldName = 'Kod'
      Origin = 'MEDIC."clients.DB".Kod'
    end
    object quClientsINN: TStringField
      FieldName = 'INN'
      Origin = 'MEDIC."clients.DB".INN'
      Size = 10
    end
    object quClientsFamil: TStringField
      FieldName = 'Famil'
      Origin = 'MEDIC."clients.DB".Famil'
      Size = 30
    end
    object quClientsName: TStringField
      FieldName = 'Name'
      Origin = 'MEDIC."clients.DB".Name'
    end
    object quClientsOtch: TStringField
      FieldName = 'Otch'
      Origin = 'MEDIC."clients.DB".Otch'
    end
    object quClientsPol: TStringField
      FieldName = 'Pol'
      Origin = 'MEDIC."clients.DB".Pol'
      Size = 1
    end
    object quClientsData_r: TDateField
      FieldName = 'Data_r'
      Origin = 'MEDIC."clients.DB".Data_r'
    end
    object quClientsProfesion: TSmallintField
      FieldName = 'Profesion'
      Origin = 'MEDIC."clients.DB".Profesion'
    end
    object quClientsCompany: TSmallintField
      FieldName = 'Company'
      Origin = 'MEDIC."clients.DB".Company'
    end
    object quClientsCex: TSmallintField
      FieldName = 'Cex'
      Origin = 'MEDIC."clients.DB".Cex'
    end
  end
  object tbWork: TTable
    DatabaseName = 'MedicExport'
    TableName = 'wwork.DB'
    Left = 248
    Top = 104
    object tbWorkKod: TIntegerField
      FieldName = 'Kod'
    end
    object tbWorkName: TStringField
      FieldName = 'Name'
      Size = 100
    end
    object tbWorkFm1: TStringField
      FieldName = 'Fm1'
      Size = 25
    end
    object tbWorkFm2: TStringField
      FieldName = 'Fm2'
      Size = 25
    end
    object tbWorkFm3: TStringField
      FieldName = 'Fm3'
      Size = 25
    end
    object tbWorkFm4: TStringField
      FieldName = 'Fm4'
      Size = 25
    end
    object tbWorkFm5: TStringField
      FieldName = 'Fm5'
      Size = 25
    end
    object tbWorkFm6: TStringField
      FieldName = 'Fm6'
      Size = 25
    end
    object tbWorkFm7: TStringField
      FieldName = 'Fm7'
      Size = 25
    end
    object tbWorkFm8: TStringField
      FieldName = 'Fm8'
      Size = 25
    end
    object tbWorkFm9: TStringField
      FieldName = 'Fm9'
      Size = 25
    end
  end
  object quTesting: TQuery
    DatabaseName = 'MEDIC2'
    SQL.Strings = (
      'select * from testing t inner join clients c '
      'on t.INN=c.INN'
      'where c.Company in (2);')
    Left = 136
    Top = 96
    object quTestingKod: TIntegerField
      FieldName = 'Kod'
    end
    object quTestingData: TDateField
      FieldName = 'Data'
    end
    object quTestingINN: TStringField
      FieldName = 'INN'
      Size = 10
    end
    object quTestingWork1: TSmallintField
      FieldName = 'Work1'
    end
    object quTestingRez1: TFloatField
      FieldName = 'Rez1'
    end
    object quTestingBall1: TSmallintField
      FieldName = 'Ball1'
    end
    object quTestingRez2: TFloatField
      FieldName = 'Rez2'
    end
    object quTestingBall2: TSmallintField
      FieldName = 'Ball2'
    end
    object quTestingRez3: TFloatField
      FieldName = 'Rez3'
    end
    object quTestingBall3: TSmallintField
      FieldName = 'Ball3'
    end
    object quTestingRez4: TFloatField
      FieldName = 'Rez4'
    end
    object quTestingBall4: TSmallintField
      FieldName = 'Ball4'
    end
    object quTestingRez5: TFloatField
      FieldName = 'Rez5'
    end
    object quTestingBall5: TSmallintField
      FieldName = 'Ball5'
    end
    object quTestingRez6: TFloatField
      FieldName = 'Rez6'
    end
    object quTestingBall6: TSmallintField
      FieldName = 'Ball6'
    end
    object quTestingRez7: TFloatField
      FieldName = 'Rez7'
    end
    object quTestingBall7: TSmallintField
      FieldName = 'Ball7'
    end
    object quTestingRez8: TFloatField
      FieldName = 'Rez8'
    end
    object quTestingBall8: TSmallintField
      FieldName = 'Ball8'
    end
    object quTestingRez9: TFloatField
      FieldName = 'Rez9'
    end
    object quTestingBall9: TSmallintField
      FieldName = 'Ball9'
    end
    object quTestingKod_1: TIntegerField
      FieldName = 'Kod_1'
    end
    object quTestingINN_1: TStringField
      FieldName = 'INN_1'
      Size = 10
    end
    object quTestingFamil: TStringField
      FieldName = 'Famil'
      Size = 30
    end
    object quTestingName: TStringField
      FieldName = 'Name'
    end
    object quTestingOtch: TStringField
      FieldName = 'Otch'
    end
    object quTestingPol: TStringField
      FieldName = 'Pol'
      Size = 1
    end
    object quTestingData_r: TDateField
      FieldName = 'Data_r'
    end
    object quTestingProfesion: TSmallintField
      FieldName = 'Profesion'
    end
    object quTestingCompany: TSmallintField
      FieldName = 'Company'
    end
    object quTestingCex: TSmallintField
      FieldName = 'Cex'
    end
  end
  object tbClients: TTable
    DatabaseName = 'MedicExport'
    TableName = 'clients.DB'
    Left = 408
    Top = 56
    object tbClientsINN: TStringField
      FieldName = 'INN'
      Size = 10
    end
    object tbClientsFamil: TStringField
      FieldName = 'Famil'
      Size = 30
    end
    object tbClientsName: TStringField
      FieldName = 'Name'
    end
    object tbClientsOtch: TStringField
      FieldName = 'Otch'
    end
    object tbClientsPol: TStringField
      FieldName = 'Pol'
      Size = 1
    end
    object tbClientsData_r: TDateField
      FieldName = 'Data_r'
    end
    object tbClientsProfesion: TSmallintField
      FieldName = 'Profesion'
    end
    object tbClientsCompany: TSmallintField
      FieldName = 'Company'
    end
    object tbClientsCex: TSmallintField
      FieldName = 'Cex'
    end
    object tbClientsNew: TStringField
      FieldName = 'New'
      Size = 1
    end
    object tbClientsKod: TIntegerField
      FieldName = 'Kod'
    end
  end
  object tbTesting: TTable
    DatabaseName = 'MedicExport'
    TableName = 'testing.DB'
    Left = 288
    Top = 104
    object tbTestingData: TDateField
      FieldName = 'Data'
    end
    object tbTestingINN: TStringField
      FieldName = 'INN'
      Size = 10
    end
    object tbTestingWork1: TSmallintField
      FieldName = 'Work1'
    end
    object tbTestingRez1: TFloatField
      FieldName = 'Rez1'
    end
    object tbTestingBall1: TSmallintField
      FieldName = 'Ball1'
    end
    object tbTestingRez2: TFloatField
      FieldName = 'Rez2'
    end
    object tbTestingBall2: TSmallintField
      FieldName = 'Ball2'
    end
    object tbTestingRez3: TFloatField
      FieldName = 'Rez3'
    end
    object tbTestingBall3: TSmallintField
      FieldName = 'Ball3'
    end
    object tbTestingRez4: TFloatField
      FieldName = 'Rez4'
    end
    object tbTestingBall4: TSmallintField
      FieldName = 'Ball4'
    end
    object tbTestingRez5: TFloatField
      FieldName = 'Rez5'
    end
    object tbTestingBall5: TSmallintField
      FieldName = 'Ball5'
    end
    object tbTestingRez6: TFloatField
      FieldName = 'Rez6'
    end
    object tbTestingBall6: TSmallintField
      FieldName = 'Ball6'
    end
    object tbTestingRez7: TFloatField
      FieldName = 'Rez7'
    end
    object tbTestingBall7: TSmallintField
      FieldName = 'Ball7'
    end
    object tbTestingRez8: TFloatField
      FieldName = 'Rez8'
    end
    object tbTestingBall8: TSmallintField
      FieldName = 'Ball8'
    end
    object tbTestingRez9: TFloatField
      FieldName = 'Rez9'
    end
    object tbTestingBall9: TSmallintField
      FieldName = 'Ball9'
    end
    object tbTestingNew: TStringField
      FieldName = 'New'
      Size = 1
    end
    object tbTestingKod: TIntegerField
      FieldName = 'Kod'
    end
  end
  object quFindCex: TQuery
    DatabaseName = 'MEDIC2'
    SQL.Strings = (
      'select * from cex')
    Left = 96
    Top = 152
    object quFindCexKod: TSmallintField
      FieldName = 'Kod'
      Origin = 'MEDIC2."cex.DB".Kod'
    end
  end
  object quFindProf: TQuery
    DatabaseName = 'MEDIC2'
    SQL.Strings = (
      'select * from profession where name=:Name;')
    Left = 152
    Top = 152
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Name'
        ParamType = ptUnknown
      end>
  end
end
