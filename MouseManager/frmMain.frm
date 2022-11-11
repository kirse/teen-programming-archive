VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Begin VB.Form frmMain 
   Caption         =   "Mouse Manager"
   ClientHeight    =   4170
   ClientLeft      =   165
   ClientTop       =   450
   ClientWidth     =   5205
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
   ScaleHeight     =   4170
   ScaleWidth      =   5205
   StartUpPosition =   3  'Windows Default
   Begin VB.Timer tmrPause 
      Enabled         =   0   'False
      Interval        =   1000
      Left            =   4710
      Top             =   1680
   End
   Begin VB.CheckBox chkInfinite 
      Caption         =   "Run actions Infinitely"
      Height          =   225
      Left            =   3210
      TabIndex        =   21
      Top             =   3390
      Width           =   1815
   End
   Begin VB.Timer tmrExecuteActions 
      Enabled         =   0   'False
      Interval        =   1000
      Left            =   4710
      Top             =   2130
   End
   Begin VB.CommandButton cmdGo 
      Caption         =   "Go!"
      Height          =   345
      Left            =   2220
      TabIndex        =   20
      Top             =   3420
      Width           =   645
   End
   Begin VB.Frame Frame2 
      Caption         =   "Actions Left"
      Height          =   645
      Left            =   3420
      TabIndex        =   17
      Top             =   120
      Width           =   1665
      Begin VB.Label lblActionsLeft 
         AutoSize        =   -1  'True
         Caption         =   "100"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   14.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   345
         Left            =   660
         TabIndex        =   18
         Top             =   210
         Width           =   450
      End
   End
   Begin VB.CheckBox chkShowPos 
      Caption         =   "Show Mouse Pos."
      Height          =   225
      Left            =   3210
      TabIndex        =   16
      Top             =   3090
      Width           =   1605
   End
   Begin VB.TextBox txtInterval 
      Height          =   285
      Left            =   2130
      TabIndex        =   10
      Text            =   "1000"
      Top             =   1530
      Width           =   585
   End
   Begin VB.TextBox txtYPos 
      Alignment       =   2  'Center
      Height          =   255
      Left            =   2190
      TabIndex        =   8
      Text            =   "Y"
      Top             =   1140
      Width           =   495
   End
   Begin VB.CommandButton cmdAdd 
      Caption         =   "Add"
      Height          =   345
      Left            =   1230
      TabIndex        =   6
      Top             =   3420
      Width           =   1005
   End
   Begin VB.CommandButton cmdClear 
      Caption         =   "Clear"
      Height          =   345
      Left            =   210
      TabIndex        =   5
      Top             =   3420
      Width           =   1035
   End
   Begin VB.Timer tmrCurPos 
      Enabled         =   0   'False
      Interval        =   250
      Left            =   4710
      Top             =   2580
   End
   Begin VB.ListBox lstFunctions 
      Height          =   2010
      Left            =   3060
      TabIndex        =   4
      Top             =   900
      Width           =   2025
   End
   Begin VB.Frame Frame1 
      Caption         =   "Options"
      Height          =   2475
      Left            =   150
      TabIndex        =   3
      Top             =   840
      Width           =   2745
      Begin VB.TextBox txtTextToSend 
         BackColor       =   &H00C0C0C0&
         Enabled         =   0   'False
         Height          =   315
         Left            =   720
         TabIndex        =   15
         Top             =   1350
         Width           =   1845
      End
      Begin VB.CheckBox chkSendText 
         Caption         =   "Send Text:"
         Height          =   285
         Left            =   270
         TabIndex        =   14
         Top             =   1080
         Width           =   1185
      End
      Begin VB.TextBox txtTimes 
         BackColor       =   &H00C0C0C0&
         Enabled         =   0   'False
         Height          =   285
         Left            =   720
         TabIndex        =   12
         Text            =   "1"
         Top             =   2010
         Width           =   555
      End
      Begin VB.CheckBox chkRepeat 
         Caption         =   "Repeat action:"
         Height          =   225
         Left            =   270
         TabIndex        =   11
         Top             =   1740
         Width           =   1365
      End
      Begin VB.TextBox txtXPos 
         Alignment       =   2  'Center
         Height          =   255
         Left            =   1440
         TabIndex        =   7
         Text            =   "X"
         Top             =   300
         Width           =   495
      End
      Begin VB.Label Label2 
         Caption         =   "X/Y Position:"
         Height          =   255
         Left            =   300
         TabIndex        =   19
         Top             =   330
         Width           =   975
      End
      Begin VB.Label Label4 
         Caption         =   "times."
         Height          =   195
         Left            =   1350
         TabIndex        =   13
         Top             =   2070
         Width           =   435
      End
      Begin VB.Label Label3 
         Caption         =   "Wait after action (ms):"
         Height          =   195
         Left            =   270
         TabIndex        =   9
         Top             =   750
         Width           =   1635
      End
   End
   Begin VB.ComboBox cboFunctions 
      Height          =   315
      ItemData        =   "frmMain.frx":08CA
      Left            =   330
      List            =   "frmMain.frx":08CC
      Style           =   2  'Dropdown List
      TabIndex        =   2
      Top             =   390
      Width           =   2535
   End
   Begin MSComctlLib.StatusBar status 
      Align           =   2  'Align Bottom
      Height          =   255
      Left            =   0
      TabIndex        =   0
      Top             =   3915
      Width           =   5205
      _ExtentX        =   9181
      _ExtentY        =   450
      Style           =   1
      _Version        =   393216
      BeginProperty Panels {8E3867A5-8586-11D1-B16A-00C0F0283628} 
         NumPanels       =   1
         BeginProperty Panel1 {8E3867AB-8586-11D1-B16A-00C0F0283628} 
         EndProperty
      EndProperty
   End
   Begin VB.Label Label1 
      Caption         =   "Mouse Function:"
      Height          =   225
      Left            =   180
      TabIndex        =   1
      Top             =   120
      Width           =   1245
   End
