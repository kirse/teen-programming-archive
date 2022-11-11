object Main: TMain
  Left = 53
  Top = 142
  Width = 338
  Height = 121
  Caption = 'Translucent Forms'
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
    Left = 6
    Top = 6
    Width = 146
    Height = 13
    Caption = 'Translucency Amount (0-255):'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 6
    Top = 36
    Width = 28
    Height = 13
    Caption = 'Fade:'
  end
  object Label3: TLabel
    Left = 6
    Top = 74
    Width = 154
    Height = 13
    Caption = 'Please vote if you like this code!'
  end
  object Amount: TEdit
    Left = 154
    Top = 4
    Width = 27
    Height = 21
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    Text = '150'
  end
  object SetTrans: TButton
    Left = 188
    Top = 4
    Width = 49
    Height = 23
    Caption = 'Set'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnClick = SetTransClick
  end
  object MakeOpaque: TButton
    Left = 236
    Top = 4
    Width = 87
    Height = 23
    Caption = 'Make Opaque'
    TabOrder = 2
    OnClick = MakeOpaqueClick
  end
  object FadeIN: TButton
    Left = 36
    Top = 34
    Width = 31
    Height = 23
    Caption = 'IN'
    TabOrder = 3
    OnClick = FadeINClick
  end
  object FadeOUT: TButton
    Left = 66
    Top = 34
    Width = 37
    Height = 23
    Caption = 'OUT'
    TabOrder = 4
    OnClick = FadeOUTClick
  end
  object TimerFadeIN: TTimer
    Enabled = False
    Interval = 5
    OnTimer = TimerFadeINTimer
    Left = 116
    Top = 32
  end
  object TimerFadeOut: TTimer
    Enabled = False
    Interval = 5
    OnTimer = TimerFadeOutTimer
    Left = 144
    Top = 32
  end
end
