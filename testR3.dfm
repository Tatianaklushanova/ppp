object fmTestR3: TfmTestR3
  Left = 151
  Top = 186
  Width = 920
  Height = 716
  Caption = #1056#1077#1072#1082#1094#1080#1103' '#1085#1072' '#1076#1074#1080#1078#1091#1097#1080#1081#1089#1103' '#1086#1073#1098#1077#1082#1090
  Color = clGradientInactiveCaption
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'Verdana'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  WindowState = wsMaximized
  OnMouseDown = FormMouseDown
  OnMouseMove = FormMouseMove
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 18
  object Label2: TLabel
    Left = 152
    Top = 24
    Width = 357
    Height = 24
    Caption = #1056#1077#1072#1082#1094#1080#1103' '#1085#1072' '#1076#1074#1080#1078#1091#1097#1080#1081#1089#1103' '#1086#1073#1098#1077#1082#1090
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'Bookman Old Style'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label1: TLabel
    Left = 136
    Top = 79
    Width = 6
    Height = 18
  end
  object PB: TPaintBox
    Left = 176
    Top = 136
    Width = 545
    Height = 385
    Color = clBtnFace
    ParentColor = False
    Visible = False
    OnMouseDown = FormMouseDown
    OnPaint = PBPaint
  end
  object Button2: TButton
    Left = 552
    Top = 608
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
  object Button1: TButton
    Left = 144
    Top = 616
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
    OnClick = Button1Click
  end
  object Memo1: TMemo
    Left = 232
    Top = 224
    Width = 577
    Height = 153
    BorderStyle = bsNone
    Color = clGradientInactiveCaption
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Verdana'
    Font.Style = []
    Lines.Strings = (
      #1053#1072' '#1101#1082#1088#1072#1085#1077' '#1084#1072#1103#1090#1085#1080#1082' '#1089#1086#1074#1077#1088#1096#1072#1077#1090' '#1082#1086#1083#1077#1073#1072#1090#1077#1083#1100#1085#1099#1077' '#1076#1074#1080#1078#1077#1085#1080#1103
      #1089' '#1084#1077#1085#1103#1102#1097#1077#1081#1089#1103' '#1089#1082#1086#1088#1086#1089#1090#1100#1102'.'
      ''
      #1055#1088#1080' '#1087#1077#1088#1077#1089#1077#1095#1077#1085#1080#1080' '#1084#1072#1103#1090#1085#1080#1082#1086#1084' '#1074#1077#1088#1090#1080#1082#1072#1083#1100#1085#1086#1081' '#1075#1088#1072#1085#1080#1094#1099' '
      #1074#1085#1080#1079#1091' '#1085#1077#1086#1073#1093#1086#1076#1080#1084#1086' '#1082#1072#1082' '#1084#1086#1078#1085#1086' '#1073#1099#1089#1090#1088#1077#1077' '#1085#1072#1078#1072#1090#1100' '#1083#1077#1074#1091#1102
      #1082#1085#1086#1087#1082#1091' '#1084#1099#1096#1080'.'
      ''
      '')
    ParentFont = False
    TabOrder = 2
  end
  object Button3: TButton
    Left = 760
    Top = 8
    Width = 139
    Height = 33
    Caption = #1055#1088#1077#1088#1074#1072#1090#1100' '#1090#1077#1089#1090
    TabOrder = 3
    OnClick = Button3Click
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 50
    OnTimer = Timer1Timer
    Left = 816
    Top = 608
  end
end
