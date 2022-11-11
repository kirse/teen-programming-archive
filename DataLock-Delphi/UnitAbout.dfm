object AboutForm: TAboutForm
  Left = 299
  Top = 130
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'About Data Lock 2.0'
  ClientHeight = 266
  ClientWidth = 256
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
    Left = 20
    Top = 6
    Width = 217
    Height = 39
    Caption = 'Data Lock 2.0'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -32
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
  end
  object Label2: TLabel
    Left = 42
    Top = 52
    Width = 101
    Height = 13
    Caption = 'Written by: Eric Kirse'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    Transparent = True
  end
  object Label3: TLabel
    Left = 42
    Top = 72
    Width = 130
    Height = 13
    Caption = 'Email: admin@kirsenet.com'
    Transparent = True
  end
  object Label4: TLabel
    Left = 40
    Top = 92
    Width = 167
    Height = 13
    Caption = 'Website: http://www.kirsenet.com'
    Transparent = True
  end
  object Agree: TSpeedButton
    Left = 182
    Top = 232
    Width = 67
    Height = 25
    Caption = 'OK'
    OnClick = AgreeClick
  end
  object Help: TSpeedButton
    Left = 36
    Top = 232
    Width = 145
    Height = 25
    Caption = 'Associating with .DLF Files'
    OnClick = HelpClick
  end
  object Label5: TLabel
    Left = 23
    Top = 8
    Width = 217
    Height = 39
    Caption = 'Data Lock 2.0'
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Height = -32
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
  end
  object AboutBox: TRichEdit
    Left = 12
    Top = 118
    Width = 237
    Height = 103
    HideScrollBars = False
    Lines.Strings = (
      '===[ About ]============='
      'Data Lock is software written to '
      'provide a medium level of file encryption '
      'for users.  Data Lock is by no means to be '
      'substituted for algorithms such as RC6 or '
      'Rijndael, although it can be a great tool for '
      'encrypting files from general computer'
      'users.  Data Lock is '#169' Eric Kirse.'
      ''
      '===[ Help ]=============='
      ' Encrypting Data'
      '============='
      '1) Load the file of your choice by'
      'accessing the File Menu, or type the'
      'text you want to encrypt.'
      '2) Type an encryption key (this acts like'
      'your password whenever you want to'
      'decrypt the data).'
      '3) Press Encrypt.'
      '4) Optionally save the file if you like'
      'by accessing the File Menu.'
      '============='
      ' Decrypting Data'
      '============='
      '1) Load the file of your choice, or paste'
      'the data to be decrypted by pressing'
      'Ctrl+V (assuming you'#39've copied it).'
      '2) Type the encryption key you used to'
      'encrypt the data (your password).'
      '3) Press Decrypt.'
      '4) Optionally save the file if you like'
      'by accessing the File Menu.'
      ''
      '============='
      ' Other'
      '============='
      'Why can'#39't I load .exe, .dll files, etc?'
      '-Data Lock cannot load binary files'
      'directly.  Please note that if you try'
      'to open them in Notepad and encrypt'
      'them, they will not work after'
      'being decrypted, in most cases.')
    ReadOnly = True
    ScrollBars = ssVertical
    TabOrder = 0
  end
  object AssocBox: TRichEdit
    Left = 12
    Top = 116
    Width = 237
    Height = 105
    HideScrollBars = False
    Lines.Strings = (
      'Windows 2000 Only!'
      '(This can be done in Win98, it is a similar '
      'process)'
      'In order to associate Data Lock with .DLF '
      'files, you must complete a short process:'
      '=========================='
      '1) Open Windows Explorer (right-click on the '
      'Start Button, click Explore...).'
      '2) Navigate to the '#39'Tools'#39' menu; Click '#39'Folder '
      'Options'#39'.'
      '3) Click the '#39'File Types'#39' tab.'
      '4) Click the '#39'New'#39' button.'
      '5) Type the extension as .DLF.'
      '6) Press OK.'
      '7) After the extension has been registered, '
      'navigate through the list of associated files '
      'and find '#39'DLF'#39'.'
      '8) Highlight it and click the '#39'Change'#39' button.'
      '9) Look through the list for Data Lock.  If it is '
      'not there, click '#39'Other...'#39' and locate '
      'DataLock.exe.'
      '10) Press '#39'OK'#39', and you'#39're done!'
      '11) Clicking on .DLF files will now '
      'automatically open them in Data Lock!')
    ReadOnly = True
    ScrollBars = ssVertical
    TabOrder = 1
    Visible = False
  end
end
