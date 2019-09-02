object fmTestMemoryVision: TfmTestMemoryVision
  Left = 246
  Top = 510
  Width = 916
  Height = 708
  BorderIcons = []
  BorderWidth = 2
  Caption = #1058#1077#1089#1090' '#1085#1072' '#1079#1088#1080#1090#1077#1083#1100#1085#1091#1102' '#1087#1072#1084#1103#1090#1100
  Color = clGradientInactiveCaption
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'Verdana'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  WindowState = wsMaximized
  OnMouseMove = FormMouseMove
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 18
  object Label1: TLabel
    Left = 312
    Top = 281
    Width = 77
    Height = 18
    Caption = #1054#1089#1090#1072#1083#1086#1089#1100' '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
    Visible = False
  end
  object Label2: TLabel
    Left = 432
    Top = 281
    Width = 53
    Height = 18
    Caption = #1089#1077#1082#1091#1085#1076
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
    Visible = False
  end
  object Memo1: TMemo
    Left = 136
    Top = 40
    Width = 625
    Height = 137
    BorderStyle = bsNone
    Color = clGradientInactiveCaption
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'Verdana'
    Font.Style = [fsBold]
    Lines.Strings = (
      #1052#1086#1083#1086#1090#1086#1082'        '#1051#1072#1084#1087#1072'            '#1064#1072#1093#1090#1072'              '#1050#1085#1080#1075#1072'      '
      ''
      #1040#1074#1072#1088#1080#1103'          '#1064#1083#1103#1087#1072'            '#1055#1086#1078#1072#1088'             '#1042#1086#1076#1072
      ''
      #1052#1072#1096#1080#1085#1072'         '#1043#1074#1086#1079#1076#1100'            '#1047#1072#1074#1086#1076'              '#1054#1082#1085#1086
      ' ')
    ParentFont = False
    ReadOnly = True
    TabOrder = 1
  end
  object StringGrid1: TStringGrid
    Left = 104
    Top = 368
    Width = 704
    Height = 210
    BorderStyle = bsNone
    ColCount = 6
    DefaultColWidth = 140
    DefaultRowHeight = 50
    FixedCols = 0
    RowCount = 4
    FixedRows = 0
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    OnDrawCell = StringGrid1DrawCell
    OnSelectCell = StringGrid1SelectCell
  end
  object Edit1: TEdit
    Left = 392
    Top = 272
    Width = 33
    Height = 26
    TabOrder = 2
    Visible = False
  end
  object Button1: TButton
    Left = 440
    Top = 624
    Width = 140
    Height = 33
    Caption = #1047#1072#1074#1077#1088#1096#1080#1090#1100
    TabOrder = 3
    Visible = False
    OnClick = Timer2Timer
  end
  object Button3: TButton
    Left = 683
    Top = 8
    Width = 139
    Height = 33
    Caption = #1055#1088#1077#1088#1074#1072#1090#1100' '#1090#1077#1089#1090
    TabOrder = 4
    Visible = False
    OnClick = Button3Click
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 60000
    OnTimer = Timer1Timer
    Left = 992
    Top = 152
  end
  object Timer2: TTimer
    Enabled = False
    Interval = 60000
    OnTimer = Timer2Timer
    Left = 992
    Top = 200
  end
  object Timer3: TTimer
    Enabled = False
    OnTimer = Timer3Timer
    Left = 1008
    Top = 256
  end
end
