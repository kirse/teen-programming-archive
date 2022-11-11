Attribute VB_Name = "mdlMouseManager"
Public Declare Sub mouse_event Lib "user32" (ByVal dwFlags As Long, ByVal dx As Long, ByVal dy As Long, ByVal cButtons As Long, ByVal dwExtraInfo As Long)
Public Declare Function SetCursorPos Lib "user32" (ByVal x As Long, ByVal y As Long) As Long
Public Declare Function GetCursorPos Lib "user32" (lpPoint As POINTAPI) As Long
Public Declare Function WindowFromPoint Lib "user32" (ByVal xPoint As Long, ByVal yPoint As Long) As Long
Public Declare Function SendMessageByString Lib "user32" Alias "SendMessageA" (ByVal hwnd As Long, ByVal wMsg As Long, ByVal wParam As Long, ByVal lParam As String) As Long
Public Declare Function GetClassName Lib "user32" Alias "GetClassNameA" (ByVal hwnd As Long, ByVal lpClassName As String, ByVal nMaxCount As Long) As Long
Public Declare Function SendMessage Lib "user32" Alias "SendMessageA" (ByVal hwnd As Long, ByVal wMsg As Long, ByVal wParam As Long, lParam As Any) As Long
Public Declare Function GetDC Lib "user32" (ByVal hwnd As Long) As Long
Public Declare Function GetPixel Lib "gdi32" (ByVal hdc As Long, ByVal x As Long, ByVal y As Long) As Long

    Public Const MOUSEEVENTF_LEFTDOWN = &H2
    Public Const MOUSEEVENTF_LEFTUP = &H4
    Public Const MOUSEEVENTF_MIDDLEDOWN = &H20
    Public Const MOUSEEVENTF_MIDDLEUP = &H40
    Public Const MOUSEEVENTF_RIGHTDOWN = &H8
    Public Const MOUSEEVENTF_RIGHTUP = &H10
    Public Const MOUSEEVENTF_MOVE = &H1

Public Const WM_SETTEXT = &HC
Public Const WM_CLOSE = &H10


Public Type POINTAPI
    x As Long
    y As Long
End Type
    
Public Type MouseAction
    functionNum As Byte
    toXPos As Integer
    toYPos As Integer
    waitTime As Long
    sendText As Boolean
    textToSend As String
    repeatAction As Boolean
    repeatAmt As Integer
End Type


Public Sub ExecuteMouseAction(ByVal num As Byte)
    Select Case num
        Case 0
            LeftDblClick
        Case 1
            LeftClick
        Case 2
            LeftDown
        Case 3
            LeftUp
        Case 4
            RightDblClick
        Case 5
            RightClick
        Case 6
            RightDown
        Case 7
            RightUp
    End Select
End Sub

Public Sub SetMousePos(xPos As Long, yPos As Long)
    SetCursorPos xPos, yPos
End Sub
Public Function GetX() As Long
    Dim n As POINTAPI
    GetCursorPos n
    GetX = n.x
End Function

Public Function GetY() As Long
    Dim n As POINTAPI
    GetCursorPos n
    GetY = n.y
End Function

Public Sub LeftDblClick()
    LeftDown
    LeftUp
    LeftDown
    LeftUp
End Sub
Public Sub LeftClick()
    LeftDown
    LeftUp
End Sub

Public Sub LeftDown()
    mouse_event MOUSEEVENTF_LEFTDOWN, 0, 0, 0, 0
End Sub

Public Sub LeftUp()
    mouse_event MOUSEEVENTF_LEFTUP, 0, 0, 0, 0
End Sub

Public Sub RightDblClick()
    RightDown
    RightUp
    RightDown
    RightUp
End Sub
Public Sub RightClick()
    RightDown
    RightUp
End Sub

Public Sub RightDown()
    mouse_event MOUSEEVENTF_RIGHTDOWN, 0, 0, 0, 0
End Sub

Public Sub RightUp()
    mouse_event MOUSEEVENTF_RIGHTUP, 0, 0, 0, 0
End Sub

Public Function GetColor(ByVal x As Long, ByVal y As Long) As Long
    'Dim Pnt As POINTAPI
    'GetCursorPos Pnt
    'GetColor = GetPixel(GetDC(0), Pnt.x, Pnt.y) ' GetDC(0) returns the screen's hdc
    GetColor = GetPixel(GetDC(0), x, y)
End Function

