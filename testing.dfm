object fmTesting: TfmTesting
  Left = -251
  Top = 125
  Width = 957
  Height = 687
  Anchors = []
  Caption = #1056#1077#1079#1091#1083#1100#1090#1072#1090#1099' '#1090#1077#1089#1090#1080#1088#1086#1074#1072#1085#1080#1103
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
    941
    649)
  PixelsPerInch = 96
  TextHeight = 18
  object Label1: TLabel
    Left = 288
    Top = 40
    Width = 300
    Height = 24
    Caption = #1056#1077#1079#1091#1083#1100#1090#1072#1090#1099' '#1090#1077#1089#1090#1080#1088#1086#1074#1072#1085#1080#1103
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Bookman Old Style'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object DBGrid1: TDBGrid
    Left = 98
    Top = 88
    Width = 722
    Height = 481
    Anchors = []
    DataSource = DataModule2.DataSource7
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Verdana'
    TitleFont.Style = []
    OnDrawColumnCell = DBGrid1DrawColumnCell
    Columns = <
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'Data'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Verdana'
        Font.Style = []
        Title.Alignment = taCenter
        Title.Caption = #1044#1072#1090#1072
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -13
        Title.Font.Name = 'Verdana'
        Title.Font.Style = []
        Width = 88
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'INN'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Verdana'
        Font.Style = []
        Title.Alignment = taCenter
        Title.Caption = #1048#1053#1053
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -13
        Title.Font.Name = 'Verdana'
        Title.Font.Style = []
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Work1'
        Title.Alignment = taCenter
        Title.Caption = #1056#1072#1073#1086#1090#1072
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'Rez1'
        Title.Alignment = taCenter
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'Ball1'
        Title.Alignment = taCenter
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'Rez2'
        Title.Alignment = taCenter
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'Ball2'
        Title.Alignment = taCenter
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'Rez3'
        Title.Alignment = taCenter
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'Ball3'
        Title.Alignment = taCenter
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'Rez4'
        Title.Alignment = taCenter
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'Ball4'
        Title.Alignment = taCenter
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'Rez5'
        Title.Alignment = taCenter
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'Ball5'
        Title.Alignment = taCenter
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'Rez6'
        Title.Alignment = taCenter
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'Ball6'
        Title.Alignment = taCenter
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'Rez7'
        Title.Alignment = taCenter
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'Ball7'
        Title.Alignment = taCenter
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'Rez8'
        Title.Alignment = taCenter
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'Ball8'
        Title.Alignment = taCenter
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'Rez9'
        Title.Alignment = taCenter
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'Ball9'
        Title.Alignment = taCenter
        Width = 47
        Visible = True
      end>
  end
  object DBNavigator1: TDBNavigator
    Left = 424
    Top = 584
    Width = 280
    Height = 25
    DataSource = DataModule2.DataSource7
    TabOrder = 1
  end
end
