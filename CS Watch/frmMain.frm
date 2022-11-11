VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MsComCtl.ocx"
Object = "{248DD890-BB45-11CF-9ABC-0080C7E7B78D}#1.0#0"; "MSWINSCK.OCX"
Begin VB.Form frmMain 
   BackColor       =   &H00E0E0E0&
   BorderStyle     =   0  'None
   Caption         =   "CS Watch"
   ClientHeight    =   4620
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   3255
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
   LockControls    =   -1  'True
   ScaleHeight     =   4620
   ScaleWidth      =   3255
   ShowInTaskbar   =   0   'False
   StartUpPosition =   3  'Windows Default
   Begin VB.Timer tmrRefresh 
      Interval        =   30000
      Left            =   1680
      Top             =   3780
   End
   Begin MSWinsockLib.Winsock sock 
      Index           =   0
      Left            =   2130
      Top             =   3780
      _ExtentX        =   741
      _ExtentY        =   741
      _Version        =   393216
      Protocol        =   1
   End
   Begin MSComctlLib.ImageList imgs 
      Left            =   2580
      Top             =   3630
      _ExtentX        =   1005
      _ExtentY        =   1005
      BackColor       =   -2147483643
      ImageWidth      =   16
      ImageHeight     =   16
      MaskColor       =   12632256
      _Version        =   393216
      BeginProperty Images {2C247F25-8591-11D1-B16A-00C0F0283628} 
         NumListImages   =   7
         BeginProperty ListImage1 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMain.frx":1E72
            Key             =   ""
         EndProperty
         BeginProperty ListImage2 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMain.frx":3CF4
            Key             =   ""
         EndProperty
         BeginProperty ListImage3 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMain.frx":45CE
            Key             =   ""
         EndProperty
         BeginProperty ListImage4 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMain.frx":4EA8
            Key             =   ""
         EndProperty
         BeginProperty ListImage5 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMain.frx":5EFA
            Key             =   ""
         EndProperty
         BeginProperty ListImage6 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMain.frx":6F4C
            Key             =   ""
         EndProperty
         BeginProperty ListImage7 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMain.frx":7F9E
            Key             =   ""
         EndProperty
      EndProperty
   End
   Begin MSComctlLib.TreeView tv 
      Height          =   3885
      Left            =   60
      TabIndex        =   0
      Top             =   360
      Width           =   3135
      _ExtentX        =   5530
      _ExtentY        =   6853
      _Version        =   393217
      Indentation     =   88
      Style           =   1
      SingleSel       =   -1  'True
      ImageList       =   "imgs"
      BorderStyle     =   1
      Appearance      =   0
   End
   Begin VB.Image imgHelp 
      Height          =   240
      Left            =   930
      Top             =   4320
      Width           =   240
   End
   Begin VB.Label status 
      Alignment       =   1  'Right Justify
      BackStyle       =   0  'Transparent
      Caption         =   "cswatch ver 1.0"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FFFFFF&
      Height          =   225
      Left            =   1470
      TabIndex        =   1
      Top             =   4350
      Width           =   1665
   End
   Begin VB.Image imgRefresh 
      Height          =   240
      Left            =   660
      Top             =   4320
      Width           =   240
   End
   Begin VB.Image imgStartCS 
      Height          =   240
      Left            =   1200
      Top             =   4320
      Width           =   240
   End
   Begin VB.Image imgConfig 
      Height          =   240
      Left            =   390
      Top             =   4320
      Width           =   240
   End
   Begin VB.Image imgEditServers 
      Height          =   240
      Left            =   120
      Top             =   4320
      Width           =   240
   End
   Begin VB.Shape shpBack 
      Height          =   525
      Left            =   0
      Top             =   0
      Width           =   2715
   End
   Begin VB.Image imgBottom 
      Height          =   330
      Left            =   0
      Top             =   4290
      Width           =   3255
   End
   Begin VB.Image imgImages 
      Height          =   225
      Index           =   4
      Left            =   2700
      Picture         =   "frmMain.frx":8FF0
      Top             =   60
      Width           =   225
   End
   Begin VB.Image imgImages 
      Height          =   225
      Index           =   2
      Left            =   2940
      Picture         =   "frmMain.frx":93F4
      Top             =   60
      Width           =   225
   End
   Begin VB.Image imgImages 
      Height          =   225
      Index           =   5
      Left            =   2700
      Picture         =   "frmMain.frx":9824
      Top             =   60
      Width           =   240
   End
   Begin VB.Image imgImages 
      Height          =   225
      Index           =   3
      Left            =   2940
      Picture         =   "frmMain.frx":9C40
      Top             =   60
      Width           =   240
   End
   Begin VB.Image imgTitle 
      Height          =   330
      Index           =   0
      Left            =   720
      Top             =   0
      Width           =   1740
   End
   Begin VB.Image imgTitle 
      Height          =   330
      Index           =   1
      Left            =   0
      Top             =   0
      Width           =   3255
   End
