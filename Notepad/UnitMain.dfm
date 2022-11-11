object Main: TMain
  Left = 1
  Top = 104
  Width = 630
  Height = 460
  Caption = 'Notepad'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = MainMenu
  OldCreateOrder = False
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnResize = FormResize
  PixelsPerInch = 96
  TextHeight = 13
  object Text: TRichEdit
    Left = 0
    Top = 0
    Width = 621
    Height = 413
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Fixedsys'
    Font.Style = []
    HideScrollBars = False
    ParentFont = False
    PlainText = True
    PopupMenu = PopupMenu
    ScrollBars = ssVertical
    TabOrder = 0
    OnChange = TextChange
  end
  object MainMenu: TMainMenu
    Left = 572
    Top = 4
    object File1: TMenuItem
      Caption = '&File'
      object NewFile: TMenuItem
        Caption = '&New'
        OnClick = NewFileClick
      end
      object OpenFile: TMenuItem
        Caption = '&Open'
        OnClick = OpenFileClick
      end
      object SaveFile: TMenuItem
        Caption = '&Save'
        OnClick = SaveFileClick
      end
      object SaveAsFile: TMenuItem
        Caption = 'Save &As...'
        OnClick = SaveAsFileClick
      end
      object N2: TMenuItem
        Caption = '-'
      end
      object PageSetup: TMenuItem
        Caption = 'Page Se&tup...'
        OnClick = PageSetupClick
      end
      object Print: TMenuItem
        Caption = '&Print...'
        OnClick = PrintClick
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object ExitNotepad: TMenuItem
        Caption = 'E&xit'
        OnClick = ExitNotepadClick
      end
    end
    object Edit1: TMenuItem
      Caption = '&Edit'
      object UndoChange: TMenuItem
        Caption = '&Undo'
        ShortCut = 16474
        OnClick = UndoChangeClick
      end
      object N5: TMenuItem
        Caption = '-'
      end
      object CutText: TMenuItem
        Caption = 'Cu&t'
        Enabled = False
        ShortCut = 16472
        OnClick = CutTextClick
      end
      object CopyText: TMenuItem
        Caption = '&Copy'
        Enabled = False
        ShortCut = 16451
        OnClick = CopyTextClick
      end
      object PasteText: TMenuItem
        Caption = '&Paste'
        Enabled = False
        ShortCut = 16470
        OnClick = PasteTextClick
      end
      object DelText: TMenuItem
        Caption = 'De&lete'
        Enabled = False
        ShortCut = 46
      end
      object N4: TMenuItem
        Caption = '-'
      end
      object SelectAllText: TMenuItem
        Caption = 'Select &All'
        ShortCut = 16449
        OnClick = SelectAllTextClick
      end
      object InsertTime: TMenuItem
        Caption = 'Time/&Date'
        ShortCut = 116
        OnClick = InsertTimeClick
      end
      object N3: TMenuItem
        Caption = '-'
      end
      object WordWrap: TMenuItem
        Caption = '&Word Wrap'
        Checked = True
        OnClick = WordWrapClick
      end
      object ChangeFont: TMenuItem
        Caption = 'Set &Font...'
        OnClick = ChangeFontClick
      end
    end
    object Format1: TMenuItem
      Caption = '&Search'
      object FindText: TMenuItem
        Caption = '&Find'
        OnClick = FindTextClick
      end
      object FindNextText: TMenuItem
        Caption = 'Find &Next...'
        ShortCut = 114
        OnClick = FindNextTextClick
      end
      object ReplaceText: TMenuItem
        Caption = '&Replace'
        OnClick = ReplaceTextClick
      end
    end
    object Help1: TMenuItem
      Caption = '&Help'
      object HelpTopics: TMenuItem
        Caption = '&Help Topics'
        OnClick = HelpTopicsClick
      end
      object N6: TMenuItem
        Caption = '-'
      end
      object AboutNotepad: TMenuItem
        Caption = '&About Notepad'
        OnClick = AboutNotepadClick
      end
    end
    object ExtraMenu: TMenuItem
      Caption = 'Extra'
      Visible = False
      object Hide1: TMenuItem
        Caption = 'Hide Menu!'
        ShortCut = 113
        OnClick = Hide1Click
      end
      object N9: TMenuItem
        Caption = '-'
      end
      object StartApp1: TMenuItem
        Caption = 'Start App...'
        OnClick = StartApp1Click
      end
    end
  end
  object OpenDialog: TOpenDialog
    DefaultExt = '*.txt'
    Filter = 'Text Documents [*.txt]|*.txt|All Files|*.*'
    Left = 572
    Top = 40
  end
  object SaveDialog: TSaveDialog
    DefaultExt = '*.txt'
    Filter = 'Text Documents [*.txt]|*.txt|All Files|*.*'
    Left = 572
    Top = 68
  end
  object FontDialog: TFontDialog
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    MinFontSize = 0
    MaxFontSize = 0
    Left = 572
    Top = 104
  end
  object PrinterSetup: TPrinterSetupDialog
    Left = 572
    Top = 144
  end
  object PrintDialog: TPrintDialog
    Options = [poPrintToFile, poPageNums, poSelection, poWarning, poDisablePrintToFile]
    Left = 572
    Top = 172
  end
  object FindDialog: TFindDialog
    Options = [frDown, frHideWholeWord, frWholeWord]
    OnFind = FindDialogFind
    Left = 572
    Top = 200
  end
  object ReplaceDialog: TReplaceDialog
    Options = [frDown, frHideWholeWord, frMatchCase]
    OnReplace = ReplaceDialogReplace
    Left = 572
    Top = 228
  end
  object PopupMenu: TPopupMenu
    Left = 544
    Top = 4
    object PopUpUndo: TMenuItem
      Caption = 'Undo'
      OnClick = PopUpUndoClick
    end
    object N7: TMenuItem
      Caption = '-'
    end
    object PopUpCut: TMenuItem
      Caption = 'Cut'
      OnClick = PopUpCutClick
    end
    object PopUpCopy: TMenuItem
      Caption = 'Copy'
      OnClick = PopUpCopyClick
    end
    object PopUpPaste: TMenuItem
      Caption = 'Paste'
      OnClick = PopUpPasteClick
    end
    object N8: TMenuItem
      Caption = '-'
    end
    object PopUpSelectAll: TMenuItem
      Caption = 'Select All'
      OnClick = PopUpSelectAllClick
    end
  end
end
