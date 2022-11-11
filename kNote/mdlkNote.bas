Attribute VB_Name = "mdlkNote"
'SysTray Icon Stuff ==============================
Public Declare Function Shell_NotifyIcon Lib "shell32" Alias "Shell_NotifyIconA" (ByVal dwMessage As Long, ptry As NOTIFYICONDATA) As Boolean
Public trayIcon As NOTIFYICONDATA

Public Type NOTIFYICONDATA
     cbSize As Long
     hwnd As Long
     uId As Long
     uFlags As Long
     uCallBackMessage As Long
     hIcon As Long
     szTip As String * 64
End Type
Public Const NIM_ADD = &H0
Public Const NIM_MODIFY = &H1
Public Const NIM_DELETE = &H2
Public Const WM_MOUSEMOVE = &H200
Public Const NIF_MESSAGE = &H1
Public Const NIF_ICON = &H2
Public Const NIF_TIP = &H4
Public Const WM_LBUTTONDBLCLK = &H203
Public Const WM_LBUTTONDOWN = &H201
Public Const WM_LBUTTONUP = &H202
Public Const WM_RBUTTONDBLCLK = &H206
Public Const WM_RBUTTONDOWN = &H204
Public Const WM_RBUTTONUP = &H205
'=================================================

'Drag form around w/out titlebar =================
Public Declare Function SendMessage Lib "user32" Alias "SendMessageA" (ByVal hwnd As Long, ByVal wMsg As Long, ByVal wParam As Long, lParam As Any) As Long
Public Declare Function ReleaseCapture Lib "user32" () As Long
Public Const WM_NCLBUTTONDOWN = &HA1
Public Const HTCAPTION = 2
'=================================================

'Transparent forms ===============================
Public Declare Function SetLayeredWindowAttributes Lib "user32" (ByVal hwnd As Long, ByVal crKey As Long, ByVal bAlpha As Byte, ByVal dwFlags As Long) As Long
Public Declare Function UpdateLayeredWindow Lib "user32" (ByVal hwnd As Long, ByVal hdcDst As Long, pptDst As Any, psize As Any, ByVal hdcSrc As Long, pptSrc As Any, crKey As Long, ByVal pblend As Long, ByVal dwFlags As Long) As Long
Public Declare Function GetWindowLong Lib "user32" Alias "GetWindowLongA" (ByVal hwnd As Long, ByVal nIndex As Long) As Long
Public Declare Function SetWindowLong Lib "user32" Alias "SetWindowLongA" (ByVal hwnd As Long, ByVal nIndex As Long, ByVal dwNewLong As Long) As Long
Public Const GWL_EXSTYLE = (-20)
Public Const LWA_COLORKEY = &H1
Public Const LWA_ALPHA = &H2
Public Const ULW_COLORKEY = &H1
Public Const ULW_ALPHA = &H2
Public Const ULW_OPAQUE = &H4
Public Const WS_EX_LAYERED = &H80000
'=================================================

'INI Files =======================================
Public Declare Function GetPrivateProfileString Lib "kernel32" Alias "GetPrivateProfileStringA" (ByVal lpApplicationName As String, ByVal lpKeyName As String, ByVal lpDefault As String, ByVal lpReturnedString As String, ByVal nSize As Long, ByVal lpFileName As String) As Long
Public Declare Function WritePrivateProfileString Lib "kernel32" Alias "WritePrivateProfileStringA" (ByVal lpApplicationName As String, ByVal lpKeyName As String, ByVal lpString As Any, ByVal lpFileName As String) As Long
'=================================================

'Short F-Name ===================================
Public Declare Function GetShortPathName Lib "kernel32" Alias "GetShortPathNameA" (ByVal lpszLongPath As String, ByVal lpszShortPath As String, ByVal cchBuffer As Long) As Long
'================================================

'API Sleep ======================================
Public Declare Sub Sleep Lib "kernel32" (ByVal dwMilliseconds As Long)
'================================================

