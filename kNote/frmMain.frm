VERSION 5.00
Object = "{248DD890-BB45-11CF-9ABC-0080C7E7B78D}#1.0#0"; "MSWINSCK.OCX"
Object = "{3B7C8863-D78F-101B-B9B5-04021C009402}#1.2#0"; "RICHTX32.OCX"
Begin VB.Form frmMain 
   BorderStyle     =   0  'None
   Caption         =   "Form1"
   ClientHeight    =   2535
   ClientLeft      =   105
   ClientTop       =   105
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
   Icon            =   "frmMain.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   2535
   ScaleWidth      =   3000
   ShowInTaskbar   =   0   'False
   StartUpPosition =   3  'Windows Default
   Begin VB.Timer Timer1 
      Interval        =   350
      Left            =   870
      Top             =   1020
   End
   Begin MSWinsockLib.Winsock socket 
      Left            =   2580
      Top             =   2130
      _ExtentX        =   741
      _ExtentY        =   741
      _Version        =   393216
   End
   Begin VB.PictureBox picExit 
      AutoSize        =   -1  'True
      BorderStyle     =   0  'None
      Height          =   150
      Left            =   2760
      ScaleHeight     =   150
      ScaleWidth      =   165
      TabIndex        =   22
      Top             =   75
      Width           =   165
   End
   Begin VB.PictureBox picHelp 
      AutoSize        =   -1  'True
      BorderStyle     =   0  'None
      Height          =   150
      Left            =   2550
      ScaleHeight     =   150
      ScaleWidth      =   165
      TabIndex        =   21
      Top             =   75
      Width           =   165
   End
   Begin VB.PictureBox picWrapUp 
      AutoSize        =   -1  'True
      BorderStyle     =   0  'None
      Height          =   150
      Left            =   300
      ScaleHeight     =   150
      ScaleWidth      =   165
      TabIndex        =   20
      Top             =   75
      Width           =   165
   End
   Begin VB.PictureBox picMinimize 
      AutoSize        =   -1  'True
      BorderStyle     =   0  'None
      Height          =   150
      Left            =   90
      ScaleHeight     =   150
      ScaleWidth      =   165
      TabIndex        =   19
      Top             =   75
      Width           =   165
   End
   Begin VB.TextBox txtSendIP 
      Appearance      =   0  'Flat
      Height          =   255
      Left            =   1530
      TabIndex        =   15
      Top             =   390
      Visible         =   0   'False
      Width           =   1335
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
         Alignment       =   2  'Center
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "kNote 1.0"
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
         Left            =   1095
         TabIndex        =   1
         Top             =   45
         Width           =   840
      End
   End
   Begin VB.TextBox txtNoteToSend 
      Appearance      =   0  'Flat
      Height          =   1365
      Left            =   120
      MultiLine       =   -1  'True
      ScrollBars      =   2  'Vertical
      TabIndex        =   12
      Top             =   720
      Visible         =   0   'False
      Width           =   2775
   End
   Begin VB.TextBox txtNote 
      Appearance      =   0  'Flat
      Height          =   1425
      Left            =   120
      Locked          =   -1  'True
      MultiLine       =   -1  'True
      ScrollBars      =   2  'Vertical
      TabIndex        =   4
      Top             =   660
      Width           =   2775
   End
   Begin VB.ListBox lstUsers 
      Appearance      =   0  'Flat
      Height          =   1395
      ItemData        =   "frmMain.frx":08CA
      Left            =   120
      List            =   "frmMain.frx":08CC
      TabIndex        =   23
      ToolTipText     =   "Double-click to send a user a note."
      Top             =   660
      Visible         =   0   'False
      Width           =   2745
   End
   Begin RichTextLib.RichTextBox txtLogData 
      Height          =   1425
      Left            =   120
      TabIndex        =   26
      Top             =   660
      Width           =   2775
      _ExtentX        =   4895
      _ExtentY        =   2514
      _Version        =   393217
      Enabled         =   -1  'True
      ScrollBars      =   2
      Appearance      =   0
      TextRTF         =   $"frmMain.frx":08CE
   End
   Begin VB.Label lblAddUser 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "add user"
      Height          =   195
      Left            =   2220
      TabIndex        =   25
      Top             =   390
      Visible         =   0   'False
      Width           =   630
   End
   Begin VB.Label lblInfo3 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "kNotes User List:"
      Height          =   195
      Left            =   150
      TabIndex        =   24
      Top             =   390
      Visible         =   0   'False
      Width           =   1215
   End
   Begin VB.Label lblInfo2 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "Log-File Data:"
      Height          =   195
      Left            =   150
      TabIndex        =   18
      Top             =   390
      Visible         =   0   'False
      Width           =   1005
   End
   Begin VB.Label lblMain 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "main"
      Height          =   195
      Left            =   150
      TabIndex        =   17
      Top             =   2250
      Width           =   330
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "|"
      Height          =   195
      Left            =   510
      TabIndex        =   16
      Top             =   2250
      Width           =   60
   End
   Begin VB.Label lblToIP 
      BackStyle       =   0  'Transparent
      Caption         =   "IP:"
      Height          =   225
      Left            =   1230
      TabIndex        =   14
      Top             =   420
      Visible         =   0   'False
      Width           =   705
   End
   Begin VB.Label lblSend 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "     Send It!"
      Height          =   195
      Left            =   150
      TabIndex        =   13
      Top             =   420
      Visible         =   0   'False
      Width           =   810
   End
   Begin VB.Label Label4 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "|"
      Height          =   195
      Left            =   2010
      TabIndex        =   11
      Top             =   2250
      Width           =   60
   End
   Begin VB.Label Label3 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "|"
      Height          =   195
      Left            =   1500
      TabIndex        =   10
      Top             =   2250
      Width           =   60
   End
   Begin VB.Label Label2 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "|"
      Height          =   195
      Left            =   870
      TabIndex        =   9
      Top             =   2250
      Width           =   60
   End
   Begin VB.Label lblUserBook 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "users"
      Height          =   195
      Left            =   1590
      TabIndex        =   8
      Top             =   2250
      Width           =   390
   End
   Begin VB.Label lblSendNote 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "send kNote"
      Height          =   195
      Left            =   2100
      TabIndex        =   7
      Top             =   2250
      Width           =   810
   End
   Begin VB.Label lblOpts 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "options"
      Height          =   195
      Left            =   960
      TabIndex        =   6
      Top             =   2250
      Width           =   525
   End
   Begin VB.Label lblLog 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "log"
      Height          =   195
      Left            =   630
      TabIndex        =   5
      Top             =   2250
      Width           =   210
   End
   Begin VB.Line Line1 
      X1              =   120
      X2              =   2880
      Y1              =   2190
      Y2              =   2190
   End
   Begin VB.Label lblNoteFrom 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "n/a"
      Height          =   195
      Left            =   1080
      TabIndex        =   3
      Top             =   390
      Width           =   240
   End
   Begin VB.Label lblInfo1 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "kNote From:"
      Height          =   195
      Left            =   150
      TabIndex        =   2
      Top             =   390
      Width           =   885
   End
   Begin VB.Shape shpMain 
      BackColor       =   &H00FFFFFF&
      Height          =   2265
      Left            =   0
      Top             =   270
      Width           =   3000
   End
