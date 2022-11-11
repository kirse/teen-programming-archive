VERSION 5.00
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "comdlg32.ocx"
Begin VB.Form frmMain 
   Caption         =   "Microsoft Word - Document 1"
   ClientHeight    =   375
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   5625
   Icon            =   "frmMain.frx":0000
   LinkTopic       =   "Form1"
   ScaleHeight     =   375
   ScaleWidth      =   5625
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton Command3 
      Caption         =   "up"
      Height          =   495
      Left            =   4770
      TabIndex        =   4
      Top             =   -60
      Width           =   945
   End
   Begin VB.Timer tmrCheck 
      Interval        =   1000
      Left            =   60
      Top             =   30
   End
   Begin VB.CommandButton Command2 
      Caption         =   "x"
      Height          =   255
      Left            =   4350
      TabIndex        =   3
      Top             =   60
      Width           =   345
   End
   Begin MSComDlg.CommonDialog cdl 
      Left            =   5160
      Top             =   300
      _ExtentX        =   847
      _ExtentY        =   847
      _Version        =   393216
   End
   Begin VB.CommandButton Command1 
      Caption         =   "..."
      Height          =   255
      Left            =   3900
      TabIndex        =   2
      Top             =   60
      Width           =   405
   End
   Begin VB.TextBox txtFilter 
      Appearance      =   0  'Flat
      Height          =   255
      Left            =   3210
      TabIndex        =   1
      Text            =   "*.*"
      Top             =   60
      Width           =   615
   End
   Begin VB.TextBox txtFile 
      Appearance      =   0  'Flat
      Height          =   255
      Left            =   90
      TabIndex        =   0
      Top             =   60
      Width           =   3075
   End
End
Attribute VB_Name = "frmMain"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub Command1_Click()
    On Error Resume Next
    cdl.Filter = txtFilter.Text & " | " & txtFilter.Text
    cdl.ShowOpen
    txtFile.Text = cdl.FileName
End Sub

Private Sub Command2_Click()
    On Error Resume Next
    AppActivate (Shell(txtFile.Text, vbMinimizedNoFocus)), False
End Sub

Private Sub Command3_Click()
    frmMain.Top = -1000
End Sub

Private Sub Form_Load()
    frmMain.Top = 0
    frmMain.Left = 0
End Sub

Private Sub tmrCheck_Timer()
    On Error Resume Next
    Dim x As Long
    Dim y As Long
    x = GetX()
    y = GetY()
    
    If (x = 0) And (y = 0) Then
        frmMain.Top = 0
        frmMain.Left = 0
    End If
End Sub
