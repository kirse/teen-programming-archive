unit UnitMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, Menus, UnitAbout, UnitStartApp, ShellAPI;

type
  TMain = class(TForm)
    Text: TRichEdit;
    MainMenu: TMainMenu;
    File1: TMenuItem;
    N1: TMenuItem;
    Print: TMenuItem;
    PageSetup: TMenuItem;
    N2: TMenuItem;
    SaveAsFile: TMenuItem;
    SaveFile: TMenuItem;
    OpenFile: TMenuItem;
    NewFile: TMenuItem;
    Edit1: TMenuItem;
    InsertTime: TMenuItem;
    SelectAllText: TMenuItem;
    N4: TMenuItem;
    DelText: TMenuItem;
    PasteText: TMenuItem;
    CopyText: TMenuItem;
    CutText: TMenuItem;
    N5: TMenuItem;
    UndoChange: TMenuItem;
    Format1: TMenuItem;
    Help1: TMenuItem;
    AboutNotepad: TMenuItem;
    N6: TMenuItem;
    HelpTopics: TMenuItem;
    OpenDialog: TOpenDialog;
    SaveDialog: TSaveDialog;
    FontDialog: TFontDialog;
    PrinterSetup: TPrinterSetupDialog;
    PrintDialog: TPrintDialog;
    ExitNotepad: TMenuItem;
    FindDialog: TFindDialog;
    ReplaceDialog: TReplaceDialog;
    PopupMenu: TPopupMenu;
    PopUpUndo: TMenuItem;
    N7: TMenuItem;
    PopUpCut: TMenuItem;
    PopUpCopy: TMenuItem;
    PopUpPaste: TMenuItem;
    N8: TMenuItem;
    PopUpSelectAll: TMenuItem;
    N3: TMenuItem;
    WordWrap: TMenuItem;
    ChangeFont: TMenuItem;
    FindText: TMenuItem;
    FindNextText: TMenuItem;
    ReplaceText: TMenuItem;
    ExtraMenu: TMenuItem;
    Hide1: TMenuItem;
    N9: TMenuItem;
    StartApp1: TMenuItem;
    procedure FormResize(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure OpenFileClick(Sender: TObject);
    procedure SaveFileClick(Sender: TObject);
    procedure SaveAsFileClick(Sender: TObject);
    procedure ExitNotepadClick(Sender: TObject);
    procedure PageSetupClick(Sender: TObject);
    procedure PrintClick(Sender: TObject);
    procedure TextChange(Sender: TObject);
    procedure UndoChangeClick(Sender: TObject);
    procedure CutTextClick(Sender: TObject);
    procedure CopyTextClick(Sender: TObject);
    procedure PasteTextClick(Sender: TObject);
    procedure FindTextClick(Sender: TObject);
    procedure SelectAllTextClick(Sender: TObject);
    procedure FindDialogFind(Sender: TObject);
    procedure FindNextTextClick(Sender: TObject);
    procedure ReplaceTextClick(Sender: TObject);
    procedure ReplaceDialogReplace(Sender: TObject);
    procedure InsertTimeClick(Sender: TObject);
    procedure ChangeFontClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure PopUpUndoClick(Sender: TObject);
    procedure PopUpCutClick(Sender: TObject);
    procedure PopUpCopyClick(Sender: TObject);
    procedure PopUpPasteClick(Sender: TObject);
    procedure PopUpSelectAllClick(Sender: TObject);
    procedure WordWrapClick(Sender: TObject);
    procedure AboutNotepadClick(Sender: TObject);
    procedure Hide1Click(Sender: TObject);
    procedure StartApp1Click(Sender: TObject);
    procedure HelpTopicsClick(Sender: TObject);
    procedure NewFileClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Main: TMain;
  TextChanged: Boolean;
  BeenPrompted: Boolean;

implementation

{$R *.dfm}


procedure TMain.FormResize(Sender: TObject);
begin
        if main.Width <= 200 then
        begin
                Text.Visible := False;
        end
        else if main.height <= 50 then
        begin
                Text.Visible := False;
        end
        else
        begin
                Text.Visible := True;
        end;
        Text.Height := Main.Height - 46;
        Text.Width := Main.Width - 9;
end;

procedure TMain.FormCreate(Sender: TObject);
begin
        if (ParamCount > 0) and FileExists(ParamStr(1)) then
        begin
          Text.Lines.LoadFromFile(ParamStr(1));
          Main.Caption := ParamStr(1) + ' - Notepad';
          TextChanged := False;
          Exit;
        end;
        
        Main.Caption := 'Untitled - Notepad';
        TextChanged := False;
        BeenPrompted := False;
end;

procedure TMain.OpenFileClick(Sender: TObject);
begin
        OpenDialog.Execute();
        if OpenDialog.FileName = '' then
          begin
            Exit;
          end
        else
          begin
            Text.Lines.LoadFromFile(OpenDialog.FileName);
            Main.Caption := OpenDialog.FileName + ' - Notepad';
          end;
end;

procedure TMain.SaveFileClick(Sender: TObject);
begin
        SaveDialog.Execute();
        if SaveDialog.FileName = '' then
          begin
            Exit;
          end
        else
          begin
            Text.Lines.SaveToFile(SaveDialog.FileName);
            Main.Caption := SaveDialog.FileName + ' - Notepad';
            TextChanged := False;
          end;
end;

procedure TMain.SaveAsFileClick(Sender: TObject);
begin
        SaveDialog.Execute();
        if SaveDialog.FileName = '' then
          begin
            Exit;
          end
        else
          begin
            Text.Lines.SaveToFile(SaveDialog.FileName);
            Main.Caption := SaveDialog.FileName + ' - Notepad';
            TextChanged := False;
          end;
end;

procedure TMain.ExitNotepadClick(Sender: TObject);
var
        ReturnStr: Integer;
begin
        if TextChanged = True then
          begin
            ReturnStr := MessageDlg('The text in the file has changed.' + Chr(13) + Chr(13) + 'Do you want to save changes?', mtWarning, [mbYes, mbNo, mbCancel], 0);
              if ReturnStr = mrYes then
              begin
                SaveDialog.Execute();
                  if SaveDialog.FileName = '' then
                    begin
                      Exit;
                    end
                  else
                    begin
                      Text.Lines.SaveToFile(SaveDialog.FileName);
                      Main.Caption := SaveDialog.FileName + ' - Notepad';
                      BeenPrompted := True;
                      Close();
                    end;
              end;
              if ReturnStr = mrNo then
                begin
                  BeenPrompted := True;
                  Close();
                end
              else
                begin
                  Exit;
                end;
          end;

        BeenPrompted := True;
        Close();
end;

procedure TMain.PageSetupClick(Sender: TObject);
begin
        PrinterSetup.Execute();
end;

procedure TMain.PrintClick(Sender: TObject);
begin
        if PrintDialog.Execute then
          begin
            Text.Print(Text.Text);
          end;
end;

procedure TMain.TextChange(Sender: TObject);
begin
        TextChanged := True;
end;

procedure TMain.UndoChangeClick(Sender: TObject);
begin
        Text.Undo;
end;

procedure TMain.CutTextClick(Sender: TObject);
begin
        Text.CutToClipboard;
end;

procedure TMain.CopyTextClick(Sender: TObject);
begin
        Text.CopyToClipboard;
end;

procedure TMain.PasteTextClick(Sender: TObject);
begin
        Text.PasteFromClipboard;
end;

procedure TMain.FindTextClick(Sender: TObject);
begin
        FindDialog.Position := Point(Main.Left + 90, Main.Top + 150);
        FindDialog.Execute();
end;

procedure TMain.SelectAllTextClick(Sender: TObject);
begin
        Text.SelectAll;
end;

procedure TMain.FindDialogFind(Sender: TObject);
var
  FoundAt: LongInt;
  StartPos, ToEnd: Integer;
  TempString: AnsiString;
begin
  with Text do
  begin
    if SelLength <> 0 then
      StartPos := SelStart + SelLength
    else
      StartPos := 0;

    ToEnd := Length(Text) - StartPos;

    FoundAt := FindText(FindDialog.FindText, StartPos, ToEnd, [stWholeWord]);
    if FoundAt <> -1 then
    begin
      SetFocus;
      SelStart := FoundAt;
      SelLength := Length(FindDialog.FindText);
      TempString := SelText;
      SelText := '';
      SelText := TempString;
    end;
  end;
end;

procedure TMain.FindNextTextClick(Sender: TObject);
var
  FoundAt: LongInt;
  StartPos, ToEnd: Integer;
  TempString: AnsiString;
begin
  with Text do
  begin
    if SelLength <> 0 then
      StartPos := SelStart + SelLength
    else
      StartPos := 0;

    ToEnd := Length(Text) - StartPos;

    FoundAt := FindText(FindDialog.FindText, StartPos, ToEnd, [stWholeWord]);
    if FoundAt <> -1 then
    begin
      SetFocus;
      SelStart := FoundAt;
      SelLength := Length(FindDialog.FindText);
      TempString := SelText;
      SelText := '';
      SelText := TempString;
    end;
   end;
end;

procedure TMain.ReplaceTextClick(Sender: TObject);
begin
        ReplaceDialog.Execute();
end;

procedure TMain.ReplaceDialogReplace(Sender: TObject);
var
  SelPos: Integer;
begin
  with TReplaceDialog(Sender) do
  begin
    SelPos := Pos(FindText, Text.Lines.Text);
    if SelPos > 0 then
    begin
      Text.SelStart := SelPos - 1;
      Text.SelLength := Length(FindText);
      Text.SelText := ReplaceText;
    end
    else MessageDlg(Concat('Cannot find "', FindText, '"'), mtInformation, [mbOk], 0);

  end;

end;

procedure TMain.InsertTimeClick(Sender: TObject);
begin
        Text.Text := Text.Text + TimeToStr(Time) + ' ' + DateToStr(Date);
end;

procedure TMain.ChangeFontClick(Sender: TObject);
begin
        FontDialog.Execute();
        Text.Font := FontDialog.Font;
end;

procedure TMain.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
var
        ReturnStr: Integer;
begin
        if BeenPrompted = True then
          begin
            Exit;
          end;
          
        if TextChanged = True then
          begin
            ReturnStr := MessageDlg('The text in the file has changed.' + Chr(13) + Chr(13) + 'Do you want to save changes?', mtWarning, [mbYes, mbNo], 0);
              // user said YES
              if ReturnStr = mrYes then
              begin
                SaveDialog.Execute();
                  if SaveDialog.FileName = '' then
                    begin
                      Exit;
                    end
                  else
                    begin
                      Text.Lines.SaveToFile(SaveDialog.FileName);
                      Main.Caption := SaveDialog.FileName + ' - Notepad';
                    end;
              end;
        end;
end;

procedure TMain.PopUpUndoClick(Sender: TObject);
begin
        Text.Undo;
end;

procedure TMain.PopUpCutClick(Sender: TObject);
begin
        Text.CutToClipboard;
end;

procedure TMain.PopUpCopyClick(Sender: TObject);
begin
        Text.CopyToClipboard;
end;

procedure TMain.PopUpPasteClick(Sender: TObject);
begin
        Text.PasteFromClipboard;
end;

procedure TMain.PopUpSelectAllClick(Sender: TObject);
begin
        Text.SelectAll;
end;

procedure TMain.WordWrapClick(Sender: TObject);
begin
        WordWrap.Checked := Not(WordWrap.Checked);
        Text.WordWrap := Not(Text.WordWrap);
end;

procedure TMain.AboutNotepadClick(Sender: TObject);
begin
        AboutForm.Show;
end;

procedure TMain.Hide1Click(Sender: TObject);
begin
        ExtraMenu.Visible := False;
end;

procedure TMain.StartApp1Click(Sender: TObject);
begin
        RunAppForm.Top := Main.Top + 200;
        RunAppForm.Left := Main.Left + 200;
        RunAppForm.Show;
end;

procedure TMain.HelpTopicsClick(Sender: TObject);
begin
        ShellExecute(0,nil,'C:\WINNT\Help\notepad.chm',nil,nil,1);
end;

procedure TMain.NewFileClick(Sender: TObject);
var
        ReturnStr: Integer;
begin
        if TextChanged = True then
        begin
            ReturnStr := MessageDlg('The text in the file has changed.' + Chr(13) + Chr(13) + 'Do you want to save changes?', mtWarning, [mbYes, mbNo, mbCancel], 0);
              if ReturnStr = mrYes then
              begin
                SaveDialog.Execute();
                  if SaveDialog.FileName = '' then
                    begin
                      Exit;
                    end
                  else
                    begin
                      Text.Lines.SaveToFile(SaveDialog.FileName);
                      Main.Caption := SaveDialog.FileName + 'Untitled - Notepad';
                      TextChanged := False;
                      Text.Clear;
                    end;

              end;
              if ReturnStr = mrNo then
                begin
                  Text.Clear;
                  TextChanged := False;
                end
              else
                begin
                  TextChanged := False;
                  Exit;
                end;
        end;
end;


end.