End
Attribute VB_Name = "frmMain"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private clsOnTop As New clskNote
Const portNum As Integer = 5233
Dim comMode As String

Private Sub Form_Load()
    Dim iTemp As Integer
    Dim tUser As String
    Dim tIP As String
    Dim X As Integer
    Dim curSkin As String
    Dim gotUName As String
    Set clsOnTop = New clskNote
    
    appDataPath = App.Path & "\appdata\main.ini"
    userDataPath = App.Path & "\appdata\users.ini"
    blockedPath = App.Path & "\appdata\blocked.ini"
    curSkin = ReadINI("Skins", "curskin", appDataPath)
    
    gotUName = ReadINI("General", "gotuname", appDataPath)
    
    skinPath = App.Path & ReadINI("Skins", "path" & curSkin, appDataPath)
    
    socket.LocalPort = portNum
    socket.RemotePort = portNum
    socket.Listen
    
    comMode = "GENERAL"
    frmMain.Top = 50
    frmMain.Left = Screen.Width - frmMain.Width - 50
    
    If Exists(App.Path & "\appdata\logfile.rtf") Then
        txtLogData.LoadFile (App.Path & "\appdata\logfile.rtf")
    End If
    
    'get app data from INI Files
    If Exists(appDataPath) Then
        frmMain.Left = Val(ReadINI("General", "xPos", appDataPath))
        frmMain.Top = Val(ReadINI("General", "yPos", appDataPath))
    End If
    
    If (gotUName = "0") Then
        frmName.Top = frmMain.Top - 100
        frmName.Left = frmMain.Left
        clsOnTop.MakeTopMost frmName.hWnd
        frmName.Show vbModal
        clsOnTop.MakeNormal frmName.hWnd
    ElseIf (gotUName = "1") Then
        uName = ReadINI("General", "username", appDataPath)
    End If
    
    'get list of users from ini file
    If Exists(userDataPath) Then
        totUsers = Val(ReadINI("UserList", "numusers", userDataPath))
    
        For X = 1 To totUsers
            tUser = "user" & str(X)
            tUser = ReadINI("UserList", "user" & Trim(str(X)), userDataPath)
            tIP = ReadINI("UserList", "userip" & Trim(str(X)), userDataPath)
            lstUsers.AddItem tUser & " - " & tIP
        Next X
    End If
    
    'load skin
    picTitle.Picture = LoadPicture(skinPath & "\titlesmall.gif")
    picExit.Picture = LoadPicture(skinPath & "\x.gif")
    picHelp.Picture = LoadPicture(skinPath & "\help.gif")
    picWrapUp.Picture = LoadPicture(skinPath & "\wrapup.gif")
    picMinimize.Picture = LoadPicture(skinPath & "\minimize.gif")
    
    iTemp = ReadINI("General", "keepontop", appDataPath)
    If CBool(iTemp) Then
        clsOnTop.MakeTopMost Me.hWnd
    End If
    
    iTemp = ReadINI("General", "transwin", appDataPath)
    If CBool(iTemp) Then
        MakeTransparent Me.hWnd, 230
    End If
    
    'put stuff in system tray...
    trayIcon.cbSize = Len(trayIcon)
    trayIcon.hWnd = Me.hWnd
    trayIcon.uId = vbNull
    trayIcon.uFlags = NIF_ICON Or NIF_TIP Or NIF_MESSAGE
    trayIcon.uCallBackMessage = WM_MOUSEMOVE

    'This uses whatever Icon the Form Displays
    trayIcon.hIcon = Me.Icon
    
    'Tool Tip
    trayIcon.szTip = "kNote" & vbNullChar
    
    Call Shell_NotifyIcon(NIM_ADD, trayIcon)
    Call Shell_NotifyIcon(NIM_MODIFY, trayIcon)
