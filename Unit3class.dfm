object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 477
  ClientWidth = 275
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  DesignSize = (
    275
    477)
  PixelsPerInch = 96
  TextHeight = 13
  object Memo2: TMemo
    Left = 1
    Top = -4
    Width = 73
    Height = 485
    Anchors = [akLeft, akTop, akRight, akBottom]
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ScrollBars = ssVertical
    TabOrder = 1
  end
  object Memo1: TMemo
    Left = 48
    Top = -4
    Width = 233
    Height = 485
    Anchors = [akLeft, akTop, akRight, akBottom]
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    Lines.Strings = (
      #1048#1085#1089#1090#1088#1091#1082#1094#1080#1103
      #1053#1072' '#1080#1082#1086#1085#1091' '#1092#1072#1081#1083#1072' '#1087#1077#1088#1077#1090#1072#1097#1080' '
      'html '#1092#1072#1081#1083'.'
      #1059#1074#1080#1076#1080#1096#1100' '#1082#1072#1082#1080#1077' '#1074' '#1085#1077#1084' '
      #1082#1083#1072#1089#1089#1099'.'
      ''
      #1050#1088#1077#1089#1090#1080#1082' '#1085#1072#1078#1084#1080', '#1083#1072#1087#1086#1090#1100' ;-)')
    ParentFont = False
    ScrollBars = ssVertical
    TabOrder = 0
  end
  object Timer2: TTimer
    Interval = 10
    OnTimer = Timer2Timer
    Left = 168
    Top = 88
  end
end
