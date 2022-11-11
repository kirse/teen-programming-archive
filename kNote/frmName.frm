VERSION 5.00
Begin VB.Form frmName 
   BorderStyle     =   0  'None
   ClientHeight    =   1275
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   3000
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
   ScaleHeight     =   1275
   ScaleWidth      =   3000
   ShowInTaskbar   =   0   'False
   StartUpPosition =   3  'Windows Default
   Begin VB.TextBox txtName 
      Appearance      =   0  'Flat
      Height          =   285
      Left            =   210
      TabIndex        =   3
      Top             =   870
      Width           =   2205
   End
   Begin VB.PictureBox picTitle 
      AutoSize        =   -1  'True
      BorderStyle     =   0  'None
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   300
      Left            =   0
      ScaleHeight     =   300
      ScaleWidth      =   3000
      TabIndex        =   0
      Top             =   0
      Width           =   3000
      Begin VB.Label lblTitle 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "ScreenName Configuration"
         BeginProperty Font 
            Name            =   "Verdana"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   195
         Left            =   90
         TabIndex        =   1
         Top             =   45
         Width           =   2310
      End
   End
   Begin VB.Label lblOK 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "ok"
      Height          =   195
      Left            =   2580
      TabIndex        =   4
      Top             =   930
      Width           =   165
   End
   Begin VB.Label Label1 
      BackStyle       =   0  'Transparent
      Caption         =   "Choose a Name to represent you when sending kNotes:"
      Height          =   465
      Left            =   180
      TabIndex        =   2
      Top             =   390
      Width           =   2640
   End
   Begin VB.Shape Shape1 
      Height          =   1005
      Left            =   0
      Top             =   270
      Width           =   3000
   End
End
Attribute VB_Name = "frmName"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub Form_Load()
    picTitle.Picture = LoadPicture(skinPath & "\titlesmall.gif")
End Sub

Private Sub lblOK_Click()
    If Trim(txtName = "") Then
        MsgBox "Please enter a correct username!", vbOKOnly, "Username"
        Exit Sub
    End If
    
    WriteINI "General", "username", Trim(txtName.Text), appDataPath
    WriteINI "General", "gotuname", "1", appDataPath
    
    uName = Trim(txtName.Text)
    
    frmName.Hide
End Sub

Private Sub lblTitle_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
    FormDrag Me
End Sub

Private Sub picTitle_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
    FormDrag Me
End Sub
