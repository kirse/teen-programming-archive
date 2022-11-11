object Main: TMain
  Left = 2
  Top = 103
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Delphi PortScanner'
  ClientHeight = 280
  ClientWidth = 351
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 8
    Top = 6
    Width = 185
    Height = 51
    Caption = 'Remote Host/IP'
    TabOrder = 0
    object txtHost: TEdit
      Left = 14
      Top = 20
      Width = 159
      Height = 21
      TabOrder = 0
      Text = '127.0.0.1'
    end
  end
  object GroupBox2: TGroupBox
    Left = 198
    Top = 6
    Width = 145
    Height = 51
    Caption = 'Ports to Scan'
    TabOrder = 1
    object Label1: TLabel
      Left = 66
      Top = 24
      Width = 10
      Height = 13
      Caption = 'to'
    end
    object txtFrom: TEdit
      Left = 14
      Top = 20
      Width = 43
      Height = 21
      TabOrder = 0
      Text = '1'
    end
    object txtTo: TEdit
      Left = 84
      Top = 20
      Width = 51
      Height = 21
      TabOrder = 1
      Text = '1000'
    end
  end
  object GroupBox3: TGroupBox
    Left = 8
    Top = 62
    Width = 107
    Height = 49
    Caption = 'Timeout (ms)'
    TabOrder = 2
    object txtInterval: TEdit
      Left = 14
      Top = 18
      Width = 77
      Height = 21
      TabOrder = 0
      Text = '200'
    end
  end
  object beginScan: TButton
    Left = 124
    Top = 64
    Width = 71
    Height = 25
    Caption = 'Begin Scan'
    TabOrder = 3
    OnClick = beginScanClick
  end
  object endScan: TButton
    Left = 194
    Top = 64
    Width = 73
    Height = 25
    Caption = 'End Scan'
    TabOrder = 4
  end
  object resetList: TButton
    Left = 266
    Top = 64
    Width = 75
    Height = 25
    Caption = 'Reset List'
    TabOrder = 5
  end
  object progress: TProgressBar
    Left = 124
    Top = 94
    Width = 215
    Height = 16
    Min = 0
    Max = 100
    TabOrder = 6
    Visible = False
  end
  object Panel1: TPanel
    Left = 10
    Top = 118
    Width = 333
    Height = 135
    TabOrder = 7
    object lstPorts: TListBox
      Left = 6
      Top = 6
      Width = 319
      Height = 123
      ItemHeight = 13
      TabOrder = 0
    end
  end
  object status: TStatusBar
    Left = 0
    Top = 261
    Width = 351
    Height = 19
    Panels = <>
    SimplePanel = False
  end
  object tmrScan: TTimer
    Enabled = False
    Interval = 250
    OnTimer = tmrScanTimer
    Left = 182
  end
  object tcpScan1: TTcpClient
    Left = 366
    Top = 4
  end
  object tcpScan2: TTcpClient
    Left = 366
    Top = 32
  end
  object tcpScan3: TTcpClient
    Left = 366
    Top = 60
  end
end
