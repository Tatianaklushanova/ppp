object fmTestChulte: TfmTestChulte
  Left = 130
  Top = 673
  Width = 1008
  Height = 700
  BorderIcons = []
  Caption = #1058#1077#1089#1090' '#1064#1091#1083#1100#1090#1077'-'#1055#1083#1072#1090#1086#1085#1086#1074#1072
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
  object StringGrid1: TStringGrid
    Left = 112
    Top = 168
    Width = 505
    Height = 473
    BorderStyle = bsNone
    ColCount = 7
    DefaultColWidth = 70
    DefaultRowHeight = 65
    FixedColor = clWhite
    FixedCols = 0
    RowCount = 7
    FixedRows = 0
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -32
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    Visible = False
    OnDrawCell = StringGrid1DrawCell
    OnSelectCell = StringGrid1SelectCell
  end
  object Button1: TButton
    Left = 320
    Top = 120
    Width = 185
    Height = 33
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
    Left = 48
    Top = 24
    Width = 897
    Height = 49
    Alignment = taCenter
    BorderStyle = bsNone
    Color = clGradientInactiveCaption
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Verdana'
    Font.Style = []
    Lines.Strings = (
      
        #1042' '#1090#1072#1073#1083#1080#1094#1077' '#1083#1077#1074#1086#1081' '#1082#1085#1086#1087#1082#1086#1081' '#1084#1099#1096#1080' '#1086#1090#1084#1077#1090#1100#1090#1077' '#1095#1080#1089#1083#1072' '#1089#1080#1085#1077#1075#1086' '#1094#1074#1077#1090#1072' '#1074' '#1074#1086#1079#1088#1072 +
        #1089#1090#1072#1102#1097#1077#1084'  '#1087#1086#1088#1103#1076#1082#1077
      '      ')
    ParentFont = False
    TabOrder = 2
  end
  object ListBox1: TListBox
    Left = 696
    Top = 200
    Width = 145
    Height = 275
    Style = lbOwnerDrawFixed
    BorderStyle = bsNone
    Color = clGradientInactiveCaption
    Columns = 3
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Verdana'
    Font.Style = [fsBold]
    IntegralHeight = True
    ItemHeight = 25
    ParentFont = False
    TabOrder = 3
    Visible = False
    OnDrawItem = ListBox1DrawItem
  end
  object Button3: TButton
    Left = 819
    Top = 8
    Width = 139
    Height = 33
    Caption = #1055#1088#1077#1088#1074#1072#1090#1100' '#1090#1077#1089#1090
    TabOrder = 4
    Visible = False
    OnClick = Button3Click
  end
end
