object fmPrint: TfmPrint
  Left = 269
  Top = 45
  Width = 1006
  Height = 783
  Caption = #1055#1088#1086#1089#1084#1086#1090#1088' '#1088#1077#1079#1091#1083#1100#1090#1072#1090#1086#1074' '#1090#1077#1089#1090#1080#1088#1086#1074#1072#1085#1080#1103
  Color = clInfoBk
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
  PixelsPerInch = 96
  TextHeight = 18
  object Label1: TLabel
    Left = 320
    Top = 72
    Width = 345
    Height = 24
    Caption = #1042#1099#1073#1086#1088' '#1087#1072#1088#1072#1084#1077#1090#1088#1086#1074' '#1087#1088#1086#1089#1084#1086#1090#1088#1072
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Bookman Old Style'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Button1: TButton
    Left = 440
    Top = 512
    Width = 121
    Height = 33
    Caption = #1055#1088#1086#1089#1084#1086#1090#1088
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    OnClick = Button1Click
  end
  object DBGrid1: TDBGrid
    Left = 616
    Top = 608
    Width = 273
    Height = 105
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -16
    TitleFont.Name = 'Verdana'
    TitleFont.Style = []
    Visible = False
  end
  object Panel1: TPanel
    Left = 120
    Top = 160
    Width = 713
    Height = 281
    BevelOuter = bvNone
    Color = clInfoBk
    TabOrder = 2
    object Label4: TLabel
      Left = 40
      Top = 71
      Width = 8
      Height = 18
      Alignment = taCenter
      Caption = #1089
      Color = clInfoBk
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Verdana'
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object Label8: TLabel
      Left = 448
      Top = 207
      Width = 86
      Height = 18
      Caption = #1055#1088#1086#1092#1077#1089#1089#1080#1103
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
    end
    object Label7: TLabel
      Left = 40
      Top = 207
      Width = 99
      Height = 18
      Caption = #1055#1088#1077#1076#1087#1088#1080#1103#1090#1080#1077
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
    end
    object Label6: TLabel
      Left = 40
      Top = 127
      Width = 89
      Height = 18
      Caption = #1042#1080#1076' '#1088#1072#1073#1086#1090#1099
      Color = clInfoBk
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Verdana'
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object Label5: TLabel
      Left = 224
      Top = 71
      Width = 19
      Height = 18
      Alignment = taCenter
      Caption = #1076#1086
      Color = clInfoBk
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Verdana'
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object Label3: TLabel
      Left = 488
      Top = 31
      Width = 68
      Height = 18
      Caption = #1060#1072#1084#1080#1083#1080#1103
      Color = clInfoBk
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Verdana'
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object Label2: TLabel
      Left = 152
      Top = 31
      Width = 136
      Height = 18
      Caption = #1044#1072#1090#1072' '#1088#1077#1075#1080#1089#1090#1088#1072#1094#1080#1080
      Color = clInfoBk
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Verdana'
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object Edit1: TEdit
      Left = 488
      Top = 63
      Width = 217
      Height = 26
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
    end
    object DBLookupComboBox3: TDBLookupComboBox
      Left = 448
      Top = 239
      Width = 225
      Height = 26
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Verdana'
      Font.Style = []
      KeyField = 'Kod'
      ListField = 'Name'
      ListSource = DataModule2.DataSource2
      ParentFont = False
      TabOrder = 1
    end
    object DBLookupComboBox2: TDBLookupComboBox
      Left = 40
      Top = 239
      Width = 361
      Height = 26
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Verdana'
      Font.Style = []
      KeyField = 'Kod'
      ListField = 'Name'
      ListSource = DataModule2.DataSource5
      ParentFont = False
      TabOrder = 2
    end
    object DBLookupComboBox1: TDBLookupComboBox
      Left = 40
      Top = 159
      Width = 609
      Height = 26
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Verdana'
      Font.Style = []
      KeyField = 'Kod'
      ListField = 'Name'
      ListSource = DataModule2.DataSource4
      ParentFont = False
      TabOrder = 3
    end
    object DateTimePicker2: TDateTimePicker
      Left = 264
      Top = 63
      Width = 121
      Height = 26
      Date = 43636.678827002320000000
      Format = '    '
      Time = 43636.678827002320000000
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
      OnChange = DateTimePicker2Change
    end
    object DateTimePicker1: TDateTimePicker
      Left = 64
      Top = 63
      Width = 129
      Height = 26
      Date = 36526.678330601860000000
      Format = '         '
      Time = 36526.678330601860000000
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      TabOrder = 5
      OnChange = DateTimePicker1Change
    end
  end
  object WordDocument1: TWordDocument
    AutoConnect = False
    ConnectKind = ckRunningOrNew
    Left = 144
    Top = 656
  end
  object WordApplication1: TWordApplication
    AutoConnect = False
    ConnectKind = ckRunningOrNew
    AutoQuit = False
    Left = 216
    Top = 656
  end
  object WordParagraphFormat1: TWordParagraphFormat
    AutoConnect = False
    ConnectKind = ckRunningOrNew
    Left = 328
    Top = 672
  end
end
