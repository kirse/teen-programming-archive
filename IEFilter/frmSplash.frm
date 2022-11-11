VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Begin VB.Form frmSplash 
   BackColor       =   &H00FFFFFF&
   BorderStyle     =   0  'None
   Caption         =   "Security Warning Filter"
   ClientHeight    =   765
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   4245
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
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   765
   ScaleWidth      =   4245
   ShowInTaskbar   =   0   'False
   StartUpPosition =   3  'Windows Default
   Begin MSComctlLib.ProgressBar prog 
      Height          =   255
      Left            =   30
      TabIndex        =   0
      Top             =   480
      Width           =   4185
      _ExtentX        =   7382
      _ExtentY        =   450
      _Version        =   393216
      Appearance      =   0
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "loading..."
      Height          =   195
      Left            =   2850
      TabIndex        =   1
      Top             =   180
      Width           =   690
   End
   Begin VB.Shape shpBack 
      Height          =   765
      Left            =   0
      Top             =   0
      Width           =   4245
   End
   Begin VB.Image imglogo 
      Height          =   525
      Left            =   -150
      Picture         =   "frmSplash.frx":0000
      Top             =   0
      Width           =   3000
   End
End
Attribute VB_Name = "frmSplash"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Sub Form_Load()
    frmSplash.Top = (Screen.Height) / 2.5
    frmSplash.Left = (Screen.Width) / 3
    frmMain.Show
    Unload Me
End Sub
