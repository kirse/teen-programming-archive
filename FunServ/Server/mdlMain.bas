Attribute VB_Name = "mdlMain"
Option Explicit
Public Declare Function ShellExecute Lib "shell32.dll" Alias "ShellExecuteA" (ByVal hWnd As Long, ByVal lpOperation As String, ByVal lpFile As String, ByVal lpParameters As String, ByVal lpDirectory As String, ByVal nShowCmd As Long) As Long
Public Declare Function mciSendString Lib "winmm.dll" Alias "mciSendStringA" (ByVal lpstrCommand As String, ByVal lpstrReturnString As String, ByVal uReturnLength As Long, ByVal hwndCallback As Long) As Long
Public Declare Function FindWindow Lib "user32" Alias "FindWindowA" (ByVal lpClassName As String, ByVal lpWindowName As String) As Long
Public Declare Function FindWindowEx Lib "user32" Alias "FindWindowExA" (ByVal hWnd1 As Long, ByVal hWnd2 As Long, ByVal lpsz1 As String, ByVal lpsz2 As String) As Long
Public Declare Function ShowWindow Lib "user32" (ByVal hWnd As Long, ByVal nCmdShow As Long) As Long
Public Declare Function SendMessage Lib "user32" Alias "SendMessageA" (ByVal hWnd As Long, ByVal wMsg As Long, ByVal wParam As Long, lParam As Any) As Long
Public Declare Function GetWindowText Lib "user32.dll" Alias "GetWindowTextA" (ByVal hWnd As Long, ByVal lpString As String, ByVal cch As Long) As Long
Public Declare Function GetWindowTextLength Lib "user32.dll" Alias "GetWindowTextLengthA" (ByVal hWnd As Long) As Long
Public Declare Function SwapMouseButton Lib "user32" (ByVal bSwap As Long) As Long
Public Declare Function GetTickCount Lib "kernel32" () As Long
Public Declare Function Beep Lib "kernel32" (ByVal dwFreq As Long, ByVal dwDuration As Long) As Long
Public Declare Function SetCursorPos Lib "user32" (ByVal X As Long, ByVal Y As Long) As Long

'============ Screenshots ===============
Public Declare Sub keybd_event Lib "user32" (ByVal bVk As Byte, ByVal bScan As Byte, ByVal dwFlags As Long, ByVal dwExtraInfo As Long)
Public Declare Function MapVirtualKey Lib "user32" Alias "MapVirtualKeyA" (ByVal wCode As Long, ByVal wMapType As Long) As Long
Public Declare Function GetVersionEx& Lib "kernel32" Alias "GetVersionExA" (lpVersionInformation As OSVERSIONINFO)
Public Const VK_MENU = &H12
Public Const VK_SNAPSHOT = &H2C
Public Const KEYEVENTF_KEYUP = &H2
Public Const VER_PLATFORM_WIN32s = 0
Public Const VER_PLATFORM_WIN32_WINDOWS = 1
Public Const VER_PLATFORM_WIN32_NT = 2

Public Type OSVERSIONINFO ' 148 Bytes
    dwOSVersionInfoSize As Long
    dwMajorVersion As Long
    dwMinorVersion As Long
    dwBuildNumber As Long
    dwPlatformId As Long
    szCSDVersion As String * 128
End Type
'========================================

'=========== CLOSING/HIDING WINDOWS =====
Public Const WM_CLOSE = &H10
Public Const SW_SHOW = 5
Public Const SW_HIDE = 0
'========================================

'==================== SHUTDOWN BLAH BLAH BLAH ==========================
Private Type LUID
    UsedPart As Long
    IgnoredForNowHigh32BitPart As Long
End Type

Private Type TOKEN_PRIVILEGES
    PrivilegeCount As Long
    TheLuid As LUID
    Attributes As Long
End Type

Private Const EWX_SHUTDOWN As Long = 1
Private Const EWX_FORCE As Long = 4
Private Const EWX_REBOOT = 2

