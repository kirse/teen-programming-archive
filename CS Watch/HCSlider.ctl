VERSION 5.00
Begin VB.UserControl HCSSlider 
   ClientHeight    =   405
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   2025
   ScaleHeight     =   405
   ScaleWidth      =   2025
   ToolboxBitmap   =   "HCSlider.ctx":0000
   Begin VB.PictureBox Slider 
      Appearance      =   0  'Flat
      BorderStyle     =   0  'None
      ForeColor       =   &H80000008&
      Height          =   260
      Left            =   0
      ScaleHeight     =   255
      ScaleMode       =   0  'User
      ScaleWidth      =   500
      TabIndex        =   0
      Top             =   0
      Width           =   500
      Begin VB.Label lblPercent 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "    0"
         BeginProperty Font 
            Name            =   "Verdana"
            Size            =   6.75
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000008&
         Height          =   225
         Left            =   0
         TabIndex        =   1
         Top             =   20
         Width           =   455
      End
      Begin VB.Shape Shape1 
         BackColor       =   &H8000000F&
         BackStyle       =   1  'Opaque
         BorderStyle     =   0  'Transparent
         Height          =   220
         Index           =   2
         Left            =   10
         Shape           =   2  'Oval
         Top             =   20
         Width           =   450
      End
      Begin VB.Shape Shape1 
         BackColor       =   &H80000015&
         BackStyle       =   1  'Opaque
         FillColor       =   &H80000015&
         Height          =   230
         Index           =   0
         Left            =   10
         Shape           =   2  'Oval
         Top             =   20
         Width           =   450
      End
      Begin VB.Shape Shape1 
         BackColor       =   &H80000014&
         BackStyle       =   1  'Opaque
         BorderStyle     =   0  'Transparent
         Height          =   225
         Index           =   1
         Left            =   0
         Shape           =   2  'Oval
         Top             =   0
         Width           =   460
      End
   End
   Begin VB.Line Line1 
      BorderColor     =   &H80000010&
      BorderWidth     =   3
      X1              =   0
      X2              =   2000
      Y1              =   120
      Y2              =   120
   End
   Begin VB.Line Line2 
      BorderColor     =   &H80000014&
      X1              =   0
      X2              =   2020
      Y1              =   145
      Y2              =   145
   End
End
Attribute VB_Name = "HCSSlider"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit
Private Const SRCCOPY = &HCC0020

Private Declare Function BitBlt Lib "gdi32.dll" (ByVal hDestDC As Long, ByVal x As Long, ByVal y As Long, ByVal nWidth As Long, ByVal nHeight As Long, ByVal hSrcDC As Long, ByVal xSrc As Long, ByVal ySrc As Long, ByVal dwRop As Long) As Long

Private m_Percent As Long
Private m_fSlide As Boolean
Private m_SliderPos As Long
Private m_Offset As Single
Private m_PlaceHolder As Single

Public Event Change(Percent As Long)
Public Property Get Percent() As Long
   Percent = m_Percent
End Property

Public Property Let Percent(NewPercent As Long)
   If NewPercent > -1 And NewPercent < 101 Then
      m_Percent = NewPercent
      SetLabel m_Percent
      Slider.Left = m_Percent * m_Offset
      RaiseEvent Change(m_Percent)
      PropertyChanged "Percent"
   End If
End Property

Private Sub lblPercent_MouseDown(Button As Integer, Shift As Integer, x As Single, y As Single)
   Dim Ret As Long
   Debug.Print "MouseDown"
   Ret = BitBlt(Slider.hDC, 0, 0, 30, 11, UserControl.hDC, 295, 363, SRCCOPY)
   Slider.Refresh
   If m_fSlide = False Then
      m_PlaceHolder = x 'ix is where exactly on the slider they pressed the button, as it could be anywhere on the
               'slider we have to save it so we can move the slider only so much in relation to here.
      m_SliderPos = Slider.Left
      m_fSlide = True
   End If
End Sub

Private Sub lblPercent_MouseMove(Button As Integer, Shift As Integer, x As Single, y As Single)
   Dim SliderLeft As Integer
   If m_fSlide = True Then
      SliderLeft = m_SliderPos + Int(x - m_PlaceHolder) 'how much has it moved?
      If SliderLeft < 0 Then SliderLeft = 0
      If SliderLeft > ScaleWidth - 500 Then SliderLeft = ScaleWidth - 500
      m_SliderPos = SliderLeft 'set postion
      Slider.Left = SliderLeft 'and move the it here
      m_Percent = Int(SliderLeft / m_Offset) 'now calculate what the volume should be
      SetLabel m_Percent 'show it on the label
      RaiseEvent Change(m_Percent)
   End If
   
End Sub

Private Sub lblPercent_MouseUp(Button As Integer, Shift As Integer, x As Single, y As Single)
   On Error Resume Next
   Debug.Print "MouseUp"
   Dim Ret As Long
   Ret = BitBlt(Slider.hDC, 0, 0, 30, 11, UserControl.hDC, 295, 376, SRCCOPY)
   Slider.Refresh
   m_fSlide = False
End Sub

Public Sub SetLabel(ByVal Percent As Integer)
   Dim A$
   Select Case m_Percent 'and show the percentage (center it on the thumb)
         Case Is < 10
            A$ = "    "
            lblPercent.Left = 0
         Case 9 To 99
            A$ = "   "
            lblPercent.Left = 0
         Case 100
            A$ = " "
            lblPercent.Left = 30
      End Select
      lblPercent.Caption = A$ & m_Percent
End Sub

Private Sub UserControl_KeyDown(KeyCode As Integer, Shift As Integer)
   Debug.Print KeyCode
End Sub

Private Sub UserControl_Resize()
   Line1.X2 = ScaleWidth - 20
   Line2.X2 = ScaleWidth
   Line1.Y1 = ScaleHeight / 2
   Line1.Y2 = Line1.Y1
   Line2.Y1 = Line1.Y1 + 30
   Line2.Y2 = Line2.Y1
   Slider.Top = (ScaleHeight / 2) - 120
   m_Offset = (ScaleWidth - 500) / 100
   Debug.Print m_Offset
End Sub
