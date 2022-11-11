VERSION 5.00
Begin VB.Form frmMain 
   Caption         =   "IE Security Warning Filter"
   ClientHeight    =   870
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   4215
   BeginProperty Font 
      Name            =   "Tahoma"
      Size            =   8.25
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   LinkTopic       =   "Form1"
   ScaleHeight     =   870
   ScaleWidth      =   4215
   StartUpPosition =   3  'Windows Default
   Begin VB.Timer tmrsearch 
      Enabled         =   0   'False
      Interval        =   500
      Left            =   3780
      Top             =   60
   End
   Begin VB.Frame Frame1 
      Caption         =   "Filter Status"
      Height          =   645
      Left            =   90
      TabIndex        =   0
      Top             =   90
      Width           =   4065
      Begin VB.Label lblstatus 
         AutoSize        =   -1  'True
         Caption         =   "active."
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   195
         Left            =   2910
         TabIndex        =   2
         Top             =   270
         Width           =   570
      End
      Begin VB.Label Label1 
         Caption         =   "Security Warning Filter is currently"
         Height          =   195
         Left            =   390
         TabIndex        =   1
         Top             =   270
         Width           =   2475
      End
   End
End
Attribute VB_Name = "frmMain"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub Form_Load()
    Dim temp As String
    
    Open "C:\ieblocked.txt" For Input As #1
    Input #1, temp
    Close #1
    
    numBlocked = Val(temp)
        
    tmrsearch.Enabled = True
    frmMain.Hide
End Sub

Private Sub Form_Resize()
    If (frmMain.WindowState = 2) Then
        frmMain.WindowState = 0
    End If
    
    If (frmMain.WindowState = 0) Then
        frmMain.Width = 4335
        frmMain.Height = 2205
    End If
End Sub


Private Sub findDialog()
    Dim X As Integer
    
    For X = 0 To 32766
        Dim hwndlength As Long
        Dim FirstWindowText As String
        Dim SecondWindowText As String
        
        Dim pWindow As Long
        Dim pStringBuffer As String
        Dim parentClass As Long
                        
        hwndlength = GetWindowTextLength(X)
        FirstWindowText = String$(hwndlength, 0)
        SecondWindowText = GetWindowText(X, FirstWindowText, (hwndlength + 1))
                        
        If FirstWindowText = "Security Warning" Then
            pWindow = GetParent(X)
            pStringBuffer = String(250, 0)
            parentClass = GetClassName(pWindow, pStringBuffer, 250)
            
            pStringBuffer = Left(pStringBuffer, 7)
            
            If (pStringBuffer = "IEFrame") Then
                    Call SendMessage(X, WM_CLOSE, 0&, 0&)
                        'notify the user (just get the info from checkbox)
                        
                    hwndlength = GetWindowTextLength(pWindow)
                    FirstWindowText = String$(hwndlength, 0)
                    SecondWindowText = GetWindowText(pWindow, FirstWindowText, (hwndlength + 1))
                    FirstWindowText = Left(FirstWindowText, Len(FirstWindowText) - 30)
                    
                    frmNotify.Top = 100
                    frmNotify.Left = 150
                    frmNotify.blockedinfo.Caption = FirstWindowText
                    numBlocked = numBlocked + 1
                    frmNotify.Show
            End If
        End If
    Next X
End Sub

Private Sub Form_Terminate()
    Open "C:\ieblocked.txt" For Output As #1
    Print #1, numBlocked
    Close #1
End Sub

Private Sub Form_Unload(Cancel As Integer)
    Open "C:\ieblocked.txt" For Output As #1
    Print #1, numBlocked
    Close #1
End Sub

Private Sub tmrsearch_Timer()
    Call findDialog
End Sub
