VERSION 5.00
Begin VB.Form frmConfig 
   BackColor       =   &H00E0E0E0&
   BorderStyle     =   0  'None
   Caption         =   "Configure CS Watch"
   ClientHeight    =   2760
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   3255
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
   ScaleHeight     =   2760
   ScaleWidth      =   3255
   ShowInTaskbar   =   0   'False
   StartUpPosition =   3  'Windows Default
   Begin VB.TextBox txtCSPath 
      Appearance      =   0  'Flat
      Height          =   255
      Left            =   360
      TabIndex        =   8
      Top             =   2070
      Width           =   2655
   End
   Begin VB.TextBox txtRR 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      Height          =   255
      Left            =   840
      TabIndex        =   5
      Top             =   1380
      Width           =   585
   End
   Begin VB.CheckBox chkTransparency 
      BackColor       =   &H00E0E0E0&
      Caption         =   "Enable Transparency"
      Height          =   225
      Left            =   360
      TabIndex        =   2
      Top             =   750
      Width           =   2145
   End
   Begin VB.Label lblCancel 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "cancel"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FFFFFF&
      Height          =   195
      Left            =   2220
      TabIndex        =   10
      Top             =   2490
      Width           =   540
   End
   Begin VB.Line Line1 
      BorderColor     =   &H00FFFFFF&
      X1              =   2850
      X2              =   2850
      Y1              =   2490
      Y2              =   2700
   End
   Begin VB.Label lblOK 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "ok"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FFFFFF&
      Height          =   195
      Left            =   2940
      TabIndex        =   9
      Top             =   2490
      Width           =   210
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "CounterStrike Path:"
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
      Left            =   150
      TabIndex        =   7
      Top             =   1800
      Width           =   1665
   End
   Begin VB.Image imgImages 
      Height          =   225
      Index           =   2
      Left            =   2940
      Picture         =   "frmConfig.frx":0000
      Top             =   60
      Width           =   225
   End
   Begin VB.Image imgImages 
      Height          =   225
      Index           =   0
      Left            =   2940
      Picture         =   "frmConfig.frx":0430
      Top             =   60
      Width           =   240
   End
   Begin VB.Label Label7 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "seconds."
      Height          =   195
      Left            =   1500
      TabIndex        =   6
      Top             =   1410
      Width           =   645
   End
   Begin VB.Label Label6 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "every"
      Height          =   195
      Left            =   360
      TabIndex        =   4
      Top             =   1410
      Width           =   420
   End
   Begin VB.Label Label5 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "Refresh Rate:"
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
      Left            =   150
      TabIndex        =   3
      Top             =   1110
      Width           =   1155
   End
   Begin VB.Label Label2 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "Transparency:"
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
      Left            =   120
      TabIndex        =   1
      Top             =   450
      Width           =   1215
   End
   Begin VB.Label lblTitle 
      BackStyle       =   0  'Transparent
      Caption         =   "configure cswatch"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FFFFFF&
      Height          =   225
      Left            =   810
      TabIndex        =   0
      Top             =   60
      Width           =   1665
   End
   Begin VB.Shape shpBack 
      Height          =   525
      Left            =   0
      Top             =   0
      Width           =   195
   End
   Begin VB.Image imgTitle 
      Height          =   330
      Left            =   0
      Picture         =   "frmConfig.frx":0874
      Top             =   0
      Width           =   3255
   End
   Begin VB.Image imgImages 
      Height          =   225
      Index           =   3
      Left            =   2940
      Picture         =   "frmConfig.frx":5350
      Top             =   60
      Width           =   240
   End
   Begin VB.Image imgBottom 
      Height          =   330
      Left            =   0
      Picture         =   "frmConfig.frx":5794
      Top             =   2430
      Width           =   3255
   End
End
Attribute VB_Name = "frmConfig"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Dim iniFile As String

Private Sub chkTransparency_Click()
    If (chkTransparency) Then
        changeAllTrans 230, 1
        WriteINI "general", "transparency", "1", iniFile
    Else
        changeAllTrans 0, 0
        WriteINI "general", "transparency", "0", iniFile
    End If
End Sub

Private Sub Form_Load()
    iniFile = GetShortFileName(App.Path) & "\" & INI_FILENAME
    shpBack.Width = frmConfig.Width
    shpBack.Height = frmConfig.Height
    
    If (Exists(iniFile)) Then
        chkTransparency = ReadINI("general", "transparency", iniFile)
        txtRR.Text = ReadINI("general", "refreshrate", iniFile)
        txtCSPath.Text = ReadINI("general", "cspath", iniFile)
    Else
        writeDefaultINI iniFile
    End If
End Sub

Private Sub imgImages_MouseDown(Index As Integer, Button As Integer, Shift As Integer, X As Single, Y As Single)
    imgImages(Index).Visible = False
End Sub

Private Sub imgImages_MouseUp(Index As Integer, Button As Integer, Shift As Integer, X As Single, Y As Single)
    imgImages(Index).Visible = True
    If (Index = 2) Then
        Unload frmConfig
    End If
End Sub

Private Sub imgTitle_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
    FormDrag Me
End Sub

Private Sub lblCancel_Click()
    Unload frmConfig
End Sub

Private Sub lblCancel_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
    lblCancel.ForeColor = vbRed
End Sub

Private Sub lblCancel_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
    lblCancel.ForeColor = vbWhite
End Sub

Private Sub lblOK_Click()
    ' write data to ini file
    WriteINI "general", "transparency", chkTransparency, iniFile
    WriteINI "general", "refreshrate", txtRR.Text, iniFile
    WriteINI "general", "cspath", txtCSPath.Text, iniFile
    frmMain.tmrRefresh.Interval = (Val(txtRR.Text) * 1000)
    Unload frmConfig
End Sub

Private Sub lblOK_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
    lblOK.ForeColor = vbRed
End Sub

Private Sub lblOK_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
    lblOK.ForeColor = vbWhite
End Sub

Private Sub lblTitle_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
    FormDrag Me
End Sub
