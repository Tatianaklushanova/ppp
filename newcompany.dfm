object fmNewCompany: TfmNewCompany
  Left = 745
  Top = 643
  Width = 494
  Height = 258
  Caption = #1042#1074#1086#1076' '#1076#1072#1085#1085#1099#1093' '#1086' '#1087#1088#1077#1076#1087#1088#1080#1103#1090#1080#1080#1080
  Color = clGradientActiveCaption
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Verdana'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 16
  object Label1: TLabel
    Left = 24
    Top = 16
    Width = 98
    Height = 16
    Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
  end
  object Label2: TLabel
    Left = 320
    Top = 16
    Width = 51
    Height = 16
    Alignment = taCenter
    Caption = #1045#1043#1056#1055#1054#1059
  end
  object Label3: TLabel
    Left = 24
    Top = 88
    Width = 39
    Height = 16
    Caption = #1043#1086#1088#1086#1076
  end
  object DBEdit1: TDBEdit
    Left = 24
    Top = 40
    Width = 265
    Height = 24
    DataField = 'Name'
    DataSource = DataModule2.DataSource5
    TabOrder = 0
  end
  object DBEdit2: TDBEdit
    Left = 320
    Top = 40
    Width = 97
    Height = 24
    DataField = 'Edrpoy'
    DataSource = DataModule2.DataSource5
    TabOrder = 1
  end
  object DBLookupComboBox1: TDBLookupComboBox
    Left = 24
    Top = 112
    Width = 177
    Height = 24
    DataField = 'City'
    DataSource = DataModule2.DataSource5
    KeyField = 'Kod'
    ListField = 'Name'
    ListSource = DataModule2.DataSource3
    TabOrder = 2
  end
  object Button1: TButton
    Left = 104
    Top = 168
    Width = 81
    Height = 25
    Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clActiveBorder
    Font.Height = -13
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 272
    Top = 168
    Width = 81
    Height = 25
    Caption = #1054#1090#1084#1077#1085#1072
    TabOrder = 4
    OnClick = Button2Click
  end
end
