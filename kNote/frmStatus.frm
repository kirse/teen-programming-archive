VERSION 5.00
Begin VB.Form frmStatus 
   BorderStyle     =   0  'None
   Caption         =   "Form1"
   ClientHeight    =   315
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   3000
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
   ScaleHeight     =   315
   ScaleWidth      =   3000
   ShowInTaskbar   =   0   'False
   StartUpPosition =   3  'Windows Default
   Begin VB.Label status 
      AutoSize        =   -1  'True
      Caption         =   "kNote 1.0 - Standby..."
      Height          =   195
      Left            =   90
      TabIndex        =   0
      Top             =   60
      Width           =   1635
   End
   Begin VB.Shape Shape1 
      Height          =   315
      Left            =   0
      Top             =   0
      Width           =   3000
   End
End
Attribute VB_Name = "frmStatus"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
