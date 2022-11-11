VERSION 5.00
Object = "{248DD890-BB45-11CF-9ABC-0080C7E7B78D}#1.0#0"; "MSWINSCK.OCX"
Object = "{3B7C8863-D78F-101B-B9B5-04021C009402}#1.2#0"; "RICHTX32.OCX"
Begin VB.Form Form1 
   Caption         =   "Form1"
   ClientHeight    =   3915
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   8715
   LinkTopic       =   "Form1"
   ScaleHeight     =   3915
   ScaleWidth      =   8715
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton Command4 
      Caption         =   "Parse Info"
      Height          =   525
      Left            =   4650
      TabIndex        =   8
      Top             =   450
      Width           =   1245
   End
   Begin VB.TextBox p 
      Height          =   2745
      Left            =   4650
      MultiLine       =   -1  'True
      ScrollBars      =   2  'Vertical
      TabIndex        =   7
      Top             =   1050
      Width           =   3945
   End
   Begin VB.CommandButton Command3 
      Caption         =   "Parse"
      Height          =   435
      Left            =   3270
      TabIndex        =   6
      Top             =   540
      Width           =   1245
   End
   Begin RichTextLib.RichTextBox resp 
      Height          =   2745
      Left            =   90
      TabIndex        =   5
      Top             =   1050
      Width           =   4485
      _ExtentX        =   7911
      _ExtentY        =   4842
      _Version        =   393217
      Enabled         =   -1  'True
      ScrollBars      =   2
      TextRTF         =   $"Form1.frx":0000
   End
   Begin MSWinsockLib.Winsock sock 
      Left            =   2130
      Top             =   1380
      _ExtentX        =   741
      _ExtentY        =   741
      _Version        =   393216
      Protocol        =   1
   End
   Begin VB.Timer Timer1 
      Interval        =   250
      Left            =   150
      Top             =   2670
   End
   Begin VB.TextBox port 
      Height          =   315
      Left            =   3150
      TabIndex        =   4
      Text            =   "Text3"
      Top             =   90
      Width           =   675
   End
   Begin VB.TextBox ip 
      Height          =   315
      Left            =   1350
      TabIndex        =   3
      Text            =   "Text2"
      Top             =   90
      Width           =   1755
   End
   Begin VB.TextBox str2 
      Height          =   345
      Left            =   1380
      TabIndex        =   2
      Text            =   "players"
      Top             =   540
      Width           =   1695
   End
   Begin VB.CommandButton Command2 
      Caption         =   "Query"
      Height          =   465
      Left            =   60
      TabIndex        =   1
      Top             =   510
      Width           =   1245
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Connect"
      Height          =   405
      Left            =   60
      TabIndex        =   0
      Top             =   60
      Width           =   1245
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Dim mainstr As String

Private Sub Command1_Click()
    sock.RemoteHost = "199.173.16.60"
    sock.RemotePort = 27015
    'sock.LocalPort = 27035
    sock.Bind
End Sub

Private Sub Command2_Click()
    sock.SendData Chr(255) & Chr(255) & Chr(255) & Chr(255) & str2.Text & Chr(0)
    str2.Text = ""
End Sub

Private Sub Command3_Click()
    Dim tstr As String
    Dim sleft As Integer
    Dim eright As Integer
    Dim dint(4) As Integer
    Dim x As Integer
    
    'Dim playnum As Integer
    Dim playname As String
    Dim frags As Integer
    Dim playnum As Byte
    
    Dim getName As Boolean
    Dim getPlayNum As Boolean
    Dim getFrags As Boolean
    
    getName = False
    getPlayNum = True
    getFrags = False
    
    For x = 7 To Len(mainstr)
        If (getPlayNum) Then
            playnum = Asc(Mid(mainstr, x, 1))
            getPlayNum = False
            getName = True
            sleft = x + 1
        End If
        
        If (getName) Then
            If (Mid(mainstr, x, 1) = Chr(0)) Then
                eright = x
                playname = Mid(mainstr, sleft, (eright - sleft))
            getName = False
            getFrags = True
            End If
        End If
        
        If (getFrags) Then
            'Debug.Print Asc(Mid(mainstr, x + 1, 1))
            'Debug.Print Chr(Asc(Mid(mainstr, x + 1, 1)))
            'Debug.Print HexToDec(Chr(Asc(Mid(mainstr, x + 1, 1))))
            'tstr = Asc(Mid(mainstr, x + 1, 1))
            
            dint(0) = Asc(Mid(mainstr, x + 1, 1)) 'HexToDec(Mid(mainstr, x + 1, 1))
            dint(1) = Asc(Mid(mainstr, x + 2, 1)) 'HexToDec(Mid(mainstr, x + 2, 1))
            dint(2) = Asc(Mid(mainstr, x + 3, 1)) 'HexToDec(Mid(mainstr, x + 3, 1))
            dint(3) = Asc(Mid(mainstr, x + 4, 1)) 'HexToDec(Mid(mainstr, x + 4, 1))
            frags = dint(0) + dint(1) + dint(2) + dint(3)
            getFrags = False
            getPlayNum = True
            x = x + 8
            p.Text = p.Text & playnum & " " & playname & " " & frags & vbCrLf
        End If
    Next x
    
        
    
    ' skip first 5
    ' first bit = player 1s number
    ' start getting name
    ' stop getting name once come upon chr(0)
    '   next 4 bits = that players frag count
    ' next 4 bits are time on server ... worthless
    ' once done with 4 worthless, next bit = next players #
End Sub

Private Sub Command4_Click()
    Dim x As Integer
    Dim strArray(6) As String
    Dim sleft As Integer
    Dim eright As Integer
    Dim tstr As String
    Dim y As Integer
    
    sleft = 6
    y = 0
    For x = 6 To Len(mainstr)
        If (Mid(mainstr, x, 1) = Chr(0)) Then
            eright = x
            strArray(y) = Mid(mainstr, sleft, (eright - sleft))
            y = y + 1
            
            If (y = 5) Then Exit For
            
            sleft = x
        End If
    Next x
End Sub

Private Sub sock_Close()
    If sock.State <> 0 Then sock.Close
End Sub

Private Sub sock_DataArrival(ByVal bytesTotal As Long)
    Dim str As String
    sock.GetData str, vbString
    resp.Text = str
    'p.Text = str
    mainstr = str
End Sub

Private Sub Timer1_Timer()
Form1.Caption = sock.State
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
