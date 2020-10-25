VERSION 5.00
Begin VB.Form Form1 
   Appearance      =   0  'Flat
   BackColor       =   &H00000000&
   BorderStyle     =   0  'None
   Caption         =   "作业板控制台"
   ClientHeight    =   3150
   ClientLeft      =   14325
   ClientTop       =   4500
   ClientWidth     =   5280
   Icon            =   "作业板控制台.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   3150
   ScaleWidth      =   5280
   ShowInTaskbar   =   0   'False
   Begin VB.Timer unloadanim 
      Enabled         =   0   'False
      Interval        =   20
      Left            =   3120
      Top             =   1800
   End
   Begin VB.Timer animTimer 
      Enabled         =   0   'False
      Interval        =   20
      Left            =   1560
      Top             =   1560
   End
   Begin VB.CommandButton Command1 
      Appearance      =   0  'Flat
      Caption         =   "新建"
      BeginProperty Font 
         Name            =   "等线"
         Size            =   12
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   1440
      TabIndex        =   2
      Top             =   240
      Width           =   1455
   End
   Begin VB.CommandButton Command2 
      Appearance      =   0  'Flat
      Caption         =   "载入"
      BeginProperty Font 
         Name            =   "等线"
         Size            =   12
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   1440
      TabIndex        =   1
      Top             =   600
      Width           =   1455
   End
   Begin VB.ComboBox Combo1 
      Appearance      =   0  'Flat
      BackColor       =   &H00000000&
      BeginProperty Font 
         Name            =   "等线"
         Size            =   10.5
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FFFFFF&
      Height          =   330
      ItemData        =   "作业板控制台.frx":0442
      Left            =   240
      List            =   "作业板控制台.frx":0467
      TabIndex        =   0
      Text            =   "数学"
      Top             =   240
      Width           =   855
   End
   Begin VB.Label Label2 
      BackColor       =   &H00000000&
      BackStyle       =   0  'Transparent
      Caption         =   "作业布置台"
      BeginProperty Font 
         Name            =   "等线"
         Size            =   9
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FFFFFF&
      Height          =   375
      Left            =   0
      TabIndex        =   4
      Top             =   120
      Width           =   1215
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
      Height          =   375
      Left            =   2040
      TabIndex        =   3
      Top             =   0
      Width           =   495
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Declare Function GetWindowLong Lib "user32" Alias "GetWindowLongA" (ByVal hwnd As Long, ByVal nIndex As Long) As Long
Private Declare Function SetWindowLong Lib "user32" Alias "SetWindowLongA" (ByVal hwnd As Long, ByVal nIndex As Long, ByVal dwNewLong As Long) As Long
Private Declare Function SetLayeredWindowAttributes Lib "user32" (ByVal hwnd As Long, ByVal crKey As Long, ByVal bAlpha As Byte, ByVal dwFlags As Long) As Long
Private Declare Function SetWindowPos Lib "user32" (ByVal hwnd As Long, ByVal hWndInsertAfter As Long, ByVal x As Long, ByVal y As Long, ByVal cx As Long, ByVal cy As Long, ByVal wFlags As Long) As Long

Const HWND_TOPMOST = -1
Const SWP_SHOWWINDOW = &H40
Const SWP_NOSIZE = &H1
Private Const WS_EX_LAYERED = &H80000
Const GWL_EXSTYLE = (-20)
Private Const LWA_ALPHA = &H2
Private Const LWA_COLORKEY = &H2

Private Declare Function ReleaseCapture Lib "user32" () As Long
Private Declare Function SendMessage Lib "user32" Alias "SendMessageA" (ByVal hwnd As Long, ByVal wMsg As Long, ByVal wParam As Long, lParam As Any) As Long
Const HTCAPTION = 2
Const WM_NCLBUTTONDOWN = &HA1

Dim alpha As Integer

Public Sub MoveForm(hwnd As Long)
DoEvents
ReleaseCapture
SendMessage hwnd, WM_NCLBUTTONDOWN, HTCAPTION, 0&
End Sub

Private Sub Form_MouseMove(Button As Integer, Shift As Integer, x As Single, y As Single)
    If Button = vbLeftButton Then MoveForm hwnd '如果按下鼠标左键就移动窗体
End Sub

Private Sub Command1_Click()
    Dim name_ As String
    name_ = Combo1.Text
    'Debug.Print name
    'Debug.Print App.Path
    Open App.path & "\name" & ".hkn" For Output As #1
        Print #1, name_
    Close #1
    Open App.path & "\color" & ".col" For Output As #4
        Print #4, Str(Rnd * 120)
    Close #4
    
    Shell "dboard.exe", vbNormalFocus
End Sub



Private Sub Command2_Click()
    'Open App.Path & name & ".jpg" For Input As #1
    Dim path As String
    'Form2.Caption = Form1.Combo1.Text
    Dim cn As String
    cn = Form1.Combo1.Text
    path = cn
    'Debug.Print path
    Open App.path + "\loadpath" & ".pa" For Output As #2
        Print #2, path
    Close #2
    
    Shell "picloader.exe", vbNormalFocus
End Sub


Private Sub animTimer_Timer()
    alpha = alpha + (190 - alpha) * 0.3
    SetLayeredWindowAttributes hwnd, 0, alpha, LWA_ALPHA
    Me.Top = Me.Top + (Screen.Height / 3 - Me.Top) * 0.5
    If Me.Top = Screen.Height / 3 Then animTimer.Enabled = False
End Sub

Private Sub Form_Load()

    alpha = 0
    Me.Left = Screen.Width * 3 / 4
    'Me.Top = Screen.Height / 3
    Me.Height = Screen.Height / 10
    Me.Width = Screen.Width / 8
    Me.Top = 0 - Me.Height
    animTimer.Enabled = True

    Dim rtn As Long
    Dim retValue As Long
    rtn = GetWindowLong(hwnd, GWL_EXSTYLE)
    rtn = rtn Or WS_EX_LAYERED
    SetWindowLong hwnd, GWL_EXSTYLE, rtn
    SetLayeredWindowAttributes hwnd, 0, alpha, LWA_ALPHA
    
    Label1.Width = Me.Width / 5
    Label1.Height = Me.Height / 5
    'Label1.Top =
    Label1.Left = Me.Width - Label1.Width
    Label2.Top = 0
    Label2.Left = 0
    Command1.Height = Me.Height / 3
    Command2.Height = Me.Height / 3
    Combo1.Top = Me.Height / 3
    Command1.Top = Me.Height / 3
    Command2.Top = Me.Height - Command2.Height
    Command1.Left = Me.Width - Command1.Width
    Command2.Left = Me.Width - Command2.Width
End Sub

Private Sub unloadanim_Timer()
    If alpha = 0 Then
        unloadanim.Enabled = False
        End
    End If
    alpha = alpha - (alpha - 0) * 0.5
    SetLayeredWindowAttributes hwnd, 0, alpha, LWA_ALPHA
    'Debug.Print alpha
End Sub

Private Sub Label1_Click()
    unloadanim.Enabled = True
    Label1.BackColor = vbRed
    'Unload Me
End Sub

Private Sub Label1_MouseDown(Button As Integer, Shift As Integer, x As Single, y As Single)
    Label1.BackColor = vbRed
End Sub

Private Sub Label1_MouseUp(Button As Integer, Shift As Integer, x As Single, y As Single)
    Label1.BackColor = vbBlack
End Sub
