object FindMain: TFindMain
  Left = 101
  Top = 200
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Find'
  ClientHeight = 100
  ClientWidth = 354
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 16
    Width = 52
    Height = 13
    Caption = 'Find What:'
  end
  object FindText: TEdit
    Left = 68
    Top = 12
    Width = 189
    Height = 21
    TabOrder = 0
  end
  object cmdFindText: TBitBtn
    Left = 272
    Top = 8
    Width = 75
    Height = 25
    Caption = 'Find Next'
    Default = True
    Enabled = False
    TabOrder = 1
  end
  object cmdCancel: TBitBtn
    Left = 272
    Top = 40
    Width = 75
    Height = 25
    Caption = 'Cancel'
    TabOrder = 2
    OnClick = cmdCancelClick
  end
  object GroupBox1: TGroupBox
    Left = 156
    Top = 48
    Width = 109
    Height = 41
    Caption = 'Direction'
    TabOrder = 3
    object optUp: TRadioButton
      Left = 8
      Top = 20
      Width = 41
      Height = 17
      Caption = 'Up'
      TabOrder = 0
    end
    object optDown: TRadioButton
      Left = 52
      Top = 20
      Width = 49
      Height = 17
      Caption = 'Down'
      Checked = True
      TabOrder = 1
      TabStop = True
    end
  end
  object chkMatchCase: TCheckBox
    Left = 8
    Top = 64
    Width = 97
    Height = 17
    Caption = 'Match Case'
    TabOrder = 4
  end
end
