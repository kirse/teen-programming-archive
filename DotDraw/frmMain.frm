VERSION 5.00
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "COMDLG32.OCX"
Begin VB.Form frmMain 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "KirseNET - Dot Draw"
   ClientHeight    =   2220
   ClientLeft      =   150
   ClientTop       =   720
   ClientWidth     =   4080
   BeginProperty Font 
      Name            =   "Tahoma"
      Size            =   8.25
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   2220
   ScaleWidth      =   4080
   StartUpPosition =   3  'Windows Default
   Begin VB.OptionButton optYellow 
      Caption         =   "Yellow"
      Height          =   315
      Left            =   60
      Style           =   1  'Graphical
      TabIndex        =   6
      Top             =   1650
      Width           =   825
   End
   Begin VB.OptionButton optBlue 
      Caption         =   "Blue"
      Height          =   315
      Left            =   60
      Style           =   1  'Graphical
      TabIndex        =   5
      Top             =   1350
      Width           =   825
   End
   Begin VB.OptionButton optGreen 
      Caption         =   "Green"
      Height          =   285
      Left            =   60
      Style           =   1  'Graphical
      TabIndex        =   3
      Top             =   1080
      Width           =   825
   End
   Begin VB.OptionButton optRed 
      Caption         =   "Red"
      Height          =   315
      Left            =   60
      Style           =   1  'Graphical
      TabIndex        =   4
      Top             =   780
      Width           =   825
   End
   Begin VB.OptionButton optBlack 
      Caption         =   "Black"
      Height          =   315
      Left            =   60
      Style           =   1  'Graphical
      TabIndex        =   2
      Top             =   480
      Width           =   825
   End
   Begin VB.OptionButton optWhite 
      Caption         =   "White"
      Height          =   315
      Left            =   60
      Style           =   1  'Graphical
      TabIndex        =   1
      Top             =   180
      Value           =   -1  'True
      Width           =   825
   End
   Begin MSComDlg.CommonDialog cdlBox 
      Left            =   7560
      Top             =   30
      _ExtentX        =   847
      _ExtentY        =   847
      _Version        =   393216
      Filter          =   "KirseNET Draw File [*.kdf] | *.kdf"
   End
   Begin VB.Shape Shape1 
      Height          =   2025
      Left            =   960
      Top             =   90
      Width           =   3015
   End
   Begin VB.Label lblDot 
      BackColor       =   &H00FFFFFF&
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00000000&
      Height          =   100
      Index           =   0
      Left            =   960
      TabIndex        =   0
      Top             =   90
      Width           =   100
   End
   Begin VB.Menu mnuFile 
      Caption         =   "&File"
      Begin VB.Menu mnuLoadFile 
         Caption         =   "&Load kDraw File"
      End
      Begin VB.Menu mnuSaveFile 
         Caption         =   "&Save kDraw File"
      End
      Begin VB.Menu mnuSep 
         Caption         =   "-"
      End
      Begin VB.Menu mnuExit 
         Caption         =   "E&xit"
      End
   End
   Begin VB.Menu mnuOptions 
      Caption         =   "&Options"
      Begin VB.Menu mnuAutoFill 
         Caption         =   "&Auto Fill"
         Shortcut        =   {F2}
      End
      Begin VB.Menu mnuSep2 
         Caption         =   "-"
      End
      Begin VB.Menu mnuClear 
         Caption         =   "&Clear Board"
         Shortcut        =   {F5}
      End
   End
End
Attribute VB_Name = "frmMain"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
' ############ Visual Basic - *Small* Draw Program ############
'
'   Written by: Eric Kirse (kirse on PSC.com)
'   Website:    http://www.kirsenet.com
'   Email:      kirsenet@hotmail.com
'
'   Basic Info: A great **!!6-color!!**, drawing program.
'               This program was written individualy (by me).
'               It's a simple little drawing program that can
'               show a novice file handling routines, managing
'               arrays, loading controls and more.
'
'               Even better, this program has its own little
'               unique file type in which it stores data for
'               the individual squares.
'
'               File Type Explanation:
'               R = Red, G = Green, B = Blue, W = White, K = Black
'               Y = Yellow
'
'               A small "chunk" of pixels from the board...
'                 -     -     -     -     -     -
'               | R | | G | | B | | W | | K | | Y |
'                 -     -     -     -     -     -
'
'               The File Would Then Look Like This:
'                 234015
'
'               Pretty Easy - Except it simply has 600 digits
'                             in the file
'##############################################################

Option Explicit
Dim picArray(0 To 599) As String
    ' the array holding each "pixels" value
Dim builtString As String
    ' our "file"