End
Attribute VB_Name = "frmMain"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
'====================================================================
' CounterStrike Server Watch 1.0
'
' yet another unfinished VB project by Eric Kirse (psc: kirse)
'
' email: interkinetix@comcast.net
' web: www.interkinetix.com
'
' >>>>>>>>>>>>>>> General Info <<<<<<<<<<<<<<<<
'   This tool enables you to monitor any CS server based on the
'   current CounterStrike 1.5 protocol.  I haven't tested it yet
'   with version 1.6, so let me know on PSC...
'
'   Feel free to do whatever you want with this program.  I don't
'   really care if you take your name and put it on the project.
'   If you do market it, send me an email so I can check it out!
'
'   I learned the CS server protocol from a text file that
'   comes with the half-life SDK.
'   http://www.gametiger.net/server-proto.txt
'
'
' >>>>>>>>>>>>>>> The Layout <<<<<<<<<<<<<<<<<<
'   In mod_cswatch, I have 3 udts (classes as you call them in c++)
'   - Server: largest object, contains player and info classes
'   - Player: stores info about each player (32 max in each server..)
'   - Info: Holds server variables (current map, num players, etc)
'
'   I have broken the program in to several functions, with the
'   intent that you could just copy and paste into your own project.
'   All you would need is to copy my UDTs and my Classes...
'   Then, you would have to query a CS Server and just send the packet
'   to my functions, which then populate the UDTs...
'
'
' >>>> Thanks to: All those from who I may have borrowed code
'
' IF YOU LIKED MY CODE, PLEASE VOTE.  IT'S THE LEAST YOU CAN DO...
' Thanks.
'====================================================================


Option Explicit
Dim small As Boolean
Dim change As Boolean

Private Sub Form_Load()
    Dim X As Integer
    
    For X = 1 To MAX_SERVERS
        Load sock(X)
        sock(X).Protocol = sckUDPProtocol
        reqState(X) = CSSOCK_IDLE
    Next X
    
    change = True
    
    ' didnt quite get to building in a timeout function, so
    '   putting in an IP that isn't online will make you wait really long
    '
    ' MAX_SERVERS in mod_cswatch is global constant for loop use, etc...
    ' So, this program will only reference MAX_SERVERS servers unless you
    ' increase its value in the module... I have one server here for testing
    csServer(0).ip = "216.13.76.69"
    csServer(0).port = 27016
    
    loadImages
End Sub

Private Sub Form_Resize()
    shpBack.Height = frmMain.Height
    shpBack.Width = frmMain.Width
End Sub

Private Sub Form_Unload(Cancel As Integer)
    Dim X As Integer
    
    For X = 1 To MAX_SERVERS
        Unload sock(X)
    Next X
End Sub

Private Sub imgConfig_Click()
    frmConfig.Top = frmMain.Top + 500
    frmConfig.Left = frmMain.Left + 300
    frmConfig.Show
End Sub

Private Sub imgConfig_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
    If (change) Then status.Caption = "configure cswatch"
End Sub

Private Sub imgEditServers_Click()
    ' show new dialog box here
    frmEditServers.Top = frmMain.Top + 500
    frmEditServers.Left = frmMain.Left + 300
    frmEditServers.Show
End Sub

Private Sub imgEditServers_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
    If (change) Then status.Caption = "edit server list"
End Sub