Global appDataPath As String
Global skinPath As String
Global userDataPath As String
Global blockedPath As String
Global totUsers As Integer
Global uName As String

Public Sub FormDrag(frm As Form)
    ReleaseCapture
    Call SendMessage(frm.hwnd, WM_NCLBUTTONDOWN, HTCAPTION, 0)
End Sub

Public Function MakeTransparent(ByVal hwnd As Long, Perc As Integer) As Long
    Dim Msg As Long
    On Error Resume Next
    
    If Perc < 0 Or Perc > 255 Then
      MakeTransparent = 1
    Else
      Msg = GetWindowLong(hwnd, GWL_EXSTYLE)
      Msg = Msg Or WS_EX_LAYERED
      SetWindowLong hwnd, GWL_EXSTYLE, Msg
      SetLayeredWindowAttributes hwnd, 0, Perc, LWA_ALPHA
      MakeTransparent = 0
    End If
    
    If Err Then
      MakeTransparent = 2
    End If
End Function

Public Function MakeOpaque(ByVal hwnd As Long) As Long
    Dim Msg As Long
    On Error Resume Next
    
    Msg = GetWindowLong(hwnd, GWL_EXSTYLE)
    Msg = Msg And Not WS_EX_LAYERED
    SetWindowLong hwnd, GWL_EXSTYLE, Msg
    SetLayeredWindowAttributes hwnd, 0, 0, LWA_ALPHA
    MakeOpaque = 0
    
    If Err Then
      MakeOpaque = 2
    End If
End Function

Public Function GetShortFileName(ByVal FileName As String) As String
    Dim rc As Long
    Dim ShortPath As String
    Const PATH_LEN& = 164

    ShortPath = String$(PATH_LEN + 1, 0)
    rc = GetShortPathName(FileName, ShortPath, PATH_LEN)
    GetShortFileName = Left$(ShortPath, rc)
End Function

Public Function ReadINI(Section, KeyName, FileName As String) As String
    Dim sRet As String
    sRet = String(255, Chr(0))
    ReadINI = Left(sRet, GetPrivateProfileString(Section, ByVal KeyName, "", sRet, Len(sRet), FileName))
End Function

Public Function WriteINI(sSection As String, sKeyName As String, sNewString As String, sFileName) As Integer
    Dim str
    sNewString = Trim(sNewString)
    str = WritePrivateProfileString(sSection, sKeyName, sNewString, sFileName)
End Function

Public Function Exists(strFile As String) As Boolean
    Set fileObj = CreateObject("Scripting.FileSystemObject")
    
    If (fileObj.FileExists(strFile) = True) Then
        Exists = True
    ElseIf (fileObj.FileExists(strFile) = False) Then
        Exists = False
    End If
End Function

Public Sub UpdateUserINIList()
    Dim X As Integer
    Dim DataSplit() As String
    Dim tUser As String
    Dim tIP As String
    Dim tNum As Integer
    
    WriteINI "UserList", "numusers", str(totUsers), userDataPath
    
    For X = 1 To totUsers
        tNum = X - 1
        
        DataSplit() = Split(frmMain.lstUsers.List(tNum), "-")
        
        tUser = Trim(DataSplit(0))
        
        tIP = Trim(DataSplit(1))

        WriteINI "UserList", "user" & Trim(str(X)), tUser, userDataPath
        WriteINI "UserList", "userip" & Trim(str(X)), tIP, userDataPath
    Next X
End Sub

Public Sub DelLastINIItem()
    WriteINI "UserList", "user" & Trim(str(totUsers)), "", userDataPath
    WriteINI "UserList", "userip" & Trim(str(totUsers)), "", userDataPath
End Sub

Public Sub UnloadAll()
    Unload frmMain
    Unload frmMenus
    Unload frmOptions
    Unload frmUserAdd
    End
End Sub