End
Attribute VB_Name = "frmMain"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim num As Integer
Dim comsRun As Integer
Dim repeatCount As Integer
Dim MouseAct(1 To 100) As MouseAction

Private Sub chkSendText_Click()
    txtTextToSend.Enabled = Not (txtTextToSend.Enabled)
    
    If txtTextToSend.BackColor = vbWhite Then
        txtTextToSend.BackColor = &HC0C0C0
    Else
        txtTextToSend.BackColor = vbWhite
    End If
End Sub

Private Sub chkRepeat_Click()
    txtTimes.Enabled = Not (txtTimes.Enabled)
    
    If txtTimes.BackColor = vbWhite Then
        txtTimes.BackColor = &HC0C0C0
    Else
        txtTimes.BackColor = vbWhite
    End If
End Sub

Private Sub chkShowPos_Click()
    If chkShowPos Then
        tmrCurPos.Enabled = True
    Else
        tmrCurPos.Enabled = False
        status.SimpleText = ""
    End If
End Sub

Private Sub cmdAdd_Click()
    If (num > 100) Then
        MsgBox "You cannot add any more functions.", vbInformation, "Error"
        cmdAdd.Enabled = False
        Exit Sub
    End If
    
    If (cboFunctions.ListIndex = -1) Then
        MsgBox "You have not chosen an action!", vbInformation, "Error"
        Exit Sub
    End If
    
    If chkRepeat And (IsNumeric(txtTimes) = False) Then
        MsgBox "Please make sure you have entered correct values.", vbInformation, "Error"
        Exit Sub
    End If
    
    If (IsNumeric(txtXPos) = False) Or (IsNumeric(txtYPos) = False) Or (IsNumeric(txtInterval) = False) Then
        MsgBox "Please make sure you have entered correct values.", vbInformation, "Error"
        Exit Sub
    End If
    
    If (txtInterval > 65000) Or (txtInterval <= 0) Then
        MsgBox "Please enter a wait interval greater than 0 and less than 6500 milliseconds.", vbInformation, "Error"
        Exit Sub
    End If
    
    If (txtXPos > Screen.Width) Or (txtXPos < 0) Or (txtYPos > Screen.Height) Or (txtYPos < 0) Then
        MsgBox "Warning: The mouse may go off the screen in this action.", vbInformation, "Warning"
    End If
    
    If chkRepeat Then
        MouseAct(num).repeatAction = True
        MouseAct(num).repeatAmt = Val(txtTimes)
    End If
    
    If chkSendText Then
        MouseAct(num).sendText = True
        MouseAct(num).textToSend = txtTextToSend
    End If
    
    MouseAct(num).toXPos = Val(txtXPos)
    MouseAct(num).toYPos = Val(txtYPos)
    MouseAct(num).waitTime = Val(txtInterval)
    MouseAct(num).functionNum = cboFunctions.ListIndex
    
    lblActionsLeft.Caption = Val(lblActionsLeft.Caption) - 1
    lstFunctions.AddItem cboFunctions.Text
    num = num + 1
