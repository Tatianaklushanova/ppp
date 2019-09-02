object fmSpravClients: TfmSpravClients
  Left = 20
  Top = 270
  Width = 1238
  Height = 585
  Anchors = []
  Caption = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082' '#1082#1083#1080#1077#1085#1090#1086#1074
  Color = clMoneyGreen
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'Verdana'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  WindowState = wsMaximized
  OnClose = FormClose
  OnShow = FormShow
  DesignSize = (
    1222
    547)
  PixelsPerInch = 96
  TextHeight = 18
  object Label1: TLabel
    Left = 440
    Top = 16
    Width = 256
    Height = 24
    Caption = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082' '#1082#1083#1080#1077#1085#1090#1086#1074
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Bookman Old Style'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object DBGrid1: TDBGrid
    Left = 5
    Top = 46
    Width = 1183
    Height = 400
    Anchors = []
    DataSource = DataModule2.DataSource1
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = 'Verdana'
    TitleFont.Style = []
    OnColExit = DBGrid1ColExit
    OnDrawColumnCell = DBGrid1DrawColumnCell
    Columns = <
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'INN'
        Title.Alignment = taCenter
        Title.Caption = #1048#1053#1053
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -12
        Title.Font.Name = 'Verdana'
        Title.Font.Style = []
        Width = 57
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Famil'
        Title.Alignment = taCenter
        Title.Caption = #1060#1072#1084#1080#1083#1080#1103
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -12
        Title.Font.Name = 'Verdana'
        Title.Font.Style = []
        Width = 96
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Name'
        Title.Alignment = taCenter
        Title.Caption = #1048#1084#1103
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -12
        Title.Font.Name = 'Verdana'
        Title.Font.Style = []
        Width = 111
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Otch'
        Title.Alignment = taCenter
        Title.Caption = #1054#1090#1095#1077#1089#1090#1074#1086
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -12
        Title.Font.Name = 'Verdana'
        Title.Font.Style = []
        Width = 123
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'Pol'
        Title.Alignment = taCenter
        Title.Caption = #1055#1086#1083
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -12
        Title.Font.Name = 'Verdana'
        Title.Font.Style = []
        Width = 39
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'Data_r'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Verdana'
        Font.Style = []
        Title.Alignment = taCenter
        Title.Caption = #1044#1072#1090#1072' '#1088#1086#1078#1076#1077#1085#1080#1103
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'Verdana'
        Title.Font.Style = []
        Width = 96
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'Profesion'
        Title.Alignment = taCenter
        Title.Caption = #1050#1086#1076' '#1087#1088#1086#1092#1077#1089#1089#1080#1080
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'Verdana'
        Title.Font.Style = []
        Width = 66
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'LooPfof'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Verdana'
        Font.Style = []
        Title.Alignment = taCenter
        Title.Caption = #1055#1088#1086#1092#1077#1089#1089#1080#1103
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -12
        Title.Font.Name = 'Verdana'
        Title.Font.Style = []
        Width = 149
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'Company'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Verdana'
        Font.Style = []
        Title.Alignment = taCenter
        Title.Caption = #1050#1086#1076' '#1087#1088#1077#1076#1087#1088#1080#1103#1090#1080#1103
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'Verdana'
        Title.Font.Style = []
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'LooComp'
        Title.Alignment = taCenter
        Title.Caption = #1055#1088#1077#1076#1087#1088#1080#1103#1090#1080#1077
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -12
        Title.Font.Name = 'Verdana'
        Title.Font.Style = []
        Width = 169
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'Cex'
        Title.Alignment = taCenter
        Title.Caption = #1050#1086#1076' '#1094#1077#1093#1072'       '
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'Verdana'
        Title.Font.Style = []
        Width = 62
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'LooCex'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Verdana'
        Font.Style = []
        Title.Alignment = taCenter
        Title.Caption = #1062#1077#1093
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -12
        Title.Font.Name = 'Verdana'
        Title.Font.Style = []
        Width = 124
        Visible = True
      end>
  end
  object DBNavigator1: TDBNavigator
    Left = 376
    Top = 488
    Width = 280
    Height = 25
    DataSource = DataModule2.DataSource1
    TabOrder = 1
  end
  object DBLookupComboBox1: TDBLookupComboBox
    Left = 64
    Top = 472
    Width = 217
    Height = 21
    DataField = 'Profesion'
    DataSource = DataModule2.DataSource1
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Verdana'
    Font.Style = []
    KeyField = 'Kod'
    ListField = 'Name'
    ListSource = DataModule2.DataSource2
    ParentFont = False
    TabOrder = 2
    Visible = False
  end
  object DBLookupComboBox2: TDBLookupComboBox
    Left = 56
    Top = 504
    Width = 233
    Height = 21
    DataField = 'Company'
    DataSource = DataModule2.DataSource1
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Verdana'
    Font.Style = []
    KeyField = 'Kod'
    ListField = 'Name'
    ListSource = DataModule2.DataSource5
    ParentFont = False
    TabOrder = 3
    Visible = False
  end
  object DBLookupComboBox3: TDBLookupComboBox
    Left = 760
    Top = 472
    Width = 217
    Height = 21
    DataField = 'Cex'
    DataSource = DataModule2.DataSource1
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Verdana'
    Font.Style = []
    KeyField = 'Kod'
    ListField = 'Name'
    ListSource = DataModule2.DataSource6
    ParentFont = False
    TabOrder = 4
    Visible = False
    OnExit = DBLookupComboBox3Exit
  end
end
