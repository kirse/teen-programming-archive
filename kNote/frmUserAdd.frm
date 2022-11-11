VERSION 5.00
Begin VB.Form frmUserAdd 
   BorderStyle     =   0  'None
   Caption         =   "Form1"
   ClientHeight    =   1065
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
   ScaleHeight     =   1065
   ScaleWidth      =   3000
   ShowInTaskbar   =   0   'False
   StartUpPosition =   3  'Windows Default
   Begin VB.PictureBox picExit 
      AutoSize        =   -1  'True
      BorderStyle     =   0  'None
      Height          =   150
      Left            =   2760
      ScaleHeight     =   150
      ScaleWidth      =   165
      TabIndex        =   7
      Top             =   75
      Width           =   165
   End
   Begin VB.TextBox txtIP 
      Appearance      =   0  'Flat
      Height          =   255
      Left            =   1020
      TabIndex        =   6
      Top             =   690
      Width           =   1515
   End
   Begin VB.TextBox txtUName 
      Appearance      =   0  'Flat
      Height          =   255
      Left            =   1020
      TabIndex        =   2
      Top             =   390
      Width           =   1515
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
         Caption         =   "Add User to List"
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
         Width           =   1350
      End
   End
   Begin VB.Label Label2 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "Domain/IP:"
      Height          =   195
      Left            =   150
      TabIndex        =   5
      Top             =   720
      Width           =   795
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "UserName:"
      Height          =   195
      Left            =   150
      TabIndex        =   4
      Top             =   420
      Width           =   795
   End
   Begin VB.Label lblAdd 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "add"
      Height          =   195
      Left            =   2640
      TabIndex        =   3
      Top             =   750
      Width           =   270
   End
   Begin VB.Shape Shape1 
      Height          =   945
      Left            =   0
      Top             =   120
      Width           =   3000
   End
End
Attribute VB_Name = "frmUserAdd"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private clsOnTop As New clskNote

Private Sub Form_Load()
    Dim iTemp As Integer
    Set clsOnTop = New clskNote
    
    picTitle.Picture = LoadPicture(skinPath & "\titlesmall.gif")
    picExit.Picture = LoadPicture(skinPath & "\x.gif")
    
    iTemp = ReadINI("General", "keepontop", appDataPath)
    If CBool(iTemp) Then
        clsOnTop.MakeTopMost Me.hWnd
    End If
    
    iTemp = ReadINI("General", "transwin", appDataPath)
    If CBool(iTemp) Then
        MakeTransparent Me.hWnd, 230
    End If
End Sub

Private Sub lblAdd_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
    lblAdd.ForeColor = vbRed
    Dim tUser As String
    
    'check if user entered right stuff
    If Trim(txtUName.Text = "") Or Trim(txtIP.Text = "") Then
        MsgBox "Please enter correct data!", vbOKOnly, "Error"
        Exit Sub
    Else
    'update list with stuff
        frmMain.lstUsers.AddItem txtUName.Text & " - " & txtIP.Text
        totUsers = totUsers + 1
        UpdateUserINIList
    End If
    
    txtUName.Text = ""
    txtIP.Text = ""
    txtUName.SetFocus
End Sub

Private Sub lblAdd_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
    lblAdd.ForeColor = vbBlack
End Sub

Private Sub picExit_Click()
    Unload Me
End Sub

Private Sub picTitle_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
    FormDrag Me
End Sub
