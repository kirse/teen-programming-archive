VERSION 5.00
Begin VB.Form frmScreen 
   AutoRedraw      =   -1  'True
   BorderStyle     =   0  'None
   Caption         =   "Microsoft Word - Document 2"
   ClientHeight    =   5910
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   7530
   Icon            =   "frmScreen.frx":0000
   LinkTopic       =   "Form1"
   ScaleHeight     =   5910
   ScaleWidth      =   7530
   ShowInTaskbar   =   0   'False
   StartUpPosition =   3  'Windows Default
   Begin VB.Label Label1 
      BackStyle       =   0  'Transparent
      Caption         =   "X"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   195
      Left            =   90
      TabIndex        =   0
      Top             =   60
      Width           =   135
   End
End
Attribute VB_Name = "frmScreen"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub Form_KeyPress(KeyAscii As Integer)
    Unload frmScreen

    If KeyAscii = 96 Then
        frmMain.Top = 0
        frmMain.Left = 0
        h = False
    End If
End Sub

Private Sub Form_Load()
    frmScreen.Top = 0
    frmScreen.Left = 0
    frmScreen.Width = screen.Width
    frmScreen.Height = screen.Height
    frmScreen.KeyPreview = True
End Sub

Private Sub Label1_Click()
    Unload frmScreen
End Sub
