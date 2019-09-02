object fmTestVn: TfmTestVn
  Left = 67
  Top = 101
  Width = 942
  Height = 731
  Caption = #1058#1077#1089#1090' '#1091#1089#1090#1086#1081#1095#1080#1074#1086#1089#1090#1080' '#1082' '#1074#1083#1080#1103#1085#1080#1102' '#1089#1090#1088#1077#1089#1089#1072
  Color = clGradientInactiveCaption
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
    926
    693)
  PixelsPerInch = 96
  TextHeight = 18
  object lError: TLabel
    Left = 64
    Top = 40
    Width = 6
    Height = 18
    Color = clGradientInactiveCaption
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Verdana'
    Font.Style = []
    ParentColor = False
    ParentFont = False
  end
  object PaintBox1: TPaintBox
    Left = 0
    Top = 0
    Width = 929
    Height = 676
    Anchors = []
    OnMouseDown = PaintBox1MouseDown
    OnPaint = PaintBox1Paint
  end
  object Label1: TLabel
    Left = 208
    Top = 80
    Width = 333
    Height = 24
    Caption = #1058#1077#1089#1090' '#1085#1072'  '#1089#1090#1088#1077#1089#1089#1086#1091#1089#1090#1086#1081#1095#1080#1074#1086#1089#1090#1100
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'Bookman Old Style'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Button1: TButton
    Left = 528
    Top = 504
    Width = 140
    Height = 33
    Caption = #1058#1077#1089#1090#1080#1088#1086#1074#1072#1085#1080#1077
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -17
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    OnClick = Button2Click
  end
  object Button2: TButton
    Left = 152
    Top = 504
    Width = 140
    Height = 33
    Caption = #1058#1088#1077#1085#1080#1088#1086#1074#1082#1072
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnClick = Button2Click
  end
  object Memo1: TMemo
    Left = 48
    Top = 184
    Width = 801
    Height = 169
    BevelEdges = []
    BevelInner = bvNone
    BevelOuter = bvNone
    BorderStyle = bsNone
    Color = clGradientInactiveCaption
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -19
    Font.Name = 'Verdana'
    Font.Style = []
    Lines.Strings = (
      
        #1053#1072' '#1101#1082#1088#1072#1085#1077' '#1089#1086' '#1089#1083#1091#1095#1072#1081#1085#1086#1081' '#1087#1077#1088#1080#1086#1076#1080#1095#1085#1086#1089#1090#1100#1102' '#1073#1091#1076#1091#1090' '#1074#1086#1079#1085#1080#1082#1072#1090#1100' '#1087#1072#1076#1072#1102#1097#1080#1077' '#1082 +
        #1080#1088#1087#1080#1095#1080'.'
      #1042#1072#1084' '#1085#1077#1086#1073#1093#1086#1076#1080#1084#1086' '#1082#1072#1082' '#1084#1086#1078#1085#1086' '#1073#1099#1089#1090#1088#1077#1077' '#1085#1072#1078#1072#1090#1100' '#1083#1077#1074#1091#1102' '#1082#1083#1072#1074#1080#1096#1091'  '#1084#1099#1096#1080
      #1074' '#1084#1086#1084#1077#1085#1090' '#1082#1072#1089#1072#1085#1080#1103' '#1082#1080#1088#1087#1080#1095#1086#1084' '#1075#1086#1088#1080#1079#1086#1085#1090#1072#1083#1100#1085#1086#1081' '#1083#1080#1085#1080#1080'.'
      ''
      #1047#1072#1090#1077#1084' '#1073#1091#1076#1091#1090' '#1074#1086#1079#1085#1080#1082#1072#1090#1100' '#1088#1072#1079#1083#1080#1095#1085#1099#1077' '#1087#1086#1084#1077#1093#1080'.'
      #1042#1099' '#1076#1086#1083#1078#1085#1099' '#1085#1077' '#1086#1073#1088#1072#1097#1072#1103' '#1074#1085#1080#1084#1072#1085#1080#1103' '#1085#1072' '#1087#1086#1084#1077#1093#1080' '#1087#1088#1086#1076#1086#1083#1078#1072#1090#1100'  '#1085#1072#1078#1080#1084#1072#1090#1100
      
        #1083#1077#1074#1091#1102' '#1082#1083#1072#1074#1080#1096#1091' '#1084#1099#1096#1080' '#1074' '#1084#1086#1084#1077#1085#1090' '#1082#1072#1089#1072#1085#1080#1103' '#1082#1080#1088#1087#1080#1095#1086#1084' '#1075#1086#1088#1080#1079#1086#1085#1090#1072#1083#1100#1085#1086#1081' '#1083#1080#1085#1080 +
        #1080'.'
      '')
    ParentFont = False
    TabOrder = 2
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 500
    OnTimer = Timer1Timer
    Left = 816
    Top = 616
  end
end
