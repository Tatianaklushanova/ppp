object fmTest_ZMRp: TfmTest_ZMRp
  Left = 55
  Top = 82
  Width = 949
  Height = 656
  Caption = #1047#1088#1080#1090#1077#1083#1100#1085#1086'-'#1084#1086#1090#1086#1088#1085#1072#1103' '#1088#1077#1072#1082#1094#1080#1103' '#1085#1072' '#1087#1088#1086#1089#1090#1086#1081' '#1088#1072#1079#1076#1088#1072#1078#1080#1090#1077#1083#1100
  Color = clGradientInactiveCaption
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'Verdana'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  WindowState = wsMaximized
  OnMouseDown = PaintBox1MouseDown
  OnMouseMove = FormMouseMove
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 18
  object PaintBox1: TPaintBox
    Left = 48
    Top = 96
    Width = 841
    Height = 417
    Color = clBtnFace
    ParentColor = False
    OnMouseDown = PaintBox1MouseDown
  end
  object Label2: TLabel
    Left = 48
    Top = 72
    Width = 6
    Height = 18
  end
  object Label1: TLabel
    Left = 120
    Top = 40
    Width = 611
    Height = 24
    Caption = #1047#1088#1080#1090#1077#1083#1100#1085#1086'-'#1084#1086#1090#1086#1088#1085#1072#1103' '#1088#1077#1072#1082#1094#1080#1103' '#1085#1072' '#1087#1088#1086#1089#1090#1086#1081' '#1088#1072#1079#1076#1088#1072#1078#1080#1090#1077#1083#1100
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'Bookman Old Style'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Button1: TButton
    Left = 152
    Top = 536
    Width = 140
    Height = 33
    Caption = #1058#1088#1077#1085#1080#1088#1086#1074#1082#1072
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 576
    Top = 528
    Width = 140
    Height = 33
    Caption = #1058#1077#1089#1090#1080#1088#1086#1074#1072#1085#1080#1077
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
    Left = 128
    Top = 192
    Width = 625
    Height = 129
    BorderStyle = bsNone
    Color = clGradientInactiveCaption
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Verdana'
    Font.Style = []
    Lines.Strings = (
      #1053#1072' '#1101#1082#1088#1072#1085#1077' '#1089#1086' '#1089#1083#1091#1095#1072#1081#1085#1086#1081' '#1087#1077#1088#1080#1086#1076#1080#1095#1085#1086#1089#1090#1100#1102' '#1073#1091#1076#1091#1090' '#1087#1086#1103#1074#1083#1103#1090#1100#1089#1103' '
      #1079#1077#1083#1077#1085#1099#1077' '#1082#1088#1091#1075#1080'.'
      ''
      #1055#1088#1080' '#1087#1086#1103#1074#1083#1077#1085#1080#1080' '#1082#1088#1091#1075#1072' '#1085#1077#1086#1073#1093#1086#1076#1080#1084#1086' '#1082#1072#1082' '#1084#1086#1078#1085#1086' '#1073#1099#1089#1090#1088#1077#1077' '
      #1085#1072#1078#1072#1090#1100' '#1085#1072' '#1083#1077#1074#1091#1102' '#1082#1083#1072#1074#1080#1096#1091' '#1084#1099#1096#1080'.')
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
    Visible = False
    OnClick = Button3Click
  end
  object Timer1: TTimer
    Enabled = False
    OnTimer = Timer1Timer
    Left = 848
    Top = 584
  end
  object Timer2: TTimer
    Enabled = False
    Interval = 200
    OnTimer = Timer2Timer
    Left = 888
    Top = 512
  end
  object Timer3: TTimer
    Enabled = False
    Interval = 2000
    OnTimer = Timer3Timer
    Left = 888
    Top = 544
  end
  object Timer4: TTimer
    Enabled = False
    OnTimer = Timer4Timer
    Left = 888
    Top = 584
  end
end
