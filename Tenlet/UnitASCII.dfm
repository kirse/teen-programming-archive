object ASCII: TASCII
  Left = 135
  Top = 190
  BorderStyle = bsDialog
  Caption = 'ASCII Database'
  ClientHeight = 114
  ClientWidth = 224
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
    Left = 6
    Top = 6
    Width = 209
    Height = 13
    Caption = 'Enter an ASCII value to return a character.'
  end
  object Label2: TLabel
    Left = 58
    Top = 64
    Width = 39
    Height = 34
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -29
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object AsciiValue: TEdit
    Left = 14
    Top = 28
    Width = 121
    Height = 21
    TabOrder = 0
  end
  object OK: TButton
    Left = 174
    Top = 84
    Width = 45
    Height = 25
    Caption = 'Close'
    TabOrder = 1
  end
end
