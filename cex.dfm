object fmCex: TfmCex
  Left = 347
  Top = 76
  Width = 943
  Height = 584
  Anchors = []
  Caption = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082' '#1094#1077#1093#1086#1074
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
  DesignSize = (
    927
    546)
  PixelsPerInch = 96
  TextHeight = 16
  object Label1: TLabel
    Left = 352
    Top = 48
    Width = 216
    Height = 24
    Caption = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082' '#1094#1077#1093#1086#1074
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Bookman Old Style'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object DBGrid1: TDBGrid
    Left = 184
    Top = 144
    Width = 600
    Height = 300
    Anchors = []
    DataSource = DataModule2.DataSource6
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -15
    TitleFont.Name = 'Verdana'
    TitleFont.Style = []
    OnColExit = DBGrid1ColExit
    OnDrawColumnCell = DBGrid1DrawColumnCell
    Columns = <
      item
        Expanded = False
        FieldName = 'Name'
        Title.Alignment = taCenter
        Title.Caption = #1053#1072#1079#1074#1072#1085#1080#1077' '#1094#1077#1093#1072
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -12
        Title.Font.Name = 'Verdana'
        Title.Font.Style = []
        Width = 109
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Kodcompany'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Verdana'
        Font.Style = []
        Title.Alignment = taCenter
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -12
        Title.Font.Name = 'Verdana'
        Title.Font.Style = []
        Width = 123
        Visible = True
      end
      item
        Alignment = taLeftJustify
        Expanded = False
        FieldName = 'LooCompany'
        Title.Alignment = taCenter
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -12
        Title.Font.Name = 'Verdana'
        Title.Font.Style = []
        Width = 203
        Visible = True
      end>
  end
  object DBNavigator1: TDBNavigator
    Left = 376
    Top = 472
    Width = 280
    Height = 25
    DataSource = DataModule2.DataSource6
    TabOrder = 1
  end
  object DBLookupComboBox1: TDBLookupComboBox
    Left = 104
    Top = 472
    Width = 145
    Height = 24
    DataField = 'Kodcompany'
    DataSource = DataModule2.DataSource6
    KeyField = 'Kod'
    ListField = 'Name'
    ListSource = DataModule2.DataSource5
    TabOrder = 2
    Visible = False
  end
end