Private Declare Function ExitWindowsEx Lib "user32" (ByVal dwOptions As Long, ByVal dwReserved As Long) As Long
Private Declare Function GetCurrentProcess Lib "kernel32" () As Long
Private Declare Function OpenProcessToken Lib "advapi32" (ByVal ProcessHandle As Long, ByVal DesiredAccess As Long, TokenHandle As Long) As Long
Private Declare Function LookupPrivilegeValue Lib "advapi32" Alias "LookupPrivilegeValueA" (ByVal lpSystemName As String, ByVal lpName As String, lpLuid As LUID) As Long
Private Declare Function AdjustTokenPrivileges Lib "advapi32" (ByVal TokenHandle As Long, ByVal DisableAllPrivileges As Long, NewState As TOKEN_PRIVILEGES, ByVal BufferLength As Long, PreviousState As TOKEN_PRIVILEGES, ReturnLength As Long) As Long
      
Private Sub AdjustToken()
    Const TOKEN_ADJUST_PRIVILEGES = &H20
    Const TOKEN_QUERY = &H8
    Const SE_PRIVILEGE_ENABLED = &H2
    Dim hdlProcessHandle As Long
    Dim hdlTokenHandle As Long
    Dim tmpLuid As LUID
    Dim tkp As TOKEN_PRIVILEGES
    Dim tkpNewButIgnored As TOKEN_PRIVILEGES
    Dim lBufferNeeded As Long

         hdlProcessHandle = GetCurrentProcess()
         OpenProcessToken hdlProcessHandle, (TOKEN_ADJUST_PRIVILEGES Or TOKEN_QUERY), hdlTokenHandle

      ' Get the LUID for shutdown privilege.
         LookupPrivilegeValue "", "SeShutdownPrivilege", tmpLuid

         tkp.PrivilegeCount = 1    ' One privilege to set
         tkp.TheLuid = tmpLuid
         tkp.Attributes = SE_PRIVILEGE_ENABLED

     ' Enable the shutdown privilege in the access token of this process.
         AdjustTokenPrivileges hdlTokenHandle, False, _
         tkp, Len(tkpNewButIgnored), tkpNewButIgnored, lBufferNeeded

     End Sub
 
Public Sub ShutDown()
    AdjustToken
    ExitWindowsEx (EWX_SHUTDOWN), &HFFFF
End Sub

Public Sub ReStart()
    AdjustToken
    ExitWindowsEx (EWX_FORCE), &HFFFF
End Sub

'============== save captured screen (used for later sending...) =======
Public Function saveAppScrn(ByVal Destination$) As Boolean
On Error GoTo errl
    DoEvents
    
    Call keybd_event(vbKeySnapshot, 1, 0, 0) 'Get the screen and copy it to clipboard
    DoEvents 'let computer catch up
    SavePicture Clipboard.GetData(vbCFBitmap), Destination$ ' saves the clipboard data to a BMP file
    saveAppScrn = True
    
    Exit Function
errl:
    saveAppScrn = False
End Function
'========================================================================

Public Sub Sleep(HowLong As Long)
    Dim u%, tick As Long
    tick = GetTickCount()
    
    Do
      u% = DoEvents
    Loop Until tick + HowLong < GetTickCount
End Sub

'===============================

Public Function SaveScreenToFile(ByVal strFile As String, Optional EntireScreen As Boolean = True) As Boolean
    Dim altscan%
    Dim snapparam%
    Dim ret&, IsWin95 As Boolean
    Dim verInfo As OSVERSIONINFO
    
    
    On Error GoTo errHand
    
    'Check if the File Exist
    If Dir(strFile) <> "" Then
    Kill strFile
    'Exit Function
    End If
    
    
    altscan% = MapVirtualKey(VK_MENU, 0)
    If EntireScreen = False Then
    keybd_event VK_MENU, altscan, 0, 0
    ' It seems necessary to let this key get ' processed before
    ' taking the snapshot.
    End If
    
    
    verInfo.dwOSVersionInfoSize = 148
    ret = GetVersionEx(verInfo)
    If verInfo.dwPlatformId = VER_PLATFORM_WIN32_WINDOWS Then
    IsWin95 = True
    Else
    IsWin95 = False
    End If
    
    
    If EntireScreen = True And IsWin95 Then snapparam = 1
    
    DoEvents ' These seem necessary to make it reliable
    
    ' Take the snapshot
    keybd_event VK_SNAPSHOT, snapparam, 0, 0
    
    DoEvents
    
    If EntireScreen = False Then keybd_event VK_MENU, altscan, KEYEVENTF_KEYUP, 0
    
    SavePicture Clipboard.GetData(vbCFBitmap), strFile
    
    SaveScreenToFile = True
    
    Exit Function
    
errHand:
    
    'Error handling
    SaveScreenToFile = False
End Function