Private Sub Form_Load()
    Dim X As Integer            ' loop variable
    Dim onNewRow As Boolean     ' on a new row?
    
    frmMain.Height = 2880       ' "hides" the textbox
    frmMain.AutoRedraw = True
    
    For X = 1 To 599
        Load lblDot(X)          ' loads the little "pixels" one by one
            With lblDot(X)
                .Caption = ""   ' ...they're actually just labels
                .BackColor = vbWhite
                                ' set the color
                .Left = (lblDot(X - 1).Left + lblDot(X - 1).Width)
                                ' the next dot is positioned at the
                                '   previous dot's left + the previous
                                '   dot's height
                
                If onNewRow = True Then
                    .Top = lblDot(X - 1).Top
                End If
                                ' when to start a new row
                If (X Mod 30 = 0) Then
                    .Top = lblDot(X - 1).Top + lblDot(X - 1).Height
                    .Left = lblDot(X - 30).Left
                    onNewRow = True
                End If
                
                .Visible = True
            End With
        picArray(X) = "0"       ' right now the "pixels" are all white
    Next X
End Sub

Private Sub lblDot_MouseDown(Index As Integer, Button As Integer, Shift As Integer, X As Single, Y As Single)
    Dim i As Integer
                                ' whichever color the user has selected,
                                '  make that "pixel" that color, and update
                                '  our array storing the file data
    If optWhite.Value = True Then
        lblDot(Index).BackColor = vbWhite
        picArray(Index) = "0"
    ElseIf optBlack.Value = True Then
        lblDot(Index).BackColor = vbBlack
        picArray(Index) = "1"
    ElseIf optRed.Value = True Then
        lblDot(Index).BackColor = vbRed
        picArray(Index) = "2"
    ElseIf optGreen.Value = True Then
        lblDot(Index).BackColor = vbGreen
        picArray(Index) = "3"
    ElseIf optBlue.Value = True Then
        lblDot(Index).BackColor = vbBlue
        picArray(Index) = "4"
    ElseIf optYellow.Value = True Then
        lblDot(Index).BackColor = vbYellow
        picArray(Index) = "5"
    End If
    
    builtString = ""
    
    For i = 0 To 599
        builtString = builtString & picArray(i)
    Next i
End Sub

Private Sub lblDot_MouseMove(Index As Integer, Button As Integer, Shift As Integer, X As Single, Y As Single)
    Dim i As Integer
                                ' see the _MouseDown event...
    
    If mnuAutoFill.Checked = True Then
        If optWhite.Value = True Then
            lblDot(Index).BackColor = vbWhite
            picArray(Index) = "0"
        ElseIf optBlack.Value = True Then
            lblDot(Index).BackColor = vbBlack
            picArray(Index) = "1"
        ElseIf optRed.Value = True Then
            lblDot(Index).BackColor = vbRed
            picArray(Index) = "2"
        ElseIf optGreen.Value = True Then
            lblDot(Index).BackColor = vbGreen
            picArray(Index) = "3"
        ElseIf optBlue.Value = True Then
            lblDot(Index).BackColor = vbBlue
            picArray(Index) = "4"
        ElseIf optYellow.Value = True Then
            lblDot(Index).BackColor = vbYellow
            picArray(Index) = "5"
        End If
    End If
    
    builtString = ""
    
    For i = 0 To 599        ' rearrange our file
        builtString = builtString & picArray(i)
    Next i
End Sub

Private Sub mnuAutoFill_Click()
    mnuAutoFill.Checked = Not (mnuAutoFill.Checked)
End Sub

Private Sub Form_Terminate()
    Unload Me
    End
End Sub

Private Sub Form_Unload(Cancel As Integer)
    Unload Me
    End
End Sub

Private Sub mnuClear_Click()
    ' reset all the "pixels" to white
    Dim X As Integer
    
    For X = 0 To 599
        lblDot(X).BackColor = vbWhite
    Next X
    
    builtString = ""
End Sub

Private Sub mnuExit_Click()
    Form_Terminate
End Sub

Private Sub mnuLoadFile_Click()
    Dim X As Integer
    Dim theFile As String
    Dim theNum As String
    
    cdlBox.ShowOpen
    
    If (cdlBox.FileName <> "") Then
        Open cdlBox.FileName For Input As #1
            Input #1, theFile
            builtString = theFile
        Close #1
    Else
        Exit Sub
    End If
    
    ' get the data for each pixel one by one from the file
    '    and give the pixel a color according to it
    For X = 0 To 599
        theNum = Mid(theFile, (X + 1), 1)
        picArray(X) = theNum
        
        Select Case theNum
            Case 0
                lblDot(X).BackColor = vbWhite
            Case 1
                lblDot(X).BackColor = vbBlack
            Case 2
                lblDot(X).BackColor = vbRed
            Case 3
                lblDot(X).BackColor = vbGreen
            Case 4
                lblDot(X).BackColor = vbBlue
            Case 5
                lblDot(X).BackColor = vbYellow
        End Select
    Next X
End Sub

Private Sub mnuSaveFile_Click()
    cdlBox.ShowSave
    
    ' obvious...
    If (cdlBox.FileName <> "") Then
        Open cdlBox.FileName For Output As #1
            Print #1, builtString
        Close #1
    Else
        Exit Sub
    End If
End Sub
