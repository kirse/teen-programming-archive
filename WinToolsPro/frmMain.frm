VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Begin VB.Form frmMain 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Window Tools Professional"
   ClientHeight    =   5040
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   7020
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
   ScaleHeight     =   5040
   ScaleWidth      =   7020
   StartUpPosition =   3  'Windows Default
   Begin MSComctlLib.StatusBar Status 
      Align           =   2  'Align Bottom
      Height          =   255
      Left            =   0
      TabIndex        =   41
      Top             =   4785
      Width           =   7020
      _ExtentX        =   12383
      _ExtentY        =   450
      Style           =   1
      _Version        =   393216
      BeginProperty Panels {8E3867A5-8586-11D1-B16A-00C0F0283628} 
         NumPanels       =   1
         BeginProperty Panel1 {8E3867AB-8586-11D1-B16A-00C0F0283628} 
         EndProperty
      EndProperty
   End
   Begin VB.CheckBox chkUnmask 
      Caption         =   "Unmask PW"
      Enabled         =   0   'False
      Height          =   315
      Left            =   5700
      TabIndex        =   40
      Top             =   4350
      Width           =   1155
   End
   Begin VB.CommandButton cmdHelp 
      Caption         =   "Help"
      Height          =   345
      Left            =   5760
      TabIndex        =   39
      Top             =   3900
      Width           =   1155
   End
   Begin VB.CommandButton cmdWeb 
      Caption         =   "Website"
      Height          =   345
      Left            =   5760
      TabIndex        =   38
      Top             =   3570
      Width           =   1155
   End
   Begin VB.CommandButton cmdAdvanced 
      Caption         =   "Advanced..."
      Height          =   345
      Left            =   4620
      TabIndex        =   37
      Top             =   3900
      Width           =   1155
   End
   Begin VB.CommandButton cmdKillParent 
      Caption         =   "Kill Parent"
      Height          =   345
      Left            =   3480
      MaskColor       =   &H0080FFFF&
      Style           =   1  'Graphical
      TabIndex        =   36
      Top             =   3900
      UseMaskColor    =   -1  'True
      Width           =   1155
   End
   Begin VB.CommandButton cmdHScan 
      Caption         =   "hWnd Scan"
      Height          =   345
      Left            =   4620
      TabIndex        =   35
      Top             =   3570
      Width           =   1155
   End
   Begin VB.CheckBox chkKill 
      Caption         =   "Kill Prompt"
      Height          =   315
      Left            =   3420
      TabIndex        =   34
      Top             =   4350
      Value           =   1  'Checked
      Width           =   1065
   End
   Begin VB.PictureBox picWinTools 
      AutoSize        =   -1  'True
      BorderStyle     =   0  'None
      Height          =   4500
      Left            =   90
      MousePointer    =   2  'Cross
      ScaleHeight     =   4500
      ScaleWidth      =   750
      TabIndex        =   33
      Top             =   150
      Width           =   750
   End
   Begin VB.CheckBox chkHiddenWins 
      Caption         =   "Hidden List"
      Height          =   315
      Left            =   4530
      TabIndex        =   32
      Top             =   4350
      Width           =   1125
   End
   Begin VB.CommandButton cmdShowParent 
      Caption         =   "Show Parent"
      Height          =   345
      Left            =   2250
      TabIndex        =   31
      Top             =   3900
      Width           =   1245
   End
   Begin VB.CommandButton cmdShowWin 
      Caption         =   "Show Window"
      Height          =   345
      Left            =   930
      TabIndex        =   30
      Top             =   3900
      Width           =   1335
   End
   Begin VB.Timer tmrAuto 
      Enabled         =   0   'False
      Interval        =   250
      Left            =   6450
      Top             =   240
   End
   Begin VB.CheckBox chkAuto 
      Caption         =   "Auto Mode"
      Height          =   315
      Left            =   2280
      TabIndex        =   26
      Top             =   4350
      Width           =   1095
   End
   Begin VB.CheckBox chkOnTop 
      Caption         =   "Keep On Top"
      Height          =   315
      Left            =   960
      TabIndex        =   25
      Top             =   4350
      Width           =   1275
   End
   Begin VB.CommandButton cmdKillWin 
      Caption         =   "Kill Window"
      Height          =   345
      Left            =   3480
      TabIndex        =   24
      Top             =   3570
      Width           =   1155
   End
   Begin VB.CommandButton cmdToggleParent 
      Caption         =   "Hide Parent"
      Height          =   345
      Left            =   2250
      TabIndex        =   23
      Top             =   3570
      Width           =   1245
   End
   Begin VB.CommandButton cmdToggleWin 
      Caption         =   "Hide Window"
      Height          =   345
      Left            =   930
      TabIndex        =   22
      Top             =   3570
      Width           =   1335
   End
   Begin VB.TextBox txtNewParentText 
      Appearance      =   0  'Flat
      Height          =   285
      Left            =   2490
      TabIndex        =   21
      Top             =   3180
      Width           =   3045
   End
   Begin VB.TextBox txtNewWinText 
      Appearance      =   0  'Flat
      Height          =   285
      Left            =   2490
      TabIndex        =   20
      Top             =   2880
      Width           =   3045
   End
   Begin VB.CommandButton cmdParentText 
      Caption         =   "Set Parent Text"
      Height          =   315
      Left            =   930
      TabIndex        =   19
      Top             =   3180
      Width           =   1425
   End
   Begin VB.CommandButton cmdWinText 
      Caption         =   "Set Window Text"
      Height          =   315
      Left            =   930
      TabIndex        =   18
      Top             =   2880
      Width           =   1425
   End
   Begin VB.TextBox txtShow 
      Appearance      =   0  'Flat
      Height          =   285
      IMEMode         =   3  'DISABLE
      Left            =   930
      Locked          =   -1  'True
      TabIndex        =   10
      Top             =   2520
      Width           =   5985
   End
   Begin VB.CommandButton cmdGet 
      BackColor       =   &H00E0E0E0&
      Caption         =   "Click, Drag, then Release"
      Height          =   555
      Left            =   5670
      Style           =   1  'Graphical
      TabIndex        =   9
      Top             =   2910
      Width           =   1245
   End
   Begin VB.Frame fraWindowDetails 
      Caption         =   "Window Details"
      Height          =   2295
      Left            =   930
      TabIndex        =   0
      Top             =   120
      Width           =   5985
      Begin VB.Label lblParenthWnd 
         AutoSize        =   -1  'True
         Caption         =   "[none]"
         Height          =   195
         Left            =   1590
         TabIndex        =   29
         Top             =   1950
         Width           =   480
      End
      Begin VB.Label lblToText 
         AutoSize        =   -1  'True
         Caption         =   "°"
         ForeColor       =   &H00FF0000&
         Height          =   195
         Index           =   5
         Left            =   150
         TabIndex        =   28
         Top             =   1950
         Width           =   75
      End
      Begin VB.Label Label6 
         Caption         =   "Parent hWnd:"
         Height          =   225
         Left            =   300
         TabIndex        =   27
         Top             =   1950
         Width           =   1035
      End
      Begin VB.Label lblParentText 
         AutoSize        =   -1  'True
         Caption         =   "[none]"
         Height          =   195
         Left            =   1590
         TabIndex        =   17
         Top             =   1620
         Width           =   480
      End
      Begin VB.Label lblToText 
         AutoSize        =   -1  'True
         Caption         =   "°"
         ForeColor       =   &H00FF0000&
         Height          =   195
         Index           =   4
         Left            =   150
         TabIndex        =   16
         Top             =   1650
         Width           =   75
      End
      Begin VB.Label Label5 
         Caption         =   "Parent Text:"
         Height          =   195
         Left            =   300
         TabIndex        =   15
         Top             =   1620
         Width           =   915
      End
      Begin VB.Label lblToText 
         AutoSize        =   -1  'True
         Caption         =   "°"
         ForeColor       =   &H00FF0000&
         Height          =   195
         Index           =   3
         Left            =   150
         TabIndex        =   14
         Top             =   1320
         Width           =   75
      End
      Begin VB.Label lblToText 
         AutoSize        =   -1  'True
         Caption         =   "°"
         ForeColor       =   &H00FF0000&
         Height          =   195
         Index           =   2
         Left            =   150
         TabIndex        =   13
         Top             =   990
         Width           =   75
      End
      Begin VB.Label lblToText 
         AutoSize        =   -1  'True
         Caption         =   "°"
         ForeColor       =   &H00FF0000&
         Height          =   195
         Index           =   1
         Left            =   150
         TabIndex        =   12
         Top             =   660
         Width           =   75
      End
      Begin VB.Label lblToText 
         AutoSize        =   -1  'True
         Caption         =   "°"
         ForeColor       =   &H00FF0000&
         Height          =   195
         Index           =   0
         Left            =   150
         TabIndex        =   11
         Top             =   330
         Width           =   75
      End
      Begin VB.Label lblParent 
         AutoSize        =   -1  'True
         Caption         =   "[none]"
         Height          =   195
         Left            =   1590
         TabIndex        =   8
         Top             =   1290
         Width           =   480
      End
      Begin VB.Label lblClass 
         AutoSize        =   -1  'True
         Caption         =   "[none]"
         Height          =   195
         Left            =   1590
         TabIndex        =   7
         Top             =   960
         Width           =   480
      End
      Begin VB.Label lblText 
         AutoSize        =   -1  'True
         Caption         =   "[none]"
         Height          =   195
         Left            =   1590
         TabIndex        =   6
         Top             =   630
         Width           =   480
      End
      Begin VB.Label lblhwnd 
         AutoSize        =   -1  'True
         Caption         =   "[none]"
         Height          =   195
         Left            =   1590
         TabIndex        =   5
         Top             =   300
         Width           =   480
      End
      Begin VB.Label Label4 
         AutoSize        =   -1  'True
         Caption         =   "Parent Class:"
         Height          =   195
         Left            =   300
         TabIndex        =   4
         Top             =   1290
         Width           =   960
      End
      Begin VB.Label Label3 
         AutoSize        =   -1  'True
         Caption         =   "Class:"
         Height          =   195
         Left            =   300
         TabIndex        =   3
         Top             =   960
         Width           =   435
      End
      Begin VB.Label Label2 
         AutoSize        =   -1  'True
         Caption         =   "Text:"
         Height          =   195
         Left            =   300
         TabIndex        =   2
         Top             =   630
         Width           =   390
      End
      Begin VB.Label Label1 
         AutoSize        =   -1  'True
         Caption         =   "Handle (hWnd):"
         Height          =   195
         Left            =   300
         TabIndex        =   1
         Top             =   300
         Width           =   1140
      End
   End
