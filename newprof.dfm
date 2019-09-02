object fmNewProf: TfmNewProf
  Left = 407
  Top = 271
  Width = 300
  Height = 211
  Caption = #1042#1074#1086#1076' '#1085#1086#1074#1086#1081' '#1087#1088#1086#1092#1077#1089#1080#1080
  Color = clSkyBlue
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Verdana'
  Font.Style = []
  OldCreateOrder = False
  OnCloseQuery = FormCloseQuery
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 16
  object Label1: TLabel
    Left = 72
    Top = 24
    Width = 76
    Height = 16
    Alignment = taCenter
    Caption = #1055#1088#1086#1092#1077#1089#1089#1080#1103
    Color = clSkyBlue
    ParentColor = False
  end
  object Bevel1: TBevel
    Left = 8
    Top = 8
    Width = 265
    Height = 121
  end
  object DBEdit1: TDBEdit
    Left = 56
    Top = 56
    Width = 169
    Height = 24
    DataField = 'Name'
    DataSource = DataModule2.DataSource2
    TabOrder = 0
  end
  object BitBtn1: TBitBtn
    Left = 16
    Top = 136
    Width = 89
    Height = 25
    TabOrder = 1
    Kind = bkOK
  end
  object BitBtn2: TBitBtn
    Left = 176
    Top = 136
    Width = 89
    Height = 25
    Caption = #1054#1090#1084#1077#1085#1072
    TabOrder = 2
    Kind = bkCancel
  end
end