Private Sub imgHelp_Click()
    ' naviagte to help here...
End Sub

Private Sub imgHelp_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
    If (change) Then status.Caption = "help!"
End Sub

Private Sub imgImages_MouseDown(Index As Integer, Button As Integer, Shift As Integer, X As Single, Y As Single)
    imgImages(Index).Visible = False
End Sub

Private Sub imgImages_MouseMove(Index As Integer, Button As Integer, Shift As Integer, X As Single, Y As Single)
    If (Index = 2) Then
        If (change) Then status.Caption = "exit"
    ElseIf (Index = 4) Then
        If (change) Then status.Caption = "send to tray"
    End If
End Sub

Private Sub imgImages_MouseUp(Index As Integer, Button As Integer, Shift As Integer, X As Single, Y As Single)
    imgImages(Index).Visible = True
    If (Index = 2) Then
        UnloadAll
        End
    End If
End Sub

Private Sub imgRefresh_Click()
    change = False
    Call refreshAll
    change = True
    Call populateTV
End Sub

Private Sub imgRefresh_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
    If (change) Then status.Caption = "refresh server list"
End Sub

Private Sub imgStartCS_Click()
    ' code here
End Sub

Private Sub imgStartCS_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
    If (change) Then status.Caption = "start CS"
End Sub

Private Sub imgTitle_DblClick(Index As Integer)
    'If (small = False) Then
    '    frmMain.Height = imgTitle(0).Height + imgBotLeft.Height
    '    small = True
    'Else
    '    frmMain.Height = 4620
    '    small = False
    'End If
End Sub

Private Sub imgTitle_MouseDown(Index As Integer, Button As Integer, Shift As Integer, X As Single, Y As Single)
    FormDrag Me
End Sub

'TV1.Nodes.Add , , "main", "Contents" 'Create Main Parent
'    TV1.Nodes.Add "main", tvwChild, "I1", "Example #1" 'Child Node to the Main Parent or ROOT
'    TV1.Nodes.Add "I1", tvwChild, "SI1", "Example #1's Child Node"
'        TV1.Nodes.Add "main", tvwChild, "I2", "Example #2"
'            TV1.Nodes.Add "main", tvwChild, "I3", "Example #3"
'            TV1.Nodes.Add "I3", tvwChild, "IA3", "Example #3's Child Node"
'            TV1.Nodes.Add "IA3", tvwChild, "IAA3", "Example #3's 2nd Child Node"
'                TV1.Nodes.Add "main", tvwChild, "L1", "Load List Example"
'                TV1.Nodes.Add "L1", tvwChild, "LA1", "Click To Load List"

Public Sub populateTV()
    'fill up our treeview control with our current server info!
    Dim X As Integer
    Dim Y As Integer
    Dim rootServ As String
    Dim tstr As String
    
    tv.Nodes.Clear
    For X = 0 To MAX_SERVERS
        If (csServer(X).servInfo.ip <> "") Then
            rootServ = "S" & str(X)
            
            tv.Nodes.Add , , rootServ, csServer(X).servInfo.servername, 2
            tv.Nodes.Add rootServ, tvwChild, "info" & str(X), "Server Details", 4
            tv.Nodes.Add "info" & str(X), tvwChild, "ip" & str(X), "Ip: " & csServer(X).servInfo.ip, 6
            tv.Nodes.Add "info" & str(X), tvwChild, "map" & str(X), "Map: " & csServer(X).servInfo.map, 6
            tv.Nodes.Add "info" & str(X), tvwChild, "gamedir" & str(X), "Game Dir: " & csServer(X).servInfo.gamedir, 6
            tv.Nodes.Add "info" & str(X), tvwChild, "gametype" & str(X), "Game Type: " & csServer(X).servInfo.gametype, 6
            tv.Nodes.Add "info" & str(X), tvwChild, "numplayers" & str(X), "Players: " & csServer(X).servInfo.curPlayers & " / " & csServer(X).servInfo.maxPlayers, 6
            tv.Nodes.Add "info" & str(X), tvwChild, "ping" & str(X), "Ping: " & csServer(X).ping & " ms", 6
            tv.Nodes.Add rootServ, tvwChild, "players" & str(X), "Active Players", 5
            
            For Y = 0 To csServer(X).servInfo.curPlayers
                tstr = str(X) & str(Y)
                If (csServer(X).playerInfo(Y).name <> "") Then
                    tv.Nodes.Add "players" & str(X), tvwChild, tstr, "(" & csServer(X).playerInfo(Y).frags & ") " & csServer(X).playerInfo(Y).name, 7
                End If
            Next Y
        End If
    Next X
    tv.Refresh
