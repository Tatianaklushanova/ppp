object fmvvod: Tfmvvod
  Left = 590
  Top = 366
  Width = 608
  Height = 338
  BorderIcons = []
  Color = clSkyBlue
  TransparentColor = True
  TransparentColorValue = clGreen
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clMenuText
  Font.Height = -16
  Font.Name = 'Times New Roman'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCloseQuery = FormCloseQuery
  OnShow = FormShow
  DesignSize = (
    592
    300)
  PixelsPerInch = 96
  TextHeight = 19
  object Label1: TLabel
    Left = 136
    Top = 24
    Width = 309
    Height = 24
    Caption = #1042#1074#1077#1076#1080#1090#1077' '#1080#1076#1077#1085#1090#1080#1092#1080#1082#1072#1094#1080#1086#1085#1085#1099#1081' '#1082#1086#1076
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clMenuText
    Font.Height = -20
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 184
    Top = 72
    Width = 78
    Height = 25
    Caption = '111111'
    Color = clWindow
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindow
    Font.Height = -20
    Font.Name = 'Verdana'
    Font.Style = []
    ParentColor = False
    ParentFont = False
  end
  object BitBtn1: TBitBtn
    Left = 144
    Top = 168
    Width = 81
    Height = 33
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    Kind = bkOK
  end
  object BitBtn2: TBitBtn
    Left = 328
    Top = 168
    Width = 89
    Height = 33
    Caption = #1054#1090#1084#1077#1085#1072
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    Kind = bkCancel
  end
  object MaskEdit1: TMaskEdit
    Left = 224
    Top = 72
    Width = 137
    Height = 25
    Anchors = [akTop]
    BevelEdges = []
    BiDiMode = bdRightToLeftNoAlign
    BorderStyle = bsNone
    EditMask = '9999999999;0;'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clMenuText
    Font.Height = -15
    Font.Name = 'Verdana'
    Font.Style = []
    MaxLength = 10
    ParentBiDiMode = False
    ParentFont = False
    TabOrder = 2
    OnClick = MaskEdit1Click
  end
end
