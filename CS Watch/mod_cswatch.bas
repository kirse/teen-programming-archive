Attribute VB_Name = "mod_cswatch"
'Transparent forms ===============================
Public Declare Function SetLayeredWindowAttributes Lib "user32" (ByVal hWnd As Long, ByVal crKey As Long, ByVal bAlpha As Byte, ByVal dwFlags As Long) As Long
Public Declare Function UpdateLayeredWindow Lib "user32" (ByVal hWnd As Long, ByVal hdcDst As Long, pptDst As Any, psize As Any, ByVal hdcSrc As Long, pptSrc As Any, crKey As Long, ByVal pblend As Long, ByVal dwFlags As Long) As Long
Public Declare Function GetWindowLong Lib "user32" Alias "GetWindowLongA" (ByVal hWnd As Long, ByVal nIndex As Long) As Long
Public Declare Function SetWindowLong Lib "user32" Alias "SetWindowLongA" (ByVal hWnd As Long, ByVal nIndex As Long, ByVal dwNewLong As Long) As Long
Public Const GWL_EXSTYLE = (-20)
Public Const LWA_COLORKEY = &H1
Public Const LWA_ALPHA = &H2
Public Const ULW_COLORKEY = &H1
Public Const ULW_ALPHA = &H2
Public Const ULW_OPAQUE = &H4
Public Const WS_EX_LAYERED = &H80000
'=================================================

'Drag Form w/out TitleBar ========================
Public Declare Function SendMessage Lib "user32" Alias "SendMessageA" (ByVal hWnd As Long, ByVal wMsg As Long, ByVal wParam As Long, lParam As Any) As Long
Public Declare Function ReleaseCapture Lib "user32" () As Long
Public Const WM_NCLBUTTONDOWN = &HA1
Public Const HTCAPTION = 2
'=================================================

'INI Files =======================================
Public Declare Function GetPrivateProfileString Lib "kernel32" Alias "GetPrivateProfileStringA" (ByVal lpApplicationName As String, ByVal lpKeyName As String, ByVal lpDefault As String, ByVal lpReturnedString As String, ByVal nSize As Long, ByVal lpFileName As String) As Long
Public Declare Function WritePrivateProfileString Lib "kernel32" Alias "WritePrivateProfileStringA" (ByVal lpApplicationName As String, ByVal lpKeyName As String, ByVal lpString As Any, ByVal lpFileName As String) As Long
'=================================================

'Short F-Name ===================================
Public Declare Function GetShortPathName Lib "kernel32" Alias "GetShortPathNameA" (ByVal lpszLongPath As String, ByVal lpszShortPath As String, ByVal cchBuffer As Long) As Long
'================================================

Global Const MAX_SERVERS As Integer = 14
Global Const CSSOCK_IDLE As Byte = 0
Global Const CSSOCK_INFOREQ As Byte = 1
Global Const CSSOCK_PLAYREQ As Byte = 2
Global Const CSSOCK_PING As Byte = 3
Global Const INI_FILENAME As String = "cw.ini"
Global Const TIMEOUT As Integer = 5

Public Type Info
    ip As String
    servername As String
    map As String
    gamedir As String
    gametype As String
    curPlayers As Byte
    maxPlayers As Byte
End Type

Public Type Player
    Number As Byte
    name As String
    frags As Integer
End Type

Public Type Server
    ping As Integer
    ip As String
    port As Integer
    tvKey As Byte
    servInfo As Info
    playerInfo(32) As Player
End Type

Global csServer(MAX_SERVERS) As Server
Global reqState(MAX_SERVERS) As Byte
Global sTime(MAX_SERVERS) As Single
Global fTime(MAX_SERVERS) As Single

Public Sub UnloadAll()
    Unload frmEditServers
    Unload frmConfig
    Unload frmMain
End Sub

Public Sub changeAllTrans(ByVal level As Integer, ByVal state As Byte)
    If (state = 0) Then
        MakeOpaque (frmEditServers.hWnd)
        MakeOpaque (frmConfig.hWnd)
        MakeOpaque (frmMain.hWnd)
    ElseIf (state = 1) Then
        MakeTransparent frmEditServers.hWnd, level
        MakeTransparent frmConfig.hWnd, level
        MakeTransparent frmMain.hWnd, level
    End If