End Sub


Private Sub Form_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
    Select Case X
        Case 7755:   'Right Click
            PopupMenu frmMenus.popMenu
        Case 7725:    'Dbl Left Click
            frmMain.Show
    End Select
End Sub

Private Sub lblAddUser_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
    lblAddUser.ForeColor = vbRed
    
    If (frmMain.Left - frmOptions.Width < 0) Then
        frmUserAdd.Left = frmMain.Left + frmMain.Width + 20
        frmUserAdd.Top = frmMain.Top
        frmUserAdd.Show
        Exit Sub
    Else
        frmUserAdd.Left = frmMain.Left - frmUserAdd.Width - 20
        frmUserAdd.Top = frmMain.Top
        frmUserAdd.Show
    End If
End Sub

Private Sub lblAddUser_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
    lblAddUser.ForeColor = vbBlack
End Sub

Private Sub lblSend_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
    lblSend.ForeColor = vbRed
    If Trim(txtSendIP.Text) = "" Then
         MsgBox "Please enter a valid destination IP/Hostname.", vbOKOnly, "Error"
         lblSend.ForeColor = vbBlack
         Exit Sub
    End If
    
    If Trim(Len(txtNoteToSend.Text)) > 1024 Then
         MsgBox "Your kNote must be less than 1024 characters.  Please shorten the message.", vbOKOnly, "Message Length"
         lblSend.ForeColor = vbBlack
         Exit Sub
    End If
    
    If (comMode <> "GENERAL") Then
        MsgBox "kNote is currently busy.  Please wait one minute and retry sending.", vbOKOnly, "Transfer in Progress"
        lblSend.ForeColor = vbBlack
        Exit Sub
    End If
    
    comMode = "SEND"
    lblTitle.Caption = "sending kNote..."
    socket.Close
   ' Sleep (1000)
    DoEvents
    
    socket.RemoteHost = txtSendIP.Text
    socket.RemotePort = portNum
    
    socket.Connect
    DoEvents