End
Attribute VB_Name = "frmMain"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
'######################################################################################
'
'       PLEASE FORGIVE ME FOR FORGETTING SOME OF
'       THE AUTHOR's NAMES THAT I USED CODE
'       FROM!  I AM DOCUMENTING THIS ABOUT 10 MONTHS.
'       AFTER I CREATED IT.
'
'       Note: I am not some idiot who types in all caps...
'
'       Programmer:      Eric Kirse
'       Website:         http://www.kirsenet.com (I host it, so it aint always up)
'       App:             Window Tools Pro
'       Supposed To Be:  an API spy
'
'       Other Notes: I can't take all credit for this program,
'                    although I can tell you what is mine.
'
'                    Mine
'                    --------------
'                    1) All Advanced Features
'                    2) hWnd Scanner
'                    3) Kill Prompt
'                    4) Hidden List (allows you to reshow hidden windows)
'                    5) The actual creation of the procedure's for getting
'                       window information
'                    6) Most API functions (although I learned from reading,
'                       and using a little of others code)
'                    7) Design, compiliation, etc. of this program...
'
'                    If you like this program, please vote...  I am moving
'                    on to Borland Delphi 6 now.
'
'######################################################################################


Option Explicit

Dim LastXPos As Long, LastYPos As Long
Dim AutoMouseLocation As POINTAPI
Private FormOnTop As New clsWinTools

