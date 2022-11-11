object UnitMain: TUnitMain
  Left = 168
  Top = 175
  BorderStyle = bsSingle
  Caption = 'Student Password Teller Machine'
  ClientHeight = 144
  ClientWidth = 336
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 27
    Top = 30
    Width = 103
    Height = 13
    Caption = 'Student'#39's First Name:'
  end
  object Label2: TLabel
    Left = 28
    Top = 56
    Width = 102
    Height = 13
    Caption = 'Student'#39's Last Name:'
  end
  object Label3: TLabel
    Left = 12
    Top = 8
    Width = 312
    Height = 13
    Caption = 'Use this program to automatically figure out a student password.'
  end
  object Label4: TLabel
    Left = 26
    Top = 82
    Width = 103
    Height = 13
    Caption = 'Student'#39's ID Number:'
  end
  object Label5: TLabel
    Left = 76
    Top = 112
    Width = 81
    Height = 13
    Caption = 'Password ------>'
  end
  object Label6: TLabel
    Left = 304
    Top = 130
    Width = 29
    Height = 13
    Cursor = crHandPoint
    Caption = 'a.k.p.'
    OnClick = Label6Click
  end
  object Figure: TSpeedButton
    Left = 264
    Top = 94
    Width = 63
    Height = 23
    Caption = 'Go Figure'
    OnClick = FigureClick
  end
  object FirstName: TEdit
    Left = 134
    Top = 26
    Width = 121
    Height = 21
    TabOrder = 0
  end
  object LastName: TEdit
    Left = 134
    Top = 52
    Width = 121
    Height = 21
    TabOrder = 1
  end
  object idNum: TEdit
    Left = 134
    Top = 78
    Width = 121
    Height = 21
    TabOrder = 2
    OnKeyDown = idNumKeyDown
  end
  object password: TEdit
    Left = 162
    Top = 108
    Width = 93
    Height = 21
    Enabled = False
    TabOrder = 3
  end
end