End Sub

Public Sub refreshAll()
    Dim X As Integer
    ' function that uses UDP protocol to query the CS server for
    '   various information...
    ' check out the text-file in the half-life SDK for more info
    ' (http://www.gametiger.net/server-proto.txt)
    For X = 0 To MAX_SERVERS
        If (csServer(X).ip <> "") Then
            sock(X).RemoteHost = csServer(X).ip
            sock(X).RemotePort = csServer(X).port
            sock(X).Bind
            If (sock(X).state = 1) Then
                status.Caption = "refreshing " & str(X) & " / " & MAX_SERVERS
                reqState(X) = CSSOCK_INFOREQ
                sndCom X, "info"
            End If
        End If
    Next X
    
    Call waitTillReady
    
    For X = 0 To MAX_SERVERS
        If (csServer(X).ip <> "") Then
            If (sock(X).state = 1) Then
                reqState(X) = CSSOCK_PLAYREQ
                sndCom X, "players"
            End If
        End If
    Next X
    
    Call waitTillReady
    
    For X = 0 To MAX_SERVERS
        If (csServer(X).ip <> "") Then
            If (sock(X).state = 1) Then
                reqState(X) = CSSOCK_PING
                sndCom X, "ping"
                sTime(X) = Timer
            End If
        End If
    Next X
    
    Call waitTillReady
    Call closeAllSocks
End Sub

Public Sub setInfo(ByVal packetStr As String, ByVal key As Byte)
    ' Once we sent the "info" query to CS Server, it sends back our packet
    ' This function just decodes that packet and places it into the Info class
    
    Dim X As Integer
    Dim strArray(5) As String
    Dim sleft As Integer
    Dim eright As Integer
    Dim tstr As String
    Dim Y As Integer
    
    sleft = 6
    Y = 0
    
    For X = 6 To Len(packetStr)
        If (Mid(packetStr, X, 1) = Chr(0)) Then
            eright = X
            strArray(Y) = Mid(packetStr, sleft, (eright - sleft))
            Y = Y + 1
            If (Y = 5) Then Exit For 'were done with our 5 strings...
            sleft = X + 1
        End If
    Next X
    
    X = X + 1
    
    csServer(key).servInfo.ip = strArray(0)
    csServer(key).servInfo.servername = strArray(1)
    csServer(key).servInfo.map = strArray(2)
    csServer(key).servInfo.gamedir = strArray(3)
    csServer(key).servInfo.gametype = strArray(4)
    csServer(key).servInfo.curPlayers = Asc(Mid(packetStr, X, 1))
    csServer(key).servInfo.maxPlayers = Asc(Mid(packetStr, (X + 1), 1))
End Sub

