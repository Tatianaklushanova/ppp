object fmNewCex: TfmNewCex
  Left = 314
  Top = 146
  Width = 347
  Height = 290
  Caption = #1042#1074#1086#1076' '#1085#1086#1074#1086#1075#1086' '#1094#1077#1093#1072
  Color = clSkyBlue
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCloseQuery = FormCloseQuery
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 80
    Top = 104
    Width = 160
    Height = 16
    Caption = #1042#1074#1077#1076#1080#1090#1077' '#1085#1072#1079#1074#1072#1085#1080#1077' '#1094#1077#1093#1072
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 88
    Top = 17
    Width = 154
    Height = 14
    Caption = #1042#1099#1073#1077#1088#1080#1090#1077' '#1087#1088#1077#1076#1087#1088#1080#1103#1090#1080#1077
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
  end
  object Bevel1: TBevel
    Left = 8
    Top = 8
    Width = 313
    Height = 201
  end
  object DBEdit1: TDBEdit
    Left = 80
    Top = 136
    Width = 169
    Height = 24
    DataField = 'Name'
    DataSource = DataModule2.DataSource6
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
  end
  object DBLookupComboBox1: TDBLookupComboBox
    Left = 32
    Top = 48
    Width = 265
    Height = 24
    DataField = 'Kodcompany'
    DataSource = DataModule2.DataSource6
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Verdana'
    Font.Style = []
    KeyField = 'Kod'
    ListField = 'Name'
    ListSource = DataModule2.DataSource5
    ParentFont = False
    TabOrder = 1
  end
  object BitBtn1: TBitBtn
    Left = 40
    Top = 216
    Width = 89
    Height = 25
    TabOrder = 2
    Kind = bkOK
  end
  object BitBtn2: TBitBtn
    Left = 200
    Top = 216
    Width = 89
    Height = 25
    Caption = #1054#1090#1084#1077#1085#1072
    TabOrder = 3
    Kind = bkCancel
  end
end
