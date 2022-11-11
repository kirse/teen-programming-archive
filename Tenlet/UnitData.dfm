object DataTag: TDataTag
  Left = 299
  Top = 180
  Width = 229
  Height = 212
  Caption = 'Data Tagging'
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
    Left = 12
    Top = 10
    Width = 199
    Height = 13
    Caption = 'Append data before and after main data.'
  end
  object chkBefore: TCheckBox
    Left = 14
    Top = 34
    Width = 173
    Height = 17
    Caption = 'Attach Data prior to Main Data'
    TabOrder = 0
  end
  object chkAfter: TCheckBox
    Left = 14
    Top = 82
    Width = 163
    Height = 17
    Caption = 'Attach Data after Main Data'
    TabOrder = 1
  end
  object PreData: TEdit
    Left = 36
    Top = 56
    Width = 139
    Height = 21
    TabOrder = 2
  end
  object PostData: TEdit
    Left = 36
    Top = 102
    Width = 139
    Height = 21
    TabOrder = 3
  end
  object chkReturn: TCheckBox
    Left = 14
    Top = 130
    Width = 131
    Height = 17
    Caption = 'Add carriage return'
    TabOrder = 4
  end
  object ASCII: TButton
    Left = 124
    Top = 158
    Width = 47
    Height = 25
    Caption = 'ASCII'
    TabOrder = 5
  end
  object OK: TButton
    Left = 170
    Top = 158
    Width = 49
    Height = 25
    Caption = 'OK'
    TabOrder = 6
  end
end