Public Sub setPlayers(ByVal packetStr As String, ByVal key As Byte)
    ' After sending the "players" command to the CS server
    ' (and we get a response), this function is designed to parse
    '  that UDP packet... Data is stored in "Player" class
    
    'Dim tstr As String
    Dim sleft As Integer
    Dim eright As Integer
    Dim dint(4) As Integer
    Dim slot As Byte
    Dim X As Integer
    
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
    
    For X = 7 To Len(packetStr)
        If (getPlayNum) Then
            playnum = Asc(Mid(packetStr, X, 1))
            getPlayNum = False
            getName = True
            sleft = X + 1
        End If
        
        If (getName) Then
            If (Mid(packetStr, X, 1) = Chr(0)) Then
                eright = X
                playname = Mid(packetStr, sleft, (eright - sleft))
                getName = False
                getFrags = True
            End If
        End If
        
        If (getFrags) Then
            'Debug.Print Asc(Mid(mainstr, x + 1, 1))
            'Debug.Print Chr(Asc(Mid(mainstr, x + 1, 1)))
            'Debug.Print HexToDec(Chr(Asc(Mid(mainstr, x + 1, 1))))
            'tstr = Asc(Mid(mainstr, x + 1, 1))
            
            dint(0) = Asc(Mid(packetStr, X + 1, 1)) 'HexToDec(Mid(mainstr, x + 1, 1))
            dint(1) = Asc(Mid(packetStr, X + 2, 1)) 'HexToDec(Mid(mainstr, x + 2, 1))
            dint(2) = Asc(Mid(packetStr, X + 3, 1)) 'HexToDec(Mid(mainstr, x + 3, 1))
            dint(3) = Asc(Mid(packetStr, X + 4, 1)) 'HexToDec(Mid(mainstr, x + 4, 1))
            frags = dint(0) + dint(1) + dint(2) + dint(3)
            getFrags = False
            getPlayNum = True
            X = X + 8
            'p.Text = p.Text & playnum & " " & playname & " " & frags & vbCrLf
            csServer(key).playerInfo(slot).Number = playnum
            csServer(key).playerInfo(slot).name = playname
            csServer(key).playerInfo(slot).frags = frags
            
            slot = slot + 1
        End If
    Next X
End Sub

Public Sub sndCom(ByVal sockNum As Byte, ByVal str As String)
    ' The CS server protocol states data must be sent in this
    ' form: 4 consecutive bytes of 255, then the command, then zero terminator
    On Error Resume Next
    sock(sockNum).SendData Chr(255) & Chr(255) & Chr(255) & Chr(255) & str & Chr(0)
End Sub

Private Sub imgTitle_MouseMove(Index As Integer, Button As Integer, Shift As Integer, X As Single, Y As Single)
    If (change) Then status.Caption = "interkinetix.com"
End Sub

Private Sub sock_Close(Index As Integer)
    If (sock(Index).state <> 0) Then sock(Index).Close
    reqState(Index) = CSSOCK_IDLE
End Sub

Private Sub sock_DataArrival(Index As Integer, ByVal bytesTotal As Long)
    On Error GoTo sockError
    
    Dim data As String
    sock(Index).GetData data, vbString
    
    Select Case reqState(Index)
        Case CSSOCK_IDLE
            ' error handle?
        Case CSSOCK_INFOREQ
            ' send packet to our info parser
            ' set state to idle
            setInfo data, Index
            reqState(Index) = CSSOCK_IDLE
            Exit Sub
        Case CSSOCK_PLAYREQ
            ' send packet to player parser
            ' set state to idle
            setPlayers data, Index
            reqState(Index) = CSSOCK_IDLE
            Exit Sub
        Case CSSOCK_PING
            ' update status
            ' set state to idle
            fTime(Index) = Timer
            csServer(Index).ping = CInt(((fTime(Index) - sTime(Index)) * 1000))
            reqState(Index) = CSSOCK_IDLE
    End Select
    
sockError:
    sock(Index).Close
    reqState(Index) = CSSOCK_IDLE
End Sub

Private Function allSocksReady(ByVal numSocks As Byte) As Boolean
    Dim X As Byte
    
    For X = 0 To numSocks
        If (reqState(X) <> CSSOCK_IDLE) Then
            allSocksReady = False
            Exit Function
        End If
    Next X
    
    allSocksReady = True
End Function

