VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Begin VB.Form frmAdvanced 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Window Tools Professional - Advanced"
   ClientHeight    =   5595
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   6390
   BeginProperty Font 
      Name            =   "Tahoma"
      Size            =   8.25
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   Icon            =   "frmAdvanced.frx":0000
   LinkTopic       =   "Form1"
   LockControls    =   -1  'True
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   5595
   ScaleWidth      =   6390
   StartUpPosition =   3  'Windows Default
   Begin VB.Frame Frame2 
      Caption         =   "Window Scanner"
      Height          =   2775
      Left            =   120
      TabIndex        =   8
      Top             =   2700
      Width           =   6135
      Begin VB.CommandButton cmdClear 
         Caption         =   "Clear"
         Height          =   345
         Left            =   3450
         TabIndex        =   21
         Top             =   1890
         Width           =   1245
      End
      Begin VB.CommandButton cmdScan 
         Caption         =   "Begin Scan"
         Height          =   345
         Left            =   4680
         TabIndex        =   20
         Top             =   1890
         Width           =   1305
      End
      Begin MSComctlLib.ProgressBar prog 
         Height          =   285
         Left            =   780
         TabIndex        =   19
         Top             =   2340
         Width           =   5205
         _ExtentX        =   9181
         _ExtentY        =   503
         _Version        =   393216
         BorderStyle     =   1
         Appearance      =   0
      End
      Begin VB.TextBox txtT 
         Appearance      =   0  'Flat
         Height          =   285
         Left            =   2520
         TabIndex        =   18
         Top             =   1950
         Width           =   855
      End
      Begin VB.TextBox txtString 
         Appearance      =   0  'Flat
         Height          =   285
         Left            =   1950
         TabIndex        =   16
         Top             =   1590
         Width           =   1425
      End
      Begin VB.OptionButton optText 
         Caption         =   "Text"
         Height          =   225
         Left            =   5310
         TabIndex        =   13
         Top             =   300
         Width           =   735
      End
      Begin VB.OptionButton optClass 
         Caption         =   "Class"
         Height          =   225
         Left            =   4560
         TabIndex        =   12
         Top             =   300
         Value           =   -1  'True
         Width           =   705
      End
      Begin VB.ListBox lstWindows 
         Appearance      =   0  'Flat
         Height          =   1200
         Left            =   3450
         TabIndex        =   11
         Top             =   600
         Width           =   2535
      End
      Begin VB.PictureBox Picture2 
         AutoSize        =   -1  'True
         BorderStyle     =   0  'None
         Height          =   480
         Left            =   150
         Picture         =   "frmAdvanced.frx":0442
         ScaleHeight     =   480
         ScaleWidth      =   480
         TabIndex        =   10
         Top             =   300
         Width           =   480
      End
      Begin VB.Label Label5 
         Caption         =   "Stop Window Handle:"
         Height          =   195
         Left            =   780
         TabIndex        =   17
         Top             =   1980
         Width           =   1695
      End
      Begin VB.Label Label4 
         AutoSize        =   -1  'True
         Caption         =   "Search String:"
         Height          =   195
         Left            =   780
         TabIndex        =   15
         Top             =   1620
         Width           =   1020
      End
      Begin VB.Label Label3 
         Caption         =   "Search By:"
         Height          =   225
         Left            =   3690
         TabIndex        =   14
         Top             =   300
         Width           =   795
      End
      Begin VB.Label Label2 
         Caption         =   $"frmAdvanced.frx":0884
         Height          =   1215
         Left            =   780
         TabIndex        =   9
         Top             =   300
         Width           =   2535
      End
   End
   Begin VB.Frame Frame1 
      Caption         =   "Code Generator"
      Height          =   2505
      Left            =   120
      TabIndex        =   0
      Top             =   90
      Width           =   6135
      Begin VB.CommandButton cmdGenerate 
         Caption         =   "Generate"
         Height          =   345
         Left            =   360
         TabIndex        =   6
         Top             =   1950
         Width           =   1065
      End
      Begin VB.TextBox txtCode 
         Appearance      =   0  'Flat
         Height          =   1335
         Left            =   1560
         MultiLine       =   -1  'True
         ScrollBars      =   2  'Vertical
         TabIndex        =   5
         Top             =   960
         Width           =   4365
      End
      Begin VB.OptionButton optC 
         Caption         =   "C++"
         Height          =   285
         Left            =   360
         TabIndex        =   4
         Top             =   1410
         Width           =   1035
      End
      Begin VB.OptionButton optVB 
         Caption         =   "Visual Basic"
         Height          =   315
         Left            =   360
         TabIndex        =   3
         Top             =   1080
         Value           =   -1  'True
         Width           =   1155
      End
      Begin VB.PictureBox Picture1 
         AutoSize        =   -1  'True
         BorderStyle     =   0  'None
         Height          =   480
         Left            =   120
         Picture         =   "frmAdvanced.frx":094A
         ScaleHeight     =   480
         ScaleWidth      =   480
         TabIndex        =   2
         Top             =   300
         Width           =   480
      End
      Begin VB.Label Label1 
         Caption         =   $"frmAdvanced.frx":0D8C
         Height          =   615
         Left            =   690
         TabIndex        =   1
         Top             =   270
         Width           =   5355
      End
   End
   Begin VB.Label Q 
      AutoSize        =   -1  'True
      Caption         =   """"
      Height          =   195
      Left            =   6360
      TabIndex        =   7
      Top             =   30
      Visible         =   0   'False
      Width           =   60
   End
End
Attribute VB_Name = "frmAdvanced"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

'##############################################################
' AH YES, features I find useful myself sometimes... thats why
' I put them here!
'##############################################################

Private Sub cmdCopy_Click()
    ' obvious...
    Clipboard.SetText txtCode.Text
End Sub

Private Sub cmdGenerate_Click()
' ok, this is a bunch of code designed to create code for
'  either C++ or VB that will find the window that is specified by the main
'  form screen

If frmMain.lblhwnd.Caption = "N/A" Or frmMain.lblhwnd.Caption = "[none]" Then
    MsgBox "You must find a window before generating code!", vbExclamation, "Window Tools Professional"
Else
    If optVB = True Then
    
        If frmMain.lblParenthWnd.Caption = "N/A" Then
        
                If frmMain.lblText.Caption = "[null]" Then
                    txtCode.Text = "Dim WindowToFind As Long    'Window Handle" & vbCrLf & _
                                "WindowToFind& = FindWindow(" & Q.Caption & frmMain.lblClass.Caption & Q.Caption _
                                & "," & "vbNullString" & ")" & vbCrLf & "' Look for the Window"
                Else
                    txtCode.Text = "Dim WindowToFind As Long    'Window Handle" & vbCrLf & _
                                "WindowToFind& = FindWindow(" & Q.Caption & frmMain.lblClass.Caption & Q.Caption _
                                & "," & Q.Caption & frmMain.lblText.Caption & Q.Caption & ")" & vbCrLf & "' Look for the Window"
                End If
            
        ElseIf frmMain.lblParenthWnd.Caption <> "N/A" Then
        
                If frmMain.lblText.Caption = "[null]" Then
                    
                        If frmMain.lblParentText.Caption = "[null]" Then
                            txtCode.Text = "Dim ChildWin As Long" & vbCrLf & "Dim ParentWin As Long" & vbCrLf & _
                                            "ParentWin& = FindWindow(" & Q.Caption & frmMain.lblParent.Caption & _
                                            Q.Caption & "," & "vbNullString" & ")" & vbCrLf & _
                                            "ChildWin& = FindWindowEx(ParentWin&, 0&," & Q.Caption & frmMain.lblClass.Caption & _
                                            Q.Caption & "," & "vbNullString" & ")"
                        Else
                            txtCode.Text = "Dim ChildWin As Long" & vbCrLf & "Dim ParentWin As Long" & vbCrLf & _
                                            "ParentWin& = FindWindow(" & Q.Caption & frmMain.lblParent.Caption & _
                                            Q.Caption & "," & Q.Caption & frmMain.lblParentText.Caption & Q.Caption & ")" & vbCrLf & _
                                            "ChildWin& = FindWindowEx(ParentWin&, 0&," & Q.Caption & frmMain.lblClass.Caption & _
                                            Q.Caption & "," & "vbNullString" & ")"
                        End If
                    
                Else
                    
                        If frmMain.lblParentText.Caption = "[null]" Then
                            txtCode.Text = "Dim ChildWin As Long" & vbCrLf & "Dim ParentWin As Long" & vbCrLf & _
                                            "ParentWin& = FindWindow(" & Q.Caption & frmMain.lblParent.Caption & _
                                            Q.Caption & "," & "vbNullString" & ")" & vbCrLf & _
                                            "ChildWin& = FindWindowEx(ParentWin&, 0&," & Q.Caption & frmMain.lblClass.Caption & _
                                            Q.Caption & "," & Q.Caption & frmMain.lblText.Caption & Q.Caption & ")"
                        Else
                            txtCode.Text = "Dim ChildWin As Long" & vbCrLf & "Dim ParentWin As Long" & vbCrLf & _
                                            "ParentWin& = FindWindow(" & Q.Caption & frmMain.lblParent.Caption & _
                                            Q.Caption & "," & Q.Caption & frmMain.lblParentText.Caption & Q.Caption & ")" & vbCrLf & _
                                            "ChildWin& = FindWindowEx(ParentWin&, 0&," & Q.Caption & frmMain.lblClass.Caption & _
                                            Q.Caption & "," & Q.Caption & frmMain.lblText.Caption & Q.Caption & ")"
                        End If
                    
                End If
            
        End If
        
        Else
            If frmMain.lblParenthWnd.Caption = "N/A" Then
        
                        If frmMain.lblText.Caption = "[null]" Then
                            txtCode.Text = "HWND Window;" & vbCrLf & "Window = FindWindow(" & Q.Caption & frmMain.lblClass.Caption & _
                                            Q.Caption & "," & "NULL" & ");"
                        Else
                            txtCode.Text = "HWND Window;" & vbCrLf & "Window = FindWindow(" & Q.Caption & frmMain.lblClass.Caption & _
                                            Q.Caption & "," & Q.Caption & frmMain.lblText.Caption & Q.Caption & ");"
                        End If
            
            ElseIf frmMain.lblParenthWnd.Caption <> "N/A" Then
        
                If frmMain.lblText.Caption = "[null]" Then
                        
                        If frmMain.lblParentText.Caption = "[null]" Then
                            txtCode.Text = "HWND Child, Parent;" & vbCrLf & "Parent = FindWindow(" & Q.Caption & frmMain.lblParent.Caption & _
                                            Q.Caption & "," & "NULL" & ");" & vbCrLf & _
                                            "Child = FindWindowEx(Parent, 0," & Q.Caption & frmMain.lblClass.Caption & Q.Caption & "," & "NULL" & ");"
                                            
                        Else
                            txtCode.Text = "HWND Child, Parent;" & vbCrLf & "Parent = FindWindow(" & Q.Caption & frmMain.lblParent.Caption & _
                                            Q.Caption & "," & Q.Caption & frmMain.lblParentText.Caption & Q.Caption & ");" & vbCrLf & _
                                            "Child = FindWindowEx(Parent, 0," & Q.Caption & frmMain.lblClass.Caption & Q.Caption & "," & "NULL" & ");"
                        End If
                    
                Else
                    
                        If frmMain.lblParentText.Caption = "[null]" Then
                            txtCode.Text = "HWND Child, Parent;" & vbCrLf & "Parent = FindWindow(" & Q.Caption & frmMain.lblParent.Caption & _
                                            Q.Caption & "," & "NULL" & ");" & vbCrLf & _
                                            "Child = FindWindowEx(Parent, 0," & Q.Caption & frmMain.lblClass.Caption & Q.Caption & "," & Q.Caption & frmMain.lblText.Caption & Q.Caption & ");"
                        Else
                           txtCode.Text = "HWND Child, Parent;" & vbCrLf & "Parent = FindWindow(" & Q.Caption & frmMain.lblParent.Caption & _
                                            Q.Caption & "," & Q.Caption & frmMain.lblParentText.Caption & Q.Caption & ");" & vbCrLf & _
                                            "Child = FindWindowEx(Parent, 0," & Q.Caption & frmMain.lblClass.Caption & Q.Caption & "," & Q.Caption & frmMain.lblText.Caption & Q.Caption & ");"
                        End If
                    
                End If
            End If
    End If
End If
End Sub

Private Sub cmdScan_Click()
    ' another useful feature! enables you to scan for windows that meet
    '   a certain specification
    
    Dim X As Double
    
    If cmdScan.Caption = "Begin Scan" Then
        
        If IsNumeric(txtT.Text) = False Or txtT.Text = "" Then
            MsgBox "You must enter a correct Window Handle number to stop at!", vbExclamation, "Window Tools Professional"
            Exit Sub
        End If
        
        If txtString.Text = "" Then
            MsgBox "Warning: Scanning for Null String windows may result in vague search results!", vbCritical, "Window Tools Professional"
        End If
        
        prog.Max = txtT.Text
        cmdScan.Caption = "End Scan"
        cmdClear.Enabled = False
        
        For X = 0 To Val(txtT.Text)
                If optClass = True Then
                    Dim StringBuffer As String
                    Dim WindowClass As Long
                    Dim Temp As String
                    
                    StringBuffer = String(250, 0)
                    WindowClass = GetClassName(X, StringBuffer, 250)
                    Temp = Mid(StringBuffer, 1, Len(txtString.Text))
                    
                    If Temp = txtString.Text Then
                        lstWindows.AddItem X
                    End If
                    
                    If X = txtT.Text Then
                        X = 0
                        prog.Value = prog.Min
                        cmdScan.Caption = "Begin Scan"
                        cmdClear.Enabled = True
                        Exit Sub
                    End If
                    
                    X = X + 1
                    prog.Value = X
                Else
                    Dim hwndlength As Long
                    Dim FirstWindowText As String
                    Dim SecondWindowText As String
                    
                    hwndlength = GetWindowTextLength(X)
                    FirstWindowText = String$(hwndlength, 0)
                    SecondWindowText = GetWindowText(X, FirstWindowText, (hwndlength + 1))
                    
                    If FirstWindowText = txtString.Text Then
                        lstWindows.AddItem X
                    End If
                    
                    If X = txtT.Text Then
                        X = 0
                        prog.Value = prog.Min
                        cmdScan.Caption = "Begin Scan"
                        cmdClear.Enabled = True
                        Exit Sub
                    End If
                    
                    X = X + 1
                    prog.Value = X
                End If
        Next X
    Else
        prog.Value = prog.Min
        cmdScan.Caption = "Begin Scan"
        cmdClear.Enabled = True
    End If
End Sub

Private Sub cmdClear_Click()
    lstWindows.Clear
    txtString.Text = ""
    txtT.Text = ""
End Sub

Private Sub lstWindows_DblClick()
    If lstWindows.Text = "" Then
        Exit Sub
    End If
    
    WindowSpyUpdate (lstWindows.Text)
End Sub

' this was the old one to scan for handles... a loop is MUUUUUCCCHHH faster...
'Private Sub tmrScan_Timer()
'    Static X As Double
'
'    If optClass = True Then
'        Dim StringBuffer As String
'        Dim WindowClass As Long
'        Dim Temp As String
'
'        StringBuffer = String(250, 0)
'        WindowClass = GetClassName(X, StringBuffer, 250)
'        Temp = Mid(StringBuffer, 1, Len(txtString.Text))
'
'        If Temp = txtString.Text Then
'            lstWindows.AddItem X
'        End If
'
'        If X = txtT.Text Then
'            tmrScan.Enabled = False
'            X = 0
'            prog.Value = prog.Min
'            cmdScan.Caption = "Begin Scan"
'            cmdClear.Enabled = True
'            Exit Sub
'        End If
'
'        X = X + 1
'        prog.Value = X
'    Else
'        Dim hwndlength As Long
'        Dim FirstWindowText As String
'        Dim SecondWindowText As String
'
'        hwndlength = GetWindowTextLength(X)
'        FirstWindowText = String$(hwndlength, 0)
'        SecondWindowText = GetWindowText(X, FirstWindowText, (hwndlength + 1))
'
'        If FirstWindowText = txtString.Text Then
'            lstWindows.AddItem X
'        End If
'
'        If X = txtT.Text Then
'            tmrScan.Enabled = False
'            X = 0
'            prog.Value = prog.Min
'            cmdScan.Caption = "Begin Scan"
'            cmdClear.Enabled = True
'            Exit Sub
'        End If
'
'        X = X + 1
'        prog.Value = X
'    End If
'End Sub

