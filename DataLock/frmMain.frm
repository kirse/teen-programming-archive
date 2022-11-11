VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Object = "{3B7C8863-D78F-101B-B9B5-04021C009402}#1.2#0"; "RICHTX32.OCX"
Begin VB.Form frmMain 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Data Lock 1.0"
   ClientHeight    =   2565
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   5355
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   2565
   ScaleWidth      =   5355
   StartUpPosition =   3  'Windows Default
   Begin MSComctlLib.ProgressBar progress 
      Height          =   240
      Left            =   105
      TabIndex        =   6
      Top             =   1620
      Visible         =   0   'False
      Width           =   5115
      _ExtentX        =   9022
      _ExtentY        =   423
      _Version        =   393216
      Appearance      =   0
   End
   Begin RichTextLib.RichTextBox Data 
      Height          =   1785
      Left            =   75
      TabIndex        =   5
      Top             =   90
      Width           =   5175
      _ExtentX        =   9128
      _ExtentY        =   3149
      _Version        =   393217
      BorderStyle     =   0
      Enabled         =   -1  'True
      ScrollBars      =   2
      AutoVerbMenu    =   -1  'True
      TextRTF         =   $"frmMain.frx":0000
   End
   Begin VB.TextBox Key 
      Height          =   285
      Left            =   75
      TabIndex        =   2
      Top             =   2160
      Width           =   1380
   End
   Begin VB.CommandButton cmdDec 
      Caption         =   "Decrypt"
      Height          =   345
      Left            =   4185
      TabIndex        =   1
      Top             =   2040
      Width           =   1065
   End
   Begin VB.CommandButton cmdEnc 
      Caption         =   "Encrypt"
      Height          =   345
      Left            =   3105
      TabIndex        =   0
      Top             =   2040
      Width           =   1080
   End
   Begin VB.Label lblChars 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   195
      Left            =   1545
      TabIndex        =   4
      Top             =   2205
      Width           =   45
   End
   Begin VB.Label Label1 
      BackStyle       =   0  'Transparent
      Caption         =   "Encryption Key:"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Left            =   105
      TabIndex        =   3
      Top             =   1920
      Width           =   1350
   End
End
Attribute VB_Name = "frmMain"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub cmdDec_Click()
    Dim ReturnVal As Boolean
   ReturnVal = KeyCheck(Key.Text, Data.Text)
    
    If ReturnVal = True Then
        Data.Text = DecryptData(Data.Text)
     Else
        MsgBox "The encryption key enetered is invalid.", vbExclamation, "Error"
    End If
End Sub

Private Sub cmdEnc_Click()
    KeyCode (Key.Text)
    Data.Text = EncryptData(Data.Text)
End Sub

Private Sub Key_Change()
    lblChars.Caption = Len(Key.Text) & " characters"
End Sub