End Sub

Private Sub lblSend_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
    lblSend.ForeColor = vbBlack
End Sub

Private Sub lstUsers_DblClick()
    Dim DataSplit() As String
    DataSplit() = Split(lstUsers.Text, "-")
    txtSendIP.Text = Trim(DataSplit(1))
    
    lblInfo1.Visible = False
    txtNote.Visible = False
    lblNoteFrom.Visible = False
    txtLogData.Visible = False
    lblInfo2.Visible = False
    
    lblSend.Visible = True
    txtNoteToSend.Visible = True
    txtSendIP.Visible = True
    lblToIP.Visible = True
    lblInfo3.Visible = False
    lstUsers.Visible = False
End Sub

Private Sub lstUsers_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
    If Button = 2 Then
        PopupMenu frmMenus.mnuUserList
    End If
End Sub

Private Sub picExit_Click()
    WriteINI "General", "xPos", str(frmMain.Left), appDataPath
    WriteINI "General", "yPos", str(frmMain.Top), appDataPath
    txtLogData.SaveFile App.Path & "\appdata\logfile.rtf"
    
    UnloadAll
    ' do not forget to save setttings (like form pos) in ini file!
End Sub

Private Sub picMinimize_Click()
    frmMain.Hide
End Sub

Private Sub picTitle_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
    FormDrag Me
End Sub

Private Sub picWrapUp_Click()
    If frmMain.Height <= picTitle.Height Then
        frmMain.Height = 2535
    Else
        frmMain.Height = picTitle.Height
    End If
End Sub

'various mousedowns/events===============================
Private Sub lblMain_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
    lblMain.ForeColor = vbRed
    
    lblInfo1.Visible = True
    txtNote.Visible = True
    lblNoteFrom.Visible = True
    
    lblSend.Visible = False
    txtNoteToSend.Visible = False
    txtSendIP.Visible = False
    lblToIP.Visible = False
    txtLogData.Visible = False
    lblInfo2.Visible = False
    lblInfo3.Visible = False
    lstUsers.Visible = False
    lblAddUser.Visible = False
End Sub

Private Sub lblLog_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
    lblLog.ForeColor = vbRed

    lblInfo2.Visible = True
    txtLogData.Visible = True
    
    lblInfo1.Visible = False
    txtNote.Visible = False
    lblNoteFrom.Visible = False
    lblSend.Visible = False
    txtNoteToSend.Visible = False
    txtSendIP.Visible = False
    lblToIP.Visible = False
    lblInfo3.Visible = False
    lstUsers.Visible = False
    lblAddUser.Visible = False
End Sub

Private Sub lblOpts_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
    lblOpts.ForeColor = vbRed
    frmOptions.Top = frmMain.Top
    
    If (frmMain.Left - frmOptions.Width < 0) Then
        frmOptions.Left = frmMain.Left + frmMain.Width + 20
        frmOptions.Show
        Exit Sub
    Else
        frmOptions.Left = frmMain.Left - frmOptions.Width - 20
        frmOptions.Show
    End If
        
End Sub

Private Sub lblSendNote_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
    lblSendNote.ForeColor = vbRed
    
    lblInfo1.Visible = False
    txtNote.Visible = False
    lblNoteFrom.Visible = False
    txtLogData.Visible = False
    lblInfo2.Visible = False
    
    lblSend.Visible = True
    txtNoteToSend.Visible = True
    txtSendIP.Visible = True
    lblToIP.Visible = True
    lblInfo3.Visible = False
    lstUsers.Visible = False
    lblAddUser.Visible = False
