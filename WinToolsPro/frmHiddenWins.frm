VERSION 5.00
Begin VB.Form frmHiddenWins 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Hidden Windows"
   ClientHeight    =   3225
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   2940
   BeginProperty Font 
      Name            =   "Tahoma"
      Size            =   8.25
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   Icon            =   "frmHiddenWins.frx":0000
   LinkTopic       =   "Form1"
   LockControls    =   -1  'True
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   3225
   ScaleWidth      =   2940
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton cmdKillWin 
      Caption         =   "Kill Window"
      Height          =   345
      Left            =   1500
      TabIndex        =   2
      Top             =   2790
      Width           =   1245
   End
   Begin VB.CommandButton cmdShowWin 
      Caption         =   "Show Window"
      Height          =   345
      Left            =   270
      TabIndex        =   1
      Top             =   2790
      Width           =   1245
   End
   Begin VB.ListBox lstWins 
      Appearance      =   0  'Flat
      Height          =   1980
      Left            =   90
      TabIndex        =   0
      Top             =   720
      Width           =   2775
   End
   Begin VB.Label Label1 
      Caption         =   "Click an item to show its information in the main screen.  Double-click it to show the window again."
      Height          =   585
      Left            =   90
      TabIndex        =   3
      Top             =   60
      Width           =   2745
   End
End
Attribute VB_Name = "frmHiddenWins"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

'##################################
'    Kill Window
'##################################

Private Sub cmdKillWin_Click()
    Dim DataSplit() As String, ListData As String
    Dim Response
    
    If lstWins.Text = "" Then
        MsgBox "There is no window to kill!", vbExclamation, "Window Tools Professional"
    Else
        If frmMain.chkKill = 1 Then
            Response = MsgBox("Are you sure you want to kill this parent/window?", vbYesNo, "Window Tools Professional")
            
            If Response = vbYes Then
                ListData = lstWins.Text
                DataSplit = Split(ListData, " ")
                Call SendMessage(DataSplit(0), WM_CLOSE, 0&, 0&)
                RemoveListItem lstWins.Text
                
                If frmMain.lblhwnd.Caption = DataSplit(0) Then
                    ClearMain
                End If
            ElseIf Response = vbNo Then
                Exit Sub
            Else
                Exit Sub
            End If
            
        Else
            ListData = lstWins.Text
            DataSplit = Split(ListData, " ")
            Call SendMessage(DataSplit(0), WM_CLOSE, 0&, 0&)
            RemoveListItem lstWins.Text
            
            If frmMain.lblhwnd.Caption = DataSplit(0) Then
                ClearMain
            End If
        End If
    End If
End Sub

'##################################
'    Show Hidden Window
'##################################

Private Sub cmdShowWin_Click()
    Dim DataSplit() As String, ListData As String
    
    If lstWins.Text = "" Then
        MsgBox "There is no window to show!  If you have a list, you must select one first.", vbExclamation, "Window Tools Professional"
    Else
        ListData = lstWins.Text
        DataSplit = Split(ListData, " ")
        ShowWin (CLng(DataSplit(0)))
        RemoveListItem lstWins.Text
    End If
End Sub

Private Sub lstWins_Click()
    ' This function will show the specs of a window someone has hidden
    '   on the main screen.
    
    Dim DataSplit() As String, ListData As String
        
    If lstWins.Text = "" Then
        Exit Sub
    End If
    
    ListData = lstWins.Text
    DataSplit = Split(ListData, " ")        ' split up our text to get the right data
    WindowSpyUpdate (CLng(DataSplit(0)))    ' update main screen
End Sub

Private Sub lstWins_DblClick()
    ' the person can also double-click an item to un-hide it!!!
    
    Dim DataSplit() As String, ListData As String
    If lstWins.Text = "" Then
        MsgBox "There is no window to show!  If you have a list, you must select one first.", vbExclamation, "Window Tools Professional"
    Else
        ListData = lstWins.Text
        DataSplit = Split(ListData, " ")
        ShowWin (CLng(DataSplit(0)))
        RemoveListItem lstWins.Text
    End If
End Sub

Public Sub ShowWin(hWnd As Long)
    ' obvious...
    Call ShowWindow(hWnd, SW_SHOW)
End Sub

Public Sub ClearMain()
    frmMain.lblhwnd.Caption = "[none]"
    frmMain.lblText.Caption = "[none]"
    frmMain.lblClass.Caption = "[none]"
    frmMain.lblParent.Caption = "[none]"
    frmMain.lblParentText.Caption = "[none]"
    frmMain.lblParenthWnd.Caption = "[none]"
End Sub

Private Sub Form_Terminate()
    frmMain.chkHiddenWins = 0
End Sub

Private Sub Form_Unload(Cancel As Integer)
    frmMain.chkHiddenWins = 0
End Sub