End Sub

Private Sub cmdClear_Click()
    Dim x As Integer
    lstFunctions.Clear
    lblActionsLeft.Caption = "100"
    txtInterval = "1000"
    txtXPos = "X"
    txtYPos = "Y"
    num = 1
    comsRun = 1
    
    For x = 1 To 100
        MouseAct(num).repeatAction = False
        MouseAct(num).repeatAmt = 0
        MouseAct(num).sendText = False
        MouseAct(num).textToSend = ""
        MouseAct(num).repeatAmt = 0
        MouseAct(num).toXPos = 0
        MouseAct(num).toYPos = 0
        MouseAct(num).waitTime = 0
    Next x
End Sub

Private Sub cmdGo_Click()
    If comsRun = 0 Then
        comsRun = 1
    End If
    
    If cmdGo.Caption = "Stop" Then
        tmrExecuteActions.Enabled = False
        cmdGo.Caption = "Go"
    Else
        cmdGo.Caption = "Stop"
        tmrExecuteActions.Enabled = True
        tmrCurPos.Enabled = False
    End If
End Sub

Private Sub Form_Load()
    MsgBox "If you want to send text, you must first put in a function that sets " & _
            "focus to the textbox, then create a second action that sends the text.", vbInformation, "Important Note!"
            
    num = 1
    cboFunctions.AddItem "[Left] - Double-Click"
    cboFunctions.AddItem "[Left] - Single-Click"
    cboFunctions.AddItem "[Left] - Button Down"
    cboFunctions.AddItem "[Left] - Button Up"
    cboFunctions.AddItem "[Right] - Double-Click"
    cboFunctions.AddItem "[Right] - Single-Click"
    cboFunctions.AddItem "[Right] - Button Down"
    cboFunctions.AddItem "[Right] - Button Up"
End Sub

Private Sub tmrCurPos_Timer()
    If chkShowPos Then
        status.SimpleText = "Current Mouse Position: [X]-" & GetX & " [Y]-" & GetY
    Else
        status.SimpleText = ""
        Exit Sub
    End If
End Sub

Private Sub tmrExecuteActions_Timer()
    If (comsRun > (num - 1)) Then
        If (chkInfinite.Value = vbChecked) Then
            tmrExecuteActions.Interval = 5000
            comsRun = 1
            repeatCount = 0
            GoTo KeepGoing 'horrible, I know...
        End If

        tmrExecuteActions.Enabled = False
        tmrExecuteActions.Interval = 1000
        status.SimpleText = "Complete!"
        cmdGo.Caption = "Go"
        comsRun = 1
        Exit Sub
    End If
KeepGoing:
    status.SimpleText = "Executing command: " & comsRun
    
    If (MouseAct(comsRun).repeatAction = True) Then
        If (repeatCount >= MouseAct(comsRun).repeatAmt) Then
            comsRun = comsRun + 1
            repeatCount = 0
                SetMousePos (MouseAct(comsRun).toXPos), (MouseAct(comsRun).toYPos)
            ExecuteMouseAction (MouseAct(comsRun).functionNum)
    
            If (MouseAct(comsRun).sendText = True) Then
                SendKeys MouseAct(comsRun).textToSend, True
                'SendKeys MouseAct(comsRun).textToSend, False
            End If
        Else
            SetMousePos (MouseAct(comsRun).toXPos), (MouseAct(comsRun).toYPos)
            ExecuteMouseAction (MouseAct(comsRun).functionNum)
    
            If (MouseAct(comsRun).sendText = True) Then
                SendKeys MouseAct(comsRun).textToSend, True
                'SendKeys MouseAct(comsRun).textToSend, False
            End If
    
            repeatCount = repeatCount + 1
        End If
    Else
        SetMousePos (MouseAct(comsRun).toXPos), (MouseAct(comsRun).toYPos)
        ExecuteMouseAction (MouseAct(comsRun).functionNum)
        
        If (MouseAct(comsRun).sendText = True) Then
            SendKeys MouseAct(comsRun).textToSend, True
            'SendKeys MouseAct(comsRun).textToSend, False
        End If
        
        tmrExecuteActions.Interval = CInt(MouseAct(comsRun).waitTime)
        
        comsRun = comsRun + 1
    End If
End Sub

Private Sub txtXPos_GotFocus()
    If (txtXPos = "X") Then
        txtXPos = ""
    End If
End Sub

Private Sub txtYPos_GotFocus()
    If (txtYPos = "Y") Then
        txtYPos = ""
    End If
End Sub
