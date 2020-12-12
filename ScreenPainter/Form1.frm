VERSION 5.00
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "COMDLG32.OCX"
Begin VB.Form Form1 
   BackColor       =   &H00000000&
   BorderStyle     =   4  'Fixed ToolWindow
   Caption         =   "Form1"
   ClientHeight    =   720
   ClientLeft      =   12465
   ClientTop       =   7785
   ClientWidth     =   4320
   Icon            =   "Form1.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   720
   ScaleWidth      =   4320
   ShowInTaskbar   =   0   'False
   Begin MSComDlg.CommonDialog cd 
      Left            =   2160
      Top             =   480
      _ExtentX        =   847
      _ExtentY        =   847
      _Version        =   393216
   End
   Begin VB.CommandButton ext 
      BackColor       =   &H000000FF&
      Caption         =   "ÍË³ö"
      Height          =   735
      Left            =   3600
      MaskColor       =   &H000000FF&
      Style           =   1  'Graphical
      TabIndex        =   4
      Top             =   0
      UseMaskColor    =   -1  'True
      Width           =   735
   End
   Begin VB.CommandButton clear 
      Caption         =   "ÇåÆÁ"
      Height          =   735
      Left            =   2880
      TabIndex        =   3
      Top             =   0
      Width           =   735
   End
   Begin VB.CommandButton esr 
      Caption         =   "ÏðÆ¤"
      Height          =   735
      Left            =   2160
      TabIndex        =   2
      Top             =   0
      Width           =   735
   End
   Begin VB.CommandButton col 
      Caption         =   "ÑÕÉ«"
      Height          =   735
      Left            =   1440
      TabIndex        =   1
      Top             =   0
      Width           =   735
   End
   Begin VB.CommandButton penmouse 
      Caption         =   "Êó±ê"
      Height          =   735
      Left            =   720
      TabIndex        =   0
      Top             =   0
      Width           =   735
   End
   Begin VB.CommandButton pen 
      Caption         =   "»­±Ê"
      Height          =   735
      Left            =   0
      TabIndex        =   5
      Top             =   0
      Width           =   735
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Declare Function SetWindowPos& Lib "user32" (ByVal hwnd As Long, _
ByVal hWndInsertAfter As Long, ByVal X As Long, ByVal Y As Long, _
ByVal cx As Long, ByVal cy As Long, ByVal wFlags As Long)

Private Sub clear_Click()
    Form2.Cls
End Sub

Private Sub col_Click()
    cd.ShowColor
    Form2.color = cd.color
End Sub

Private Sub esr_Click()
    Form2.esr = True
End Sub

Private Sub ext_Click()
    Unload Form2
    Unload Me
End Sub

Private Sub Form_Load()
    Load Form2
    Form2.Visible = True
    Call SetWindowPos(Me.hwnd, -1, 0, 0, 0, 0, 3)
    Me.Top = Screen.Height - Me.Height * 2
    Me.Left = Screen.Width / 2 - Me.Width / 2
End Sub

Private Sub Form_QueryUnload(Cancel As Integer, UnloadMode As Integer)
    Unload Form1
    End
End Sub

Private Sub pen_Click()
    Form2.esr = False
    Form2.Top = 0
End Sub

Private Sub penmouse_Click()
    Form2.esr = False
    Form2.Top = Screen.Height
End Sub
