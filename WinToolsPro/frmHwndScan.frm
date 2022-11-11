VERSION 5.00
Begin VB.Form frmHwndScan 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Window Tools Professional - Handle Scanner"
   ClientHeight    =   4815
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   5130
   BeginProperty Font 
      Name            =   "Tahoma"
      Size            =   8.25
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   Icon            =   "frmHwndScan.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   4815
   ScaleWidth      =   5130
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton cmdScan 
      Caption         =   "Scan"
      Height          =   315
      Left            =   3975
      TabIndex        =   8
      Top             =   4440
      Width           =   1095
   End
   Begin VB.CommandButton cmdClear 
      Caption         =   "Clear"
      Height          =   315
      Left            =   2820
      TabIndex        =   7
      Top             =   4440
      Width           =   1155
   End
   Begin VB.Frame Frame1 
      Caption         =   "Window Handle Scanner"
      Height          =   1185
      Left            =   90
      TabIndex        =   1
      Top             =   3180
      Width           =   4965
      Begin VB.TextBox txtTo 
         Appearance      =   0  'Flat
         Height          =   285
         Left            =   2970
         TabIndex        =   5
         Top             =   750
         Width           =   885
      End
      Begin VB.TextBox txtFrom 
         Appearance      =   0  'Flat
         Height          =   285
         Left            =   1410
         TabIndex        =   3
         Top             =   750
         Width           =   885
      End
      Begin VB.Label Label3 
         Caption         =   "Enter a range of window handles and press 'Scan'.  Double-click on an item to show the properties in the main window."
         Height          =   405
         Left            =   180
         TabIndex        =   6
         Top             =   240
         Width           =   4605
      End
      Begin VB.Label Label2 
         AutoSize        =   -1  'True
         Caption         =   "To:"
         Height          =   195
         Left            =   2670
         TabIndex        =   4
         Top             =   810
         Width           =   240
      End
      Begin VB.Label Label1 
         AutoSize        =   -1  'True
         Caption         =   "From:"
         Height          =   195
         Left            =   900
         TabIndex        =   2
         Top             =   810
         Width           =   480
      End
   End
   Begin VB.ListBox lstWins 
      Height          =   2985
      Left            =   90
      TabIndex        =   0
      Top             =   90
      Width           =   4965
   End
End
Attribute VB_Name = "frmHwndScan"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub cmdClear_Click()
    ' obvious...
    lstWins.Clear
    txtFrom.Text = ""
    txtTo.Text = ""
End Sub

Private Sub cmdScan_Click()
    Dim X As Double
    Dim hwndlength As Long, WindowClass As Long
    Dim FirstWindowText As String, SecondWindowText As String, StringBuffer As String
    
    ' make sure the fool entered the right numbers...
    If Val(txtFrom.Text) >= Val(txtTo.Text) Then
        MsgBox "Please enter correct values for the 'From' and 'To' boxes.", vbExclamation, "Window Tools Professional"
        Exit Sub
    End If
    
    ' loop that checks the window props, puts them in listbox
    For X = Val(txtFrom.Text) To Val(txtTo.Text)
        hwndlength = GetWindowTextLength(X)
        FirstWindowText = String$(hwndlength, 0)
        SecondWindowText = GetWindowText(X, FirstWindowText, (hwndlength + 1))

        StringBuffer = String(250, 0)
        WindowClass = GetClassName(X, StringBuffer, 250)
        
        If (FirstWindowText <> "") Then
            lstWins.AddItem X & " - " & StringBuffer & " - " & FirstWindowText
        End If
    Next X
End Sub

Private Sub lstWins_DblClick()
    Dim DataSplit() As String
    Dim ListData As String
    
    ListData = lstWins.Text
    
    ' splits up the data to be put on main screen
    DataSplit = Split(ListData, " ")
    
    ' user clicked nothing
    If DataSplit(0) = "" Then
        Exit Sub
    End If
    
    ' update the main window with the new "specs" on a window
    WindowSpyUpdate (DataSplit(0))
End Sub
