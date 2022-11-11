VERSION 5.00
Begin VB.Form frmNotify 
   BackColor       =   &H00C0FFFF&
   BorderStyle     =   0  'None
   Caption         =   "Security Warning Blocked"
   ClientHeight    =   495
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   7545
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
   ScaleHeight     =   495
   ScaleWidth      =   7545
   ShowInTaskbar   =   0   'False
   StartUpPosition =   3  'Windows Default
   Begin VB.Label lblNum 
      Alignment       =   2  'Center
      BackStyle       =   0  'Transparent
      Caption         =   "0"
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
      Left            =   6960
      TabIndex        =   2
      Top             =   150
      Width           =   420
   End
   Begin VB.Label blockedinfo 
      BackStyle       =   0  'Transparent
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
      Left            =   3060
      TabIndex        =   1
      Top             =   150
      Width           =   3765
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "IE Security Warning Filter blocked from:"
      Height          =   195
      Left            =   180
      TabIndex        =   0
      Top             =   150
      Width           =   2850
   End
   Begin VB.Shape shpBack 
      Height          =   495
      Left            =   0
      Top             =   0
      Width           =   7545
   End
End
Attribute VB_Name = "frmNotify"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private FormOnTop As New clsWinTools

Private Sub blockedinfo_Click()
    frmNotify.Hide
End Sub

Private Sub Form_Click()
    frmNotify.Hide
End Sub

Private Sub Form_Load()
    Set FormOnTop = New clsWinTools
    FormOnTop.MakeTopMost frmNotify.hWnd
End Sub

Private Sub Form_Paint()
    lblNum.Caption = numBlocked
End Sub

Private Sub Label1_Click()
    frmNotify.Hide
End Sub
