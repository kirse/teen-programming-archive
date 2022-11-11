VERSION 5.00
Begin VB.Form frmOptions 
   BorderStyle     =   0  'None
   Caption         =   "Form1"
   ClientHeight    =   1755
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
   ScaleHeight     =   1755
   ScaleWidth      =   3000
   ShowInTaskbar   =   0   'False
   StartUpPosition =   3  'Windows Default
   Begin VB.CheckBox chkOnTop 
      Caption         =   "Keep On Top"
      Height          =   255
      Left            =   210
      TabIndex        =   5
      Top             =   1260
      Width           =   1245
   End
   Begin VB.CheckBox chkLogNotes 
      Caption         =   "Log kNotes"
      Height          =   195
      Left            =   210
      TabIndex        =   4
      Top             =   930
      Value           =   1  'Checked
      Width           =   1395
   End
   Begin VB.CheckBox chkTransForms 
      Caption         =   "Translucent Windows"
      Height          =   405
      Left            =   210
      TabIndex        =   3
      Top             =   450
      Value           =   1  'Checked
      Width           =   1425
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
      Begin VB.PictureBox picExit 
         AutoSize        =   -1  'True
         BorderStyle     =   0  'None
         Height          =   150
         Left            =   2730
         ScaleHeight     =   150
         ScaleWidth      =   165
         TabIndex        =   2
         Top             =   75
         Width           =   165
      End
      Begin VB.Label lblTitle 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "kNote Options"
         ForeColor       =   &H00FFFFFF&
         Height          =   195
         Left            =   930
         TabIndex        =   1
         Top             =   45
         Width           =   1020
      End
   End
   Begin VB.Shape Shape1 
      Height          =   1485
      Left            =   0
      Top             =   270
      Width           =   3000
   End
   Begin VB.Label lblSave 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "save"
      Height          =   195
      Left            =   2490
      TabIndex        =   6
      Top             =   1380
      Width           =   345
   End
End
Attribute VB_Name = "frmOptions"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private clsOnTop As New clskNote

Private Sub Form_Load()
    Dim iTemp As Integer
    Set clsOnTop = New clskNote
        
    iTemp = ReadINI("General", "keepontop", appDataPath)
    If CBool(iTemp) Then
        clsOnTop.MakeTopMost Me.hWnd
    End If
    
    iTemp = ReadINI("General", "transwin", appDataPath)
    If CBool(iTemp) Then
        MakeTransparent Me.hWnd, 230
    End If
   
    ' load .INI data here
    chkTransForms.Value = ReadINI("General", "transwin", appDataPath)
    chkLogNotes.Value = ReadINI("General", "lognotes", appDataPath)
    chkOnTop.Value = ReadINI("General", "keepontop", appDataPath)
    
    picTitle.Picture = LoadPicture(skinPath & "\titlesmall.gif")
    picExit.Picture = LoadPicture(skinPath & "\x.gif")
End Sub


Private Sub lblSave_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
    Set clsOnTop = New clskNote
    
    lblSave.ForeColor = vbRed
    
    ' save data here in app ini files
    
    'need to save blocked IPs here...
    WriteINI "General", "transwin", str(chkTransForms.Value), appDataPath
    WriteINI "General", "lognotes", str(chkLogNotes.Value), appDataPath
    WriteINI "General", "keepontop", str(chkOnTop.Value), appDataPath
    
    If (chkTransForms) Then
        MakeTransparent Me.hWnd, 230
        MakeTransparent frmMain.hWnd, 230
        MakeTransparent frmUserAdd.hWnd, 230
        MakeTransparent frmName.hWnd, 230
    ElseIf (Not (chkTransForms)) Then
        MakeOpaque Me.hWnd
        MakeOpaque frmMain.hWnd
        MakeOpaque frmUserAdd.hWnd
        MakeOpaque frmName.hWnd
    End If
    
    If (chkOnTop) Then
        clsOnTop.MakeTopMost Me.hWnd
        clsOnTop.MakeTopMost frmMain.hWnd
        clsOnTop.MakeTopMost frmName.hWnd
        clsOnTop.MakeTopMost frmUserAdd.hWnd
    ElseIf (Not (chkOnTop)) Then
        clsOnTop.MakeNormal Me.hWnd
        clsOnTop.MakeNormal frmMain.hWnd
        clsOnTop.MakeNormal frmName.hWnd
        clsOnTop.MakeNormal frmUserAdd.hWnd
    End If
    
    Unload Me
End Sub

Private Sub lblSave_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
    lblSave.ForeColor = vbBlack
End Sub

Private Sub lblTitle_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
    FormDrag Me
End Sub

Private Sub picExit_Click()
    Unload Me
End Sub

Private Sub picTitle_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
    FormDrag Me
End Sub