End Sub

Private Sub lblUserBook_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
    Dim tUser As String
    Dim tIP As String
    
    lblUserBook.ForeColor = vbRed
    
    lblInfo1.Visible = False
    txtNote.Visible = False
    lblNoteFrom.Visible = False
    txtLogData.Visible = False
    lblInfo2.Visible = False
    lblSend.Visible = False
    txtSendIP.Visible = False
    lblToIP.Visible = False
    txtNoteToSend.Visible = False
    
    lstUsers.Visible = True
    lblInfo3.Visible = True
    lblAddUser.Visible = True
    
    If Exists(userDataPath) Then
        lstUsers.Clear
        
        For X = 1 To totUsers
            tUser = "user" & str(X)
            tUser = ReadINI("UserList", "user" & Trim(str(X)), userDataPath)
            tIP = ReadINI("UserList", "userip" & Trim(str(X)), userDataPath)
            lstUsers.AddItem tUser & " - " & tIP
        Next X
    End If
End Sub

Private Sub lblTitle_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
    FormDrag Me
End Sub

' mouse-ups that dont matter ==============================================
Private Sub lblLog_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
    lblLog.ForeColor = vbBlack
End Sub

Private Sub lblOpts_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
    lblOpts.ForeColor = vbBlack
End Sub

Private Sub lblMain_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
    lblMain.ForeColor = vbBlack
End Sub

Private Sub lblSendNote_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
    lblSendNote.ForeColor = vbBlack
End Sub

Private Sub lblUserBook_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
    lblUserBook.ForeColor = vbBlack
End Sub

Private Sub socket_Close()
    If socket.State <> sckClosed Then socket.Close
End Sub

Private Sub socket_Connect()
    If comMode = "SEND" Then
        socket.SendData "RECVMODE"
    End If
End Sub

Private Sub socket_ConnectionRequest(ByVal requestID As Long)
    If socket.State <> sckClosed Then socket.Close
    socket.Accept requestID
End Sub

Private Sub socket_DataArrival(ByVal bytesTotal As Long)
    Dim data As String
    Dim DataSplit() As String
    
    socket.GetData data
    
    If (data = "RECVMODE") Then
        comMode = "RECV"
        socket.SendData "NAMEPLZ"
        Exit Sub
    End If
    
    If (comMode = "SEND") Then
        Select Case data
            Case "NAMEPLZ"
                socket.SendData "NAME," & uName
                Exit Sub
            Case "TXTPLZ"
                socket.SendData txtNoteToSend.Text
                comMode = "GENERAL"
                lblTitle.Caption = "kNote 1.0"
                socket.Close
                socket.Listen
                Exit Sub
        End Select
    End If
                
    If (comMode = "RECV") Then
        DataSplit() = Split(data, ",")
        
        Select Case DataSplit(0)
            Case "NAME"
                lblTitle.Caption = "receiving kNote..."
                lblNoteFrom.Caption = Trim(DataSplit(1))
                txtLogData.Text = txtLogData.Text & DataSplit(1) & " - "
                txtLogData.Text = txtLogData.Text & socket.RemoteHostIP & vbCrLf & "======================" & vbCrLf
                socket.SendData "TXTPLZ"
                Exit Sub
            Case Else
                txtNote.Text = DataSplit(0)
                txtLogData.Text = txtLogData.Text & DataSplit(0)
                socket.SendData "XDONE"
                comMode = "GENERAL"
                lblTitle.Caption = "kNote 1.0"
                socket.Close
                socket.Listen
        End Select
    End If
End Sub

Private Sub socket_Error(ByVal Number As Integer, Description As String, ByVal Scode As Long, ByVal Source As String, ByVal HelpFile As String, ByVal HelpContext As Long, CancelDisplay As Boolean)
    socket.Close
    socket.Listen
End Sub

Private Sub Timer1_Timer()
    lblTitle.Caption = socket.State
End Sub
