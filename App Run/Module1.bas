Attribute VB_Name = "Module1"
Option Explicit

Public Declare Function GetCursorPos Lib "user32" (lpPoint As POINTAPI) As Long

Public Type POINTAPI
    x As Long
    y As Long
    End Type
    
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
