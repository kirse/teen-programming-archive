object GotoForm: TGotoForm
  Left = 163
  Top = 166
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'Goto line'
  ClientHeight = 80
  ClientWidth = 197
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object LineNum: TEdit
    Left = 12
    Top = 12
    Width = 81
    Height = 25
    TabOrder = 0
    Text = '1'
  end
  object cmdOk: TBitBtn
    Left = 112
    Top = 12
    Width = 75
    Height = 25
    Caption = 'OK'
    Default = True
    TabOrder = 1
    OnClick = cmdOkClick
  end
  object cmdCancel: TBitBtn
    Left = 112
    Top = 44
    Width = 75
    Height = 25
    Caption = 'Cancel'
    TabOrder = 2
    OnClick = cmdCancelClick
  end
end
