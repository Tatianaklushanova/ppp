object fmWork: TfmWork
  Left = 87
  Top = 34
  Width = 1200
  Height = 510
  Anchors = [akLeft]
  Caption = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082' '#1074#1080#1076#1086#1074' '#1088#1072#1073#1086#1090
  Color = clMoneyGreen
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  WindowState = wsMaximized
  OnClose = FormClose
  OnShow = FormShow
  DesignSize = (
    1184
    472)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 432
    Top = 32
    Width = 289
    Height = 24
    Caption = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082' '#1074#1080#1076#1086#1074' '#1088#1072#1073#1086#1090
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Bookman Old Style'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object DBGrid1: TDBGrid
    Left = 7
    Top = 80
    Width = 1153
    Height = 321
    Anchors = []
    Color = clWhite
    DataSource = DataModule2.DataSource4
    FixedColor = clWhite
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDrawColumnCell = DBGrid1DrawColumnCell
    Columns = <
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'Kod'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Verdana'
        Font.Style = []
        Title.Alignment = taCenter
        Title.Caption = #1050#1086#1076
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -12
        Title.Font.Name = 'Verdana'
        Title.Font.Style = []
        Width = 45
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Name'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Verdana'
        Font.Style = []
        Title.Alignment = taCenter
        Title.Caption = #1053#1072#1079#1074#1072#1085#1080#1077' '#1088#1072#1073#1086#1090#1099
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -12
        Title.Font.Name = 'Verdana'
        Title.Font.Style = []
        Width = 611
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Fm1'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = []
        Title.Alignment = taCenter
        Title.Caption = #1058#1077#1089#1090'1'
        Width = 156
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Fm2'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = []
        Title.Alignment = taCenter
        Title.Caption = #1058#1077#1089#1090'2'
        Width = 168
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Fm3'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = []
        Title.Alignment = taCenter
        Title.Caption = #1058#1077#1089#1090'3'
        Width = 140
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Fm4'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = []
        Title.Alignment = taCenter
        Title.Caption = #1058#1077#1089#1090'4'
        Width = 118
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Fm5'
        Title.Alignment = taCenter
        Title.Caption = #1058#1077#1089#1090'5'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Fm6'
        Title.Alignment = taCenter
        Title.Caption = #1058#1077#1089#1090'6'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Fm7'
        Title.Alignment = taCenter
        Title.Caption = #1058#1077#1089#1090'7'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Fm8'
        Title.Alignment = taCenter
        Title.Caption = #1058#1077#1089#1090'8'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Fm9'
        Title.Alignment = taCenter
        Title.Caption = #1058#1077#1089#1090'9'
        Visible = True
      end>
  end
  object DBNavigator1: TDBNavigator
    Left = 352
    Top = 416
    Width = 280
    Height = 25
    DataSource = DataModule2.DataSource4
    TabOrder = 1
  end
end