Private Sub debugOutput(ByVal level As Byte, ByVal numS As Byte)
    'Used for outputting to intermediate window... Helped a lot while
    'I was debugging my application...
    Dim X As Integer
    Dim Y As Integer
    
        Select Case level
            Case 0 ' print all info
                For X = 0 To numS
                    If (csServer(X).ip <> "") Then
                        Debug.Print "ServerName: " & csServer(X).servInfo.servername
                        Debug.Print "IP: " & csServer(X).servInfo.ip
                        Debug.Print "Map: " & csServer(X).servInfo.map
                        Debug.Print "GameDir: " & csServer(X).servInfo.gamedir
                        Debug.Print "GameIs: " & csServer(X).servInfo.gametype
                        Debug.Print "Players: " & csServer(X).servInfo.curPlayers & " / "; csServer(X).servInfo.maxPlayers
                        Debug.Print "Ping: " & csServer(X).ping
                        Debug.Print "=========================================="
                        
                        For Y = 0 To csServer(X).servInfo.curPlayers
                            Debug.Print csServer(X).playerInfo(Y).Number & ") " & csServer(X).playerInfo(Y).name
                            Debug.Print "Frags: " & csServer(X).playerInfo(Y).frags
                        Next Y
                        
                    End If
                Next X
            Case 1 ' just serv info
                For X = 0 To numS
                    If (csServer(X).ip <> "") Then
                        Debug.Print "ServerName: " & csServer(X).servInfo.servername
                        Debug.Print "IP: " & csServer(X).servInfo.ip
                        Debug.Print "Map: " & csServer(X).servInfo.map
                        Debug.Print "GameDir: " & csServer(X).servInfo.gamedir
                        Debug.Print "GameIs: " & csServer(X).servInfo.gametype
                        Debug.Print "Players: " & csServer(X).servInfo.curPlayers & " / "; csServer(X).servInfo.maxPlayers
                        Debug.Print "Ping: " & csServer(X).ping
                    End If
                Next X
            Case 2 'just players
                 If (csServer(X).ip <> "") Then
                        Debug.Print "ServerName: " & csServer(X).servInfo.servername
                        Debug.Print "=========================================="
                        
                        For Y = 0 To csServer(X).servInfo.curPlayers
                            Debug.Print csServer(X).playerInfo(Y).Number & ") " & csServer(X).playerInfo(Y).name
                            Debug.Print "Frags: " & csServer(X).playerInfo(Y).frags
                        Next Y
                        
                    End If
            End Select
End Sub

Public Sub clearAllServers()
    Dim X As Integer
    Dim Y As Integer
    
    For X = 0 To MAX_SERVERS
        csServer(X).servInfo.curPlayers = 0
        csServer(X).servInfo.gamedir = ""
        csServer(X).servInfo.gametype = ""
        csServer(X).servInfo.ip = ""
        csServer(X).servInfo.map = ""
        csServer(X).servInfo.maxPlayers = 0
        csServer(X).servInfo.servername = ""
        For Y = 0 To 32
            csServer(X).playerInfo(Y).frags = 0
            csServer(X).playerInfo(Y).name = ""
            csServer(X).playerInfo(Y).Number = 0
        Next Y
    Next X
End Sub

Private Sub closeAllSocks()
    Dim X As Integer
    
    For X = 0 To MAX_SERVERS
        sock(X).Close
    Next X
End Sub

Private Sub waitTillReady()
    Dim closed As Boolean
    closed = allSocksReady(MAX_SERVERS)
    Do Until (closed = True)
        closed = allSocksReady(MAX_SERVERS)
        DoEvents
    Loop
End Sub

Private Sub sock_Error(Index As Integer, ByVal Number As Integer, Description As String, ByVal Scode As Long, ByVal Source As String, ByVal HelpFile As String, ByVal HelpContext As Long, CancelDisplay As Boolean)
    If (Number = 10054) Then
        MsgBox "Server Could not be Contacted"
    End If
End Sub

Private Sub tmrRefresh_Timer()
    change = False
    Call refreshAll
    change = True
    Call populateTV
End Sub

Private Sub tv_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
    If (change) Then status.Caption = "current server info"
End Sub

Private Sub loadImages()
    Dim path As String
    path = App.path & "\gfx\"
    
    imgTitle(0).Picture = LoadPicture(path & "cswatch.bmp")
    imgTitle(1).Picture = LoadPicture(path & "titlebar.bmp")
    imgBottom.Picture = LoadPicture(path & "titlebar.bmp")
    imgEditServers.Picture = LoadPicture(path & "Amc q-term.ico")
    imgConfig.Picture = LoadPicture(path & "Amc Sys.ico")
    imgRefresh = LoadPicture(path & "Amc Lgc.ico")
    imgHelp = LoadPicture(path & "Amc Hlp.ico")
    imgStartCS = LoadPicture(path & "cstrike.ico")
End Sub
