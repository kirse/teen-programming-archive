VERSION 5.00
Begin VB.Form frmMenus 
   Caption         =   "Menu Form"
   ClientHeight    =   3195
   ClientLeft      =   165
   ClientTop       =   735
   ClientWidth     =   4680
   LinkTopic       =   "Form1"
   ScaleHeight     =   3195
   ScaleWidth      =   4680
   StartUpPosition =   3  'Windows Default
   Begin VB.Menu mnuUserList 
      Caption         =   "UserListMenu"
      Begin VB.Menu mnuDeleteUser 
         Caption         =   "&Delete User"
      End
      Begin VB.Menu mnuAddUser 
         Caption         =   "&Add User"
      End
   End
   Begin VB.Menu popMenu 
      Caption         =   "PopUpMenu"
      Begin VB.Menu mnuShow 
         Caption         =   "&Show kNote"
      End
      Begin VB.Menu mnuSep 
         Caption         =   "-"
      End
      Begin VB.Menu mnuExitKnote 
         Caption         =   "E&xit kNote"
      End
   End
End
Attribute VB_Name = "frmMenus"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub mnuAddUser_Click()
    If (frmMain.Left - frmOptions.Width < 0) Then
        frmUserAdd.Left = frmMain.Left + frmMain.Width + 20
        frmUserAdd.Top = frmMain.Top
        frmUserAdd.Show
        Exit Sub
    Else
        frmUserAdd.Left = frmMain.Left - frmUserAdd.Width - 20
        frmUserAdd.Top = frmMain.Top
        frmUserAdd.Show
    End If
End Sub

Private Sub mnuDeleteUser_Click()
    If Trim(frmMain.lstUsers.Text = "") Then
        Exit Sub
    Else
        frmMain.lstUsers.RemoveItem (frmMain.lstUsers.ListIndex)
        DelLastINIItem
        totUsers = totUsers - 1
        UpdateUserINIList
    End If
End Sub

Private Sub mnuExitKnote_Click()
    WriteINI "General", "xPos", str(frmMain.Left), appDataPath
    WriteINI "General", "yPos", str(frmMain.Top), appDataPath
    frmMain.txtLogData.SaveFile App.Path & "\appdata\logfile.rtf"
    UnloadAll
End Sub

Private Sub mnuShow_Click()
    frmMain.Show
End Sub
