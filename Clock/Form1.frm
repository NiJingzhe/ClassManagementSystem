VERSION 5.00
Begin VB.Form Form1 
   BackColor       =   &H00000000&
   BorderStyle     =   0  'None
   Caption         =   "Form1"
   ClientHeight    =   4380
   ClientLeft      =   11760
   ClientTop       =   6345
   ClientWidth     =   6315
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   4380
   ScaleWidth      =   6315
   ShowInTaskbar   =   0   'False
   Begin VB.Timer unloadanim 
      Enabled         =   0   'False
      Interval        =   20
      Left            =   2880
      Top             =   600
   End
   Begin VB.Timer animTimer 
      Enabled         =   0   'False
      Interval        =   20
      Left            =   720
      Top             =   1200
   End
   Begin VB.Timer Timer1 
      Interval        =   100
      Left            =   600
      Top             =   3240
   End
   Begin VB.Label Label4 
      BackStyle       =   0  'Transparent
      Caption         =   "时钟"
      BeginProperty Font 
         Name            =   "微软雅黑"
         Size            =   10.5
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FFFFFF&
      Height          =   735
      Left            =   0
      TabIndex        =   3
      Top             =   0
      Width           =   1455
   End
   Begin VB.Label Label3 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00000000&
      Caption         =   "Label2"
      BeginProperty Font 
         Name            =   "等线 Light"
         Size            =   42
         Charset         =   0
         Weight          =   300
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FFFFFF&
      Height          =   1455
      Left            =   1320
      TabIndex        =   2
      Top             =   2880
      Width           =   4215
   End
   Begin VB.Label Label2 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00000000&
      Caption         =   "Label2"
      BeginProperty Font 
         Name            =   "等线"
         Size            =   60
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FFFFFF&
      Height          =   1455
      Left            =   1058
      TabIndex        =   1
      Top             =   1463
      Width           =   4215
   End
   Begin VB.Label Label1 
      Alignment       =   2  'Center
      BackColor       =   &H00000000&
      Caption         =   "×"
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   14.25
         Charset         =   134
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FFFFFF&
      Height          =   975
      Left            =   4920
      TabIndex        =   0
      Top             =   120
      Width           =   1335
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Declare Function ReleaseCapture Lib "user32" () As Long
Private Declare Function SendMessage Lib "user32" Alias "SendMessageA" (ByVal hwnd As Long, ByVal wMsg As Long, ByVal wParam As Long, lParam As Any) As Long
Const HTCAPTION = 2
Const WM_NCLBUTTONDOWN = &HA1

Private Declare Function GetWindowLong Lib "user32" Alias "GetWindowLongA" (ByVal hwnd As Long, ByVal nIndex As Long) As Long
Private Declare Function SetWindowLong Lib "user32" Alias "SetWindowLongA" (ByVal hwnd As Long, ByVal nIndex As Long, ByVal dwNewLong As Long) As Long
Private Declare Function SetLayeredWindowAttributes Lib "user32" (ByVal hwnd As Long, ByVal crKey As Long, ByVal bAlpha As Byte, ByVal dwFlags As Long) As Long
Private Declare Function SetWindowPos Lib "user32" (ByVal hwnd As Long, ByVal hWndInsertAfter As Long, ByVal X As Long, ByVal Y As Long, ByVal cx As Long, ByVal cy As Long, ByVal wFlags As Long) As Long

Const HWND_TOPMOST = -1
Const SWP_SHOWWINDOW = &H40
Const SWP_NOSIZE = &H1
Private Const WS_EX_LAYERED = &H80000
Const GWL_EXSTYLE = (-20)
Private Const LWA_ALPHA = &H2
Private Const LWA_COLORKEY = &H2

Dim ti As Long
Dim alpha As Integer
 
Public Sub MoveForm(hwnd As Long)
DoEvents
ReleaseCapture
SendMessage hwnd, WM_NCLBUTTONDOWN, HTCAPTION, 0&
End Sub

Private Sub animTimer_Timer()
    If Abs(Me.Left - Screen.Width * 3 / 4) <= 1 Then animTimer.Enabled = False: Debug.Print "finish"
    alpha = alpha + (180 - alpha) * 0.3
    SetLayeredWindowAttributes hwnd, 0, alpha, LWA_ALPHA
    Me.Left = Me.Left - (Me.Left - Screen.Width * 3 / 4) * 0.5
End Sub

Private Sub Form_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
    If Button = vbLeftButton Then MoveForm hwnd '如果按下鼠标左键就移动窗体
End Sub


Private Sub Form_Load()
    Me.Left = Screen.Width
    Me.Top = 0
    alpha = 0
    animTimer.Enabled = True
    
    
    Dim rtn As Long
    Dim retValue As Long
    rtn = GetWindowLong(hwnd, GWL_EXSTYLE)
    rtn = rtn Or WS_EX_LAYERED
    SetWindowLong hwnd, GWL_EXSTYLE, rtn
    SetLayeredWindowAttributes hwnd, 0, alpha, LWA_ALPHA
    

    'Me.Left = Screen.Width * 3 / 4
    Me.Top = 0
    Me.Height = Screen.Height * 1 / 3
    Me.Width = Screen.Width / 4
    Label4.Top = 0
    Label4.Left = 0
    Label1.Width = Me.Width / 8
    Label1.Height = Me.Height / 12
    Label1.Top = 0
    Label1.Left = Me.Width - Label1.Width
    Label2.Width = Me.Width
    Label2.Height = Me.Height / 4
    Label2.Top = Me.Height / 2
    Label2.Left = 0
    Label3.Width = Me.Width
    Label3.Height = Me.Height / 4
    Label3.Top = Me.Height / 2 - Label3.Height
    Label3.Left = 0
    Label3.Caption = Format(Now, "mm月dd日 ") & turn(Weekday(Date, 2))
End Sub


Private Sub Label1_Click()
    animTimer.Enabled = False
    unloadanim.Enabled = True
    Label1.BackColor = vbRed
End Sub

Private Sub Label1_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
    Label1.BackColor = vbRed
End Sub

Private Sub Label1_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
    Label1.BackColor = vbBlack
End Sub


Private Sub Timer1_Timer()
    Label2.Caption = Format(Now, "hh:mm:ss")
End Sub


Function turn(weeknum As Integer) As String
    If weeknum = 1 Then turn = "Mon."
    If weeknum = 2 Then turn = "Tue."
    If weeknum = 3 Then turn = "Wed."
    If weeknum = 4 Then turn = "Thu."
    If weeknum = 5 Then turn = "Fri."
    If weeknum = 6 Then turn = "Sat."
    If weeknum = 7 Then turn = "Sun."
End Function


Private Sub unloadanim_Timer()
    If alpha = 0 Then
        unloadanim.Enabled = False
        End
    End If
    alpha = alpha - (alpha - 0) * 0.5
    SetLayeredWindowAttributes hwnd, 0, alpha, LWA_ALPHA
    'Debug.Print alpha
End Sub