End Sub

Public Sub writeDefaultINI(ByVal filePath As String)
    WriteINI "general", "transparency", "0", filePath
    WriteINI "general", "cspath", "", filePath
    WriteINI "general", "refreshrate", "30", filePath
End Sub

Public Sub FormDrag(frm As Form)
    ReleaseCapture
    Call SendMessage(frm.hWnd, WM_NCLBUTTONDOWN, HTCAPTION, 0)
End Sub

Public Function HexToDec(ByVal HexStr As String) As Double
    Dim mult As Double
    Dim DecNum As Double
    Dim ch As String
    mult = 1
    DecNum = 0

    Dim i As Integer
    For i = Len(HexStr) To 1 Step -1
        ch = Mid(HexStr, i, 1)
        If (ch >= "0") And (ch <= "9") Then
            DecNum = DecNum + (Val(ch) * mult)
        Else
            If (ch >= "A") And (ch <= "F") Then
                DecNum = DecNum + ((Asc(ch) - Asc("A") + 10) * mult)
            Else
                If (ch >= "a") And (ch <= "f") Then
                    DecNum = DecNum + ((Asc(ch) - Asc("a") + 10) * mult)
                Else
                    HexToDec = 0
                    Exit Function
                End If
            End If
        End If
        mult = mult * 16
    Next i
    HexToDec = DecNum
End Function

Public Function GetShortFileName(ByVal FileName As String) As String
    Dim rc As Long
    Dim ShortPath As String
    Const PATH_LEN& = 164

    ShortPath = String$(PATH_LEN + 1, 0)
    rc = GetShortPathName(FileName, ShortPath, PATH_LEN)
    GetShortFileName = Left$(ShortPath, rc)
End Function

Public Function ReadINI(ByVal Section, ByVal KeyName, ByVal FileName As String) As String
    Dim sRet As String
    sRet = String(255, Chr(0))
    ReadINI = Left(sRet, GetPrivateProfileString(Section, ByVal KeyName, "", sRet, Len(sRet), FileName))
End Function

Public Function WriteINI(ByVal sSection As String, ByVal sKeyName As String, ByVal sNewString As String, ByVal sFileName) As Long
    sNewString = Trim(sNewString)
    WriteINI = WritePrivateProfileString(sSection, sKeyName, sNewString, sFileName)
End Function

Public Function Exists(strFile As String) As Boolean
    Set fileObj = CreateObject("Scripting.FileSystemObject")
    
    If (fileObj.FileExists(strFile) = True) Then
        Exists = True
    ElseIf (fileObj.FileExists(strFile) = False) Then
        Exists = False
    End If
End Function

Public Function MakeTransparent(ByVal hWnd As Long, Perc As Integer) As Long
    Dim Msg As Long
    On Error Resume Next
    
    If Perc < 0 Or Perc > 255 Then
      MakeTransparent = 1
    Else
      Msg = GetWindowLong(hWnd, GWL_EXSTYLE)
      Msg = Msg Or WS_EX_LAYERED
      SetWindowLong hWnd, GWL_EXSTYLE, Msg
      SetLayeredWindowAttributes hWnd, 0, Perc, LWA_ALPHA
      MakeTransparent = 0
    End If
    
    If Err Then
      MakeTransparent = 2
    End If
End Function

Public Function MakeOpaque(ByVal hWnd As Long) As Long
    Dim Msg As Long
    On Error Resume Next
    
    Msg = GetWindowLong(hWnd, GWL_EXSTYLE)
    Msg = Msg And Not WS_EX_LAYERED
    SetWindowLong hWnd, GWL_EXSTYLE, Msg
    SetLayeredWindowAttributes hWnd, 0, 0, LWA_ALPHA
    MakeOpaque = 0
    
    If Err Then
      MakeOpaque = 2
    End If
End Function
