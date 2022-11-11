VERSION 5.00
Begin VB.Form frmEditServers 
   BackColor       =   &H00E0E0E0&
   BorderStyle     =   0  'None
   Caption         =   "Edit CS Servers"
   ClientHeight    =   2880
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
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   2880
   ScaleWidth      =   3255
   ShowInTaskbar   =   0   'False
   StartUpPosition =   3  'Windows Default
   Begin VB.ListBox lstSrvs 
      Appearance      =   0  'Flat
      Height          =   1785
      Left            =   60
      TabIndex        =   5
      Top             =   360
      Width           =   3135
   End
   Begin VB.TextBox txtPort 
      Appearance      =   0  'Flat
      Height          =   255
      Left            =   2550
      TabIndex        =   4
      Top             =   2220
      Width           =   615
   End
   Begin VB.TextBox txtServIP 
      Appearance      =   0  'Flat
      Height          =   255
      Left            =   330
      TabIndex        =   3
      Top             =   2220
      Width           =   1755
   End
   Begin VB.Image imgBottom 
      Height          =   330
      Left            =   0
      Picture         =   "frmEditServers.frx":0000
      Top             =   2550
      Width           =   3255
   End
   Begin VB.Image imgImages 
      Height          =   225
      Index           =   2
      Left            =   2940
      Picture         =   "frmEditServers.frx":4ADC
      Top             =   60
      Width           =   225
   End
   Begin VB.Image imgImages 
      Height          =   225
      Index           =   3
      Left            =   2940
      Picture         =   "frmEditServers.frx":4F0C
      Top             =   60
      Width           =   240
   End
   Begin VB.Shape shpBack 
      Height          =   405
      Left            =   0
      Top             =   0
      Width           =   555
   End
   Begin VB.Label Label2 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "Port:"
      Height          =   195
      Left            =   2160
      TabIndex        =   2
      Top             =   2250
      Width           =   360
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "IP:"
      Height          =   195
      Left            =   90
      TabIndex        =   1
      Top             =   2250
      Width           =   210
   End
   Begin VB.Label lblTitle 
      BackStyle       =   0  'Transparent
      Caption         =   "edit cswatch servers"
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
      Left            =   750
      TabIndex        =   0
      Top             =   60
      Width           =   1815
   End
   Begin VB.Image imgTitle 
      Height          =   330
      Left            =   0
      Picture         =   "frmEditServers.frx":5350
      Top             =   0
      Width           =   3255
   End
End
Attribute VB_Name = "frmEditServers"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
' this was designed to be place where people would input servers to
'   monitor.  never got around to it... so implement your own method
'   to populate the classes!

Private Sub Form_Load()
Dim X As Integer
    shpBack.Width = frmEditServers.Width
    shpBack.Height = frmEditServers.Height
    For X = 0 To MAX_SERVERS
        lstSrvs.AddItem str(X) & ":" & str(X)
    Next X
End Sub

Private Sub imgImages_MouseDown(Index As Integer, Button As Integer, Shift As Integer, X As Single, Y As Single)
    If (Index = 2) Then imgImages(Index).Visible = False
End Sub

Private Sub imgImages_MouseUp(Index As Integer, Button As Integer, Shift As Integer, X As Single, Y As Single)
    imgImages(Index).Visible = True
    If (Index = 2) Then
        Unload frmEditServers
    End If
End Sub

Private Sub imgTitle_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
    FormDrag Me
End Sub

Private Sub lblTitle_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
    FormDrag Me
End Sub

Private Sub lstSrvs_Click()
    Dim dataSplit() As String
    dataSplit() = Split(lstSrvs.Text, ":")
    txtServIP.Text = dataSplit(0)
    txtPort.Text = dataSplit(1)
End Sub