Private Sub chkUnmask_Click()
    ' found off of PSC
    UnmaskPasswords
End Sub

Private Sub cmdAdvanced_Click()
    frmAdvanced.Show
End Sub

Private Sub cmdHelp_Click()
    MsgBox "View the Help.Doc (or Help.txt) file in your root Window Tools directory." _
            & vbCrLf & vbCrLf & "Window Tools Directory: " & App.Path, vbInformation, "Window Tools Professional"
End Sub

Private Sub cmdHScan_Click()
    frmHwndScan.Show
End Sub

Private Sub cmdWeb_Click()
    Dim Success As Long, URL As String
    
    URL = "http://www.kirsenet.com"
    Success = ShellExecute(0&, vbNullString, URL, vbNullString, "C:\", 1)
End Sub

Private Sub Form_Load()
    Set FormOnTop = New clsWinTools
    
    picWinTools.Picture = LoadPicture(App.Path & "\wintoolspro.gif")
                        ' function used to load the picture
                        '   (which is in the application path)
End Sub

'##################################
'    Kill Parent Window
'##################################

Private Sub cmdKillParent_Click()
    Dim Response
    If lblParenthWnd.Caption = "N/A" Or lblParenthWnd.Caption = "[none]" Then
        MsgBox "There is no parent window to kill!", vbExclamation, "Window Tools Professional"
    Else
        If chkKill = 1 Then
            Response = MsgBox("Are you sure you want to kill this parent window?", vbYesNo, "Window Tools Professional")
            
            If Response = vbYes Then
                Call SendMessage(lblParenthWnd.Caption, WM_CLOSE, 0&, 0&)
            ElseIf Response = vbNo Then
                Exit Sub
            Else
                Exit Sub
            End If
        
        Else
            Call SendMessage(lblParenthWnd.Caption, WM_CLOSE, 0&, 0&)
        End If
    End If
        
End Sub

'##################################
'    Kill Window
'##################################

Private Sub cmdKillWin_Click()
    Dim Response
    If lblhwnd.Caption = "N/A" Or lblhwnd.Caption = "[none]" Then
        MsgBox "There is no window to kill!", vbExclamation, "Window Tools Professional"
    Else
        If chkKill = 1 Then
            Response = MsgBox("Are you sure you want to kill this window?", vbYesNo, "Window Tools Professional")
            
            If Response = vbYes Then
                Call SendMessage(lblhwnd.Caption, WM_CLOSE, 0&, 0&)
            ElseIf Response = vbNo Then
                Exit Sub
            Else
                Exit Sub
            End If
        
        Else
            Call SendMessage(lblhwnd.Caption, WM_CLOSE, 0&, 0&)
        End If
    End If
        
End Sub

'##################################
'    Show/Hide Parent Window
'##################################

Private Sub cmdShowParent_Click()
    If lblParenthWnd.Caption = "[none]" Then
        MsgBox "You have not found a window to show!", vbExclamation, "Window Tools Professional"
        Exit Sub
    Else
        Call ShowWindow(lblParenthWnd.Caption, SW_SHOW)
        RemoveListItem lblParenthWnd & " - " & lblParent.Caption
    End If
End Sub

Private Sub cmdToggleParent_Click()
    If lblParenthWnd.Caption = "[none]" Then
        MsgBox "You have not found a window to hide!", vbExclamation, "Window Tools Professional"
        Exit Sub
    Else
        Call ShowWindow(lblParenthWnd.Caption, SW_HIDE)
        frmHiddenWins.lstWins.AddItem lblParenthWnd & " - " & lblParent.Caption
    End If
End Sub

'##################################
'    Show/Hide Window
'##################################
Private Sub cmdShowWin_Click()
    If lblhwnd.Caption = "[none]" Then
        MsgBox "There is not a window to show!", vbExclamation, "Window Tools Professional"
        Exit Sub
    Else
        Call ShowWindow(lblhwnd.Caption, SW_SHOW)
        RemoveListItem lblhwnd.Caption & " - " & lblClass.Caption
    End If
End Sub

Private Sub cmdToggleWin_Click()
    If lblhwnd.Caption = "[none]" Then
        MsgBox "You have not found a window to hide!", vbExclamation, "Window Tools Professional"
        Exit Sub
    Else
        Call ShowWindow(lblhwnd.Caption, SW_HIDE)
        frmHiddenWins.lstWins.AddItem lblhwnd.Caption & " - " & lblClass.Caption
    End If
End Sub

'##################################
'   Change Window Text
'##################################
Private Sub cmdWinText_Click()
    If lblhwnd.Caption = "[none]" Then
        MsgBox "You have not found a window!", vbExclamation, "Window Tools Professional"
        Exit Sub
    Else
        Call SendMessageByString(lblhwnd.Caption, WM_SETTEXT, 0&, txtNewWinText.Text)
        If Trim(txtNewWinText.Text) = "" Then
            lblText.Caption = "[null]"
        Else
            lblText.Caption = txtNewWinText.Text
        End If
    End If
End Sub

'##################################
'   Change Parent Text
'##################################
Private Sub cmdParentText_Click()
     If lblParenthWnd.Caption = "[none]" Or lblParenthWnd.Caption = "N/A" Then
        MsgBox "You have not found a parent window!", vbExclamation, "Window Tools Professional"
        Exit Sub
    Else
        Call SendMessageByString(lblParenthWnd.Caption, WM_SETTEXT, 0&, txtNewParentText.Text)
        If Trim(txtNewParentText.Text) = "" Then
            lblParentText.Caption = "[null]"
        Else
            lblParentText.Caption = txtNewParentText.Text
        End If
    End If
End Sub

Private Sub chkHiddenWins_Click()
    If chkHiddenWins = 1 Then
        frmHiddenWins.Show
    Else
        frmHiddenWins.Hide
    End If
End Sub

'##################################
'   Auto Mode Enabled?
'##################################

Private Sub chkAuto_Click()
    If chkAuto = 1 Then
        tmrAuto.Enabled = True
        txtNewWinText.Width = 4425
        txtNewParentText.Width = 4425
        cmdGet.Visible = False
        chkUnmask.Enabled = True
    Else
        tmrAuto.Enabled = False
        txtNewWinText.Width = 3045
        txtNewParentText.Width = 3045
        cmdGet.Visible = True
        chkUnmask = False
        chkUnmask.Enabled = False
    End If
End Sub

'###################################################
'   Keep Form on Top (see class module information)
'###################################################
Private Sub chkOnTop_Click()
    If chkOnTop = 1 Then
        FormOnTop.MakeTopMost frmMain.hWnd
    Else
        FormOnTop.MakeNormal frmMain.hWnd
    End If
End Sub

'##################################
'   Person lets up Mouse button,
'   get some information...
'##################################
Public Sub cmdGet_MouseUp(Button As Integer, Shift As Integer, X As Single, y As Single)
    Call WindowSpy
End Sub

Private Sub Form_Terminate()
    Unload frmMain
    Unload frmHiddenWins
    Unload frmAdvanced
    Unload frmHwndScan
    End
End Sub

Private Sub Form_Unload(Cancel As Integer)
    Unload frmMain
    Unload frmHiddenWins
    Unload frmAdvanced
    Unload frmHwndScan
    End
End Sub

Private Sub lblToText_Click(Index As Integer)
    ' click one of these blue dots, and it copies the text to
    '  the textbox in the middle of the main form!.. useful...
    Select Case Index
        Case 0
            txtShow.Text = lblhwnd.Caption
        Case 1
            txtShow.Text = lblText.Caption
        Case 2
            txtShow.Text = lblClass.Caption
        Case 3
            txtShow.Text = lblParent.Caption
        Case 4
            txtShow.Text = lblParentText.Caption
        Case 5
            txtShow.Text = lblParenthWnd.Caption
    End Select
End Sub

Private Sub picWinTools_Click()
    Dim Success As Long, URL As String

    URL = "http://www.kirsenet.com"
    Success = ShellExecute(0&, vbNullString, URL, vbNullString, "C:\", 1)
End Sub

'##################################
'   Used for AUTO MODE
'   Checks where user's cursor is
'           FOUND ON PSC
'           ------------
'    Thanks to the author, Patrick,
'    it was in his API spy
'##################################
Private Sub tmrAuto_Timer()
    GetCursorPos AutoMouseLocation
    
    If AutoMouseLocation.X <> LastXPos Or AutoMouseLocation.y <> LastYPos Then
        Call WindowSpy
    Else
        Exit Sub
    End If
    
    LastXPos = AutoMouseLocation.X
    LastYPos = AutoMouseLocation.y
    
    If chkUnmask = 1 Then
        UnmaskPasswords
    End If
End Sub

Public Sub WindowSpy()
    Dim MouseLocation As POINTAPI
    
    Dim hWnd As Long, hwndlength As Long, WindowClass As Long, WindowParent As Long
    Dim hWndParentLength As Long, ParentClass As Long
    
    Dim FirstWindowText As String, SecondWindowText As String, StringBuffer As String
    Dim FirstParentText As String, SecondParentText As String, PStringBuffer As String
    
    GetCursorPos MouseLocation
    '**** Get Window Handle ****
    hWnd = WindowFromPoint(MouseLocation.X, MouseLocation.y)
    
    '**** Get Window Text ****
    hwndlength = GetWindowTextLength(hWnd)
    FirstWindowText = String$(hwndlength, 0)
    SecondWindowText = GetWindowText(hWnd, FirstWindowText, (hwndlength + 1))
    
    '**** Get Window Class ****
    StringBuffer = String(250, 0)
    WindowClass = GetClassName(hWnd, StringBuffer, 250)
    
    '**** Get Window Parent ****
    WindowParent = GetParent(hWnd)
    
    If WindowParent = 0 Then
        lblParent.Caption = "N/A"
        lblParentText.Caption = "N/A"
        lblParenthWnd.Caption = "N/A"
    Else
        '**** Parent hWnd ****
        lblParenthWnd.Caption = WindowParent
        '**** Parent Window Class ****
        PStringBuffer = String(250, 0)
        ParentClass = GetClassName(WindowParent, PStringBuffer, 250)
        lblParent.Caption = PStringBuffer
        
        '**** Parent Window Text ****
        hWndParentLength = GetWindowTextLength(WindowParent)
        FirstParentText = String$(hWndParentLength, 0)
        SecondParentText = GetWindowText(WindowParent, FirstParentText, (hWndParentLength + 1))
        
        If FirstParentText = "" Then
            lblParentText.Caption = "[null]"
        Else
            lblParentText.Caption = FirstParentText
        End If
    End If
    
    lblhwnd.Caption = hWnd
    
    If FirstWindowText = "" Then
        lblText.Caption = "[null]"
    Else
        lblText.Caption = FirstWindowText
    End If
        
    lblClass.Caption = StringBuffer
    
End Sub


'***************************************
'  Buncha MouseMove coding...          *
'***************************************

Private Sub txtShow_MouseMove(Button As Integer, Shift As Integer, X As Single, y As Single)
    Status.SimpleText = "Click the blue circles to send a property to this box."
End Sub

Private Sub chkAuto_MouseMove(Button As Integer, Shift As Integer, X As Single, y As Single)
    Status.SimpleText = "Simply move your mouse around to find the window you want."
End Sub

Private Sub chkHiddenWins_MouseMove(Button As Integer, Shift As Integer, X As Single, y As Single)
    Status.SimpleText = "Show the list of Windows you have hidden."
End Sub

Private Sub chkKill_MouseMove(Button As Integer, Shift As Integer, X As Single, y As Single)
    Status.SimpleText = "Have Window Tools prompt you before killing a window."
End Sub

Private Sub chkOnTop_MouseMove(Button As Integer, Shift As Integer, X As Single, y As Single)
    Status.SimpleText = "Keep Window Tools on top of all programs."
End Sub

Private Sub chkUnmask_MouseMove(Button As Integer, Shift As Integer, X As Single, y As Single)
    Status.SimpleText = "Automatically unmask any passwords."
End Sub

Private Sub cmdHScan_MouseMove(Button As Integer, Shift As Integer, X As Single, y As Single)
    Status.SimpleText = "Window Handle Scanner"
End Sub

Private Sub cmdKillParent_MouseMove(Button As Integer, Shift As Integer, X As Single, y As Single)
    Status.SimpleText = "Kill the specified Parent."
End Sub

Private Sub cmdKillWin_MouseMove(Button As Integer, Shift As Integer, X As Single, y As Single)
    Status.SimpleText = "Kill the specified window."
End Sub

Private Sub cmdParentText_MouseMove(Button As Integer, Shift As Integer, X As Single, y As Single)
    Status.SimpleText = "Change the text of a Parent Window."
End Sub

Private Sub cmdShowParent_MouseMove(Button As Integer, Shift As Integer, X As Single, y As Single)
    Status.SimpleText = "Show a Parent Window."
End Sub

Private Sub cmdShowWin_MouseMove(Button As Integer, Shift As Integer, X As Single, y As Single)
    Status.SimpleText = "Show a Window."
End Sub

Private Sub cmdToggleParent_MouseMove(Button As Integer, Shift As Integer, X As Single, y As Single)
    Status.SimpleText = "Hide a Parent Window."
End Sub

Private Sub cmdToggleWin_MouseMove(Button As Integer, Shift As Integer, X As Single, y As Single)
    Status.SimpleText = "Hide a Window."
End Sub

Private Sub cmdAdvanced_MouseMove(Button As Integer, Shift As Integer, X As Single, y As Single)
    Status.SimpleText = "Advanced Options in Window Tools"
End Sub

Private Sub cmdGet_MouseMove(Button As Integer, Shift As Integer, X As Single, y As Single)
    Status.SimpleText = "Find windows."
End Sub

Private Sub fraWindowDetails_MouseMove(Button As Integer, Shift As Integer, X As Single, y As Single)
    Status.SimpleText = "Details of the windows you find."
End Sub

Private Sub cmdWeb_MouseMove(Button As Integer, Shift As Integer, X As Single, y As Single)
    Status.SimpleText = "Visit our website (http://www.kirsenet.com)."
End Sub

Private Sub cmdWinText_MouseMove(Button As Integer, Shift As Integer, X As Single, y As Single)
    Status.SimpleText = "Change the text of a window."
End Sub

Private Sub cmdHelp_MouseMove(Button As Integer, Shift As Integer, X As Single, y As Single)
    Status.SimpleText = "Location of the nearest help to you."
End Sub

Private Sub lblToText_MouseMove(Index As Integer, Button As Integer, Shift As Integer, X As Single, y As Single)
    Status.SimpleText = "Click this blue circle to send the info to the right to the textbox for copying!"
End Sub
