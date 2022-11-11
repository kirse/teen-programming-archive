object RunAppForm: TRunAppForm
  Left = 0
  Top = 104
  Width = 295
  Height = 56
  BorderIcons = [biSystemMenu]
  Caption = 'Start App...'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object StartAppPath: TEdit
    Left = 4
    Top = 4
    Width = 201
    Height = 21
    TabOrder = 0
    OnKeyPress = StartAppPathKeyPress
  end
  object cmdBrowse: TButton
    Left = 212
    Top = 4
    Width = 25
    Height = 21
    Caption = '...'
    TabOrder = 1
    OnClick = cmdBrowseClick
  end
  object cmdRun: TButton
    Left = 240
    Top = 4
    Width = 41
    Height = 21
    Caption = 'Run'
    TabOrder = 2
    OnClick = cmdRunClick
  end
  object BrowseDialog: TOpenDialog
    DefaultExt = '*.*'
    Filter = 
      'All Files [*.*]|*.*|Applications [*.exe]|*.exe|Batch Files [*.ba' +
      't]|*.bat|COM Files [*.com]|*.com|MSC Files [*.msc]|*.msc'
    Title = 'Browse...'
    Left = 284
  end
end
