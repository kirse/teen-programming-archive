object Main: TMain
  Left = 0
  Top = 103
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Data Lock 2.0'
  ClientHeight = 242
  ClientWidth = 386
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Decrypt: TSpeedButton
    Left = 228
    Top = 208
    Width = 77
    Height = 25
    Caption = '&Decrypt'
    OnClick = DecryptClick
  end
  object Encrypt: TSpeedButton
    Left = 304
    Top = 208
    Width = 73
    Height = 25
    Caption = '&Encrypt'
    OnClick = EncryptClick
  end
  object Panel1: TPanel
    Left = 6
    Top = 4
    Width = 375
    Height = 183
    TabOrder = 0
  end
  object Data: TRichEdit
    Left = 12
    Top = 8
    Width = 363
    Height = 173
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    HideScrollBars = False
    ParentFont = False
    PlainText = True
    ScrollBars = ssVertical
    TabOrder = 1
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 190
    Width = 209
    Height = 47
    Caption = 'Encryption/Decryption Key'
    TabOrder = 2
    object KeyBox: TEdit
      Left = 10
      Top = 18
      Width = 191
      Height = 21
      TabOrder = 0
    end
  end
  object MainMenu: TMainMenu
    Left = 352
    Top = 4
    object File1: TMenuItem
      Caption = '&File'
      object LoadFile: TMenuItem
        Caption = '&Load File...'
        ShortCut = 16460
        OnClick = LoadFileClick
      end
      object SaveFile: TMenuItem
        Caption = '&Save File...'
        ShortCut = 16467
        OnClick = SaveFileClick
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object ExitDataLock: TMenuItem
        Caption = 'E&xit'
        OnClick = ExitDataLockClick
      end
    end
    object Controls1: TMenuItem
      Caption = '&Controls'
      object DecryptData1: TMenuItem
        Caption = '&Decrypt Data'
        ShortCut = 16452
        OnClick = DecryptData1Click
      end
      object EncryptData1: TMenuItem
        Caption = '&Encrypt Data'
        ShortCut = 16472
        OnClick = EncryptData1Click
      end
    end
    object Help1: TMenuItem
      Caption = '&Help'
      object About1: TMenuItem
        Caption = 'Help/About'
        OnClick = About1Click
      end
    end
  end
  object OpenDialog: TOpenDialog
    DefaultExt = '*.txt'
    Filter = 
      'Data-Lock File [*.dlf]|*.dlf|Text File [*.txt]|*.txt|All Files [' +
      '*.*]|*.*'
    Left = 352
    Top = 32
  end
  object SaveDialog: TSaveDialog
    DefaultExt = '*.dlf'
    Filter = 
      'Data-Lock File [*.dlf]|*.dlf|Text File [*.txt]|*.txt|All Files [' +
      '*.*]|*.*'
    Left = 352
    Top = 60
  end
end
