object fmprofesion: Tfmprofesion
  Left = 392
  Top = 277
  Width = 768
  Height = 526
  Anchors = []
  BorderWidth = 1
  Caption = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082' '#1087#1088#1086#1092#1077#1089#1089#1080#1081
  Color = clMoneyGreen
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Verdana'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  WindowState = wsMaximized
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 16
  object Label1: TLabel
    Left = 232
    Top = 32
    Width = 280
    Height = 24
    Caption = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082'  '#1087#1088#1086#1092#1077#1089#1089#1080#1081
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Bookman Old Style'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object DBGrid1: TDBGrid
    Left = 128
    Top = 96
    Width = 545
    Height = 217
    DataSource = DataModule2.DataSource2
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = 'Verdana'
    TitleFont.Style = []
    Columns = <
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'Name'
        Title.Alignment = taCenter
        Title.Caption = ' '#1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1087#1088#1086#1092#1077#1089#1089#1080#1080
        Width = 517
        Visible = True
      end>
  end
  object DBNavigator1: TDBNavigator
    Left = 272
    Top = 352
    Width = 280
    Height = 25
    DataSource = DataModule2.DataSource2
    TabOrder = 1
  end
end
