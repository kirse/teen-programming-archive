Attribute VB_Name = "modWinTools"
Option Explicit
Public Declare Function GetCursorPos Lib "user32" (lpPoint As POINTAPI) As Long
Public Declare Function GetWindowText Lib "user32.dll" Alias "GetWindowTextA" (ByVal hWnd As Long, ByVal lpString As String, ByVal cch As Long) As Long
Public Declare Function GetWindowTextLength Lib "user32.dll" Alias "GetWindowTextLengthA" (ByVal hWnd As Long) As Long
Public Declare Function GetClassName Lib "user32" Alias "GetClassNameA" (ByVal hWnd As Long, ByVal lpClassName As String, ByVal nMaxCount As Long) As Long
Public Declare Function GetParent Lib "user32" (ByVal hWnd As Long) As Long
Public Declare Function WindowFromPoint Lib "user32" (ByVal xPoint As Long, ByVal yPoint As Long) As Long
Public Declare Function MoveWindow Lib "user32" (ByVal hWnd As Long, ByVal x As Long, ByVal y As Long, ByVal nWidth As Long, ByVal nHeight As Long, ByVal bRepaint As Long) As Long

Public Declare Function ShellExecute Lib "shell32.dll" Alias "ShellExecuteA" (ByVal hWnd As Long, ByVal lpOperation As String, ByVal lpFile As String, ByVal lpParameters As String, ByVal lpDirectory As String, ByVal nShowCmd As Long) As Long

Public Declare Function SendMessage Lib "user32" Alias "SendMessageA" (ByVal hWnd As Long, ByVal wMsg As Long, ByVal wParam As Long, lParam As Any) As Long
Public Declare Function SendMessageByString Lib "user32" Alias "SendMessageA" (ByVal hWnd As Long, ByVal wMsg As Long, ByVal wParam As Long, ByVal lParam As String) As Long
Public Declare Function ShowWindow Lib "user32" (ByVal hWnd As Long, ByVal nCmdShow As Long) As Long

Public Declare Function ReleaseCapture Lib "user32" () As Long

Declare Function EnumChildWindows Lib "user32" (ByVal hWndParent As Long, ByVal lpEnumFunc As Long, ByVal lParam As Long) As Long
Declare Function EnumWindows Lib "user32" (ByVal lpEnumFunc As Long, ByVal lParam As Long) As Long

Public Type POINTAPI
    x As Long
    y As Long
End Type

Public Const EM_GETPASSWORDCHAR = &HD2
Public Const EM_SETPASSWORDCHAR = &HCC
Public Const EM_SETMODIFY = &HB9
Public Const WM_SYSCOMMAND = &H112
Public Const WM_MOVE = &HF012
Public Const WM_SETTEXT = &HC
Public Const WM_CLOSE = &H10
Public Const SW_SHOW = 5
Public Const SW_HIDE = 0

Public Sub RemoveListItem(Name As String)
    Dim J As Integer
    
    For J = 0 To frmHiddenWins.lstWins.ListCount
        If Name = frmHiddenWins.lstWins.List(J) Then
            frmHiddenWins.lstWins.RemoveItem (J)
        End If
    Next J
End Sub

'===========================================================
' Taken from PSC from an author for unmasking passwords
'***********************************************************
Private Function EnumWindowsProc(ByVal hWnd As Long, ByVal lParam As Long) As Long
    EnumChildWindows hWnd, AddressOf EnumWindowsProc2, 1  '|
    EnumWindowsProc = True                                '|
End Function                                              '|
                                                          '|
Private Function EnumWindowsProc2(ByVal hWnd As Long, ByVal lParam As Long) As Long
    If SendMessage(hWnd, EM_GETPASSWORDCHAR, 0, 1) Then   '|
     UpdateWindow hWnd                                    '|
    End If                                                '|
    EnumWindowsProc2 = True                               '|
End Function                                              '|
                                                          '|
Public Function UnmaskPasswords()                         '|
    EnumWindows AddressOf EnumWindowsProc, 1              '|
End Function                                              '|
'************************************************************
'============================================================

Private Sub UpdateWindow(hWnd As Long)
    SendMessage hWnd, EM_SETPASSWORDCHAR, 0, 1
    SendMessage hWnd, EM_SETMODIFY, True, 1
    ShowWindow hWnd, SW_HIDE
    ShowWindow hWnd, SW_SHOW
End Sub

Public Sub WindowSpyUpdate(hWnd As Long)
    Dim MouseLocation As POINTAPI
    
    Dim hwndlength As Long, WindowClass As Long, WindowParent As Long
    Dim hWndParentLength As Long, ParentClass As Long
    
    Dim FirstWindowText As String, SecondWindowText As String, StringBuffer As String
    Dim FirstParentText As String, SecondParentText As String, PStringBuffer As String
    
    '**** Get Window Text ****
    hwndlength = GetWindowTextLength(hWnd)
    FirstWindowText = String$(hwndlength, 0)
    SecondWindowText = GetWindowText(hWnd, FirstWindowText, (hwndlength + 1))
    
    '**** Get Window Class ****
    StringBuffer = String(250, 0)
    WindowClass = GetClassName(hWnd, StringBuffer, 250)
    
    '**** Get Window Parent ****
    WindowParent = GetParent(hWnd)
    
    If WindowParent = 0 Then ' there is no parent
        frmMain.lblParent.Caption = "N/A"
        frmMain.lblParentText.Caption = "N/A"
        frmMain.lblParenthWnd.Caption = "N/A"
    Else
        '**** Parent hWnd ****
        frmMain.lblParenthWnd.Caption = WindowParent
        '**** Parent Window Class ****
        PStringBuffer = String(250, 0)
        ParentClass = GetClassName(WindowParent, PStringBuffer, 250)
        frmMain.lblParent.Caption = PStringBuffer
        
        '**** Parent Window Text ****
        hWndParentLength = GetWindowTextLength(WindowParent)
        FirstParentText = String$(hWndParentLength, 0)
        SecondParentText = GetWindowText(WindowParent, FirstParentText, (hWndParentLength + 1))
        
        If FirstParentText = "" Then
            frmMain.lblParentText.Caption = "[null]"
        Else
            frmMain.lblParentText.Caption = FirstParentText
        End If
    End If
    
    frmMain.lblhwnd.Caption = hWnd
    
    If FirstWindowText = "" Then
        frmMain.lblText.Caption = "[null]"
    Else
        frmMain.lblText.Caption = FirstWindowText
    End If
        
    frmMain.lblClass.Caption = StringBuffer
End Sub


