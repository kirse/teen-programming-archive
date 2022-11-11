object Main: TMain
  Left = 214
  Top = 117
  Width = 469
  Height = 320
  BorderIcons = [biSystemMenu, biMinimize, biMaximize, biHelp]
  Caption = 'Tenlet v1.3'
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 270
    Width = 26
    Height = 13
    Caption = 'Host:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 155
    Top = 270
    Width = 24
    Height = 13
    Caption = 'Port:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Data: TMemo
    Left = 4
    Top = 4
    Width = 453
    Height = 235
    Color = clWhite
    Font.Charset = OEM_CHARSET
    Font.Color = clBlack
    Font.Height = -12
    Font.Name = 'Terminal'
    Font.Style = []
    Lines.Strings = (
      'Data')
    ParentFont = False
    ScrollBars = ssVertical
    TabOrder = 0
  end
  object SendData: TEdit
    Left = 4
    Top = 242
    Width = 453
    Height = 20
    Color = clWhite
    Font.Charset = OEM_CHARSET
    Font.Color = clBlack
    Font.Height = -12
    Font.Name = 'Terminal'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnChange = SendDataChange
    OnKeyPress = SendDataKeyPress
  end
  object Host: TEdit
    Left = 36
    Top = 268
    Width = 111
    Height = 21
    Color = clWhite
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
  end
  object Port: TEdit
    Left = 180
    Top = 268
    Width = 35
    Height = 21
    Color = clWhite
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
  end
  object chkReturn: TCheckBox
    Left = 384
    Top = 270
    Width = 73
    Height = 17
    Caption = 'Add (CRLF)'
    Checked = True
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    State = cbChecked
    TabOrder = 4
  end
  object Socket: TPowersock
    Port = 0
    ReportLevel = 0
    OnDisconnect = SocketDisconnect
    OnConnect = SocketConnect
    OnStatus = SocketStatus
    OnConnectionFailed = SocketConnectionFailed
    Left = 428
    Top = 2
  end
end
