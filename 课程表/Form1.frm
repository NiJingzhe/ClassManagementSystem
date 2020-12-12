VERSION 5.00
Begin VB.Form Form1 
   Appearance      =   0  'Flat
   BackColor       =   &H00000000&
   BorderStyle     =   0  'None
   Caption         =   "Form1"
   ClientHeight    =   6150
   ClientLeft      =   14130
   ClientTop       =   5070
   ClientWidth     =   2970
   Icon            =   "Form1.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   6150
   ScaleWidth      =   2970
   ShowInTaskbar   =   0   'False
   Begin VB.Timer unloadanim 
      Enabled         =   0   'False
      Interval        =   40
      Left            =   1200
      Top             =   4800
   End
   Begin VB.Timer animTimer 
      Enabled         =   0   'False
      Interval        =   40
      Left            =   1440
      Top             =   2880
   End
   Begin VB.Label Label3 
      Alignment       =   2  'Center
      BackColor       =   &H00000000&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "换课"
      BeginProperty Font 
         Name            =   "微软雅黑"
         Size            =   12
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FFFFFF&
      Height          =   300
      Left            =   0
      TabIndex        =   3
      Top             =   5880
      Width           =   3015
   End
   Begin VB.Label class 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      BackStyle       =   0  'Transparent
      BorderStyle     =   1  'Fixed Single
      Caption         =   "Label3"
      BeginProperty Font 
         Name            =   "等线"
         Size            =   21.75
         Charset         =   134
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FFFFFF&
      Height          =   615
      Index           =   0
      Left            =   480
      TabIndex        =   2
      Top             =   960
      Width           =   1935
   End
   Begin VB.Label Label2 
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
      Left            =   2280
      TabIndex        =   1
      Top             =   0
      Width           =   735
   End
   Begin VB.Label Label1 
      BackStyle       =   0  'Transparent
      Caption         =   "课程表"
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
      Height          =   375
      Left            =   120
      TabIndex        =   0
      Top             =   120
      Width           =   735
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
Private Declare Function SetWindowPos Lib "user32" (ByVal hwnd As Long, ByVal hWndInsertAfter As Long, ByVal X As Long, ByVal Y As Long, ByVal cx As Long, ByVal cy As Long, ByVal wFlags As Long) As Long

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

Public theme As String
Dim themecol As ColorConstants


Public Sub MoveForm(hwnd As Long)
DoEvents
ReleaseCapture
SendMessage hwnd, WM_NCLBUTTONDOWN, HTCAPTION, 0&
End Sub



Private Sub Form_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
    If Button = vbLeftButton Then MoveForm hwnd '如果按下鼠标左键就移动窗体
End Sub

Private Sub animTimer_Timer()
    If Abs(Me.Left - Screen.Width * 7 / 8) <= 1 Then animTimer.Enabled = False: Debug.Print "finish"
    alpha = alpha + (180 - alpha) * 0.3
    SetLayeredWindowAttributes hwnd, 0, alpha, LWA_ALPHA
    Me.Left = Me.Left - (Me.Left - Screen.Width * 7 / 8) * 0.5
End Sub


Private Sub Form_Load()
        
    Change = False
    classchange = Array("语文", "数学", "英语", "物理", "化学", "政治", "历史", "地理", "生物", "通用", "信息")

    alpha = 0
    Me.Left = Screen.Width
    animTimer.Enabled = True

    Open "../theme.thm" For Input As #30
        Input #30, theme
    Close #30
    
    If theme = "white" Then
        themecol = vbWhite
    Else
        If theme = "black" Then
            themecol = vbBlack
        End If
    End If

    Dim rtn As Long
    Dim retValue As Long
    rtn = GetWindowLong(hwnd, GWL_EXSTYLE)
    rtn = rtn Or WS_EX_LAYERED
    SetWindowLong hwnd, GWL_EXSTYLE, rtn
    SetLayeredWindowAttributes hwnd, 0, 220, LWA_ALPHA

    'Me.Left = Screen.Width * 7 / 8
    Me.Top = Screen.Height / 3
    Me.Height = Screen.Height * 16 / 30
    Me.Width = Screen.Width / 8
    Me.BackColor = themecol
    Label1.Top = 0
    Label1.Left = 0
    Label1.ForeColor = vbWhite - themecol
    Label2.Width = Me.Width / 5
    Label2.Height = Label2.Width / 2
    Label2.Top = 0
    Label2.Left = Me.Width - Label2.Width
    Label2.BackColor = themecol
    Label2.ForeColor = &HFFFFFF - themecol
    Label3.BackColor = themecol
    Label3.ForeColor = vbWhite - themecol
    
    Dim realtop As Integer, realheight As Integer
    realtop = Label2.Height
    realheight = Me.Height - realtop
    
    
    Dim classrow() As String
    Dim k As Integer
    k = 0
    Open App.Path + "/CS.txt" For Input As #1
        Do While Not EOF(1)
            ReDim Preserve classrow(k)
            Line Input #1, classrow(k)
            k = k + 1
        Loop
    Close #1
    
    Dim week As Integer
    week = Weekday(Date, 2)
    Dim classname
    classname = Split(classrow(week - 1), ",")
    
    Dim classnum
    
    classnum = UBound(classname)
    
    'Debug.Print classnum
    
    With class(0)
        .Height = (realheight - Label3.Height) / (classnum + 1)
        .Width = Me.Width
        .Left = 0
        .Top = realtop
        .Caption = classname(0)
        .ForeColor = vbWhite - themecol
    End With
    
    Dim i As Integer
    
    For i = 1 To UBound(classname)
        Debug.Print classname(i)
        Load class(i)
        With class(i)
            .Enabled = True
            .Visible = True
            .Width = Me.Width
            .Height = (realheight - Label3.Height) / (classnum + 1)
            .Left = 0
            .Top = realtop + (i) * class(i).Height
            .Caption = classname(i)
            .ForeColor = vbWhite - themecol
        End With
    Next i
    
    Label3.Height = Me.Height / 20
    Label3.Width = Me.Width
    Label3.Left = 0
    Label3.Top = Me.Height - Label3.Height
    
End Sub

Private Sub Label2_Click()
    animTimer.Enabled = False
    unloadanim.Enabled = True
    Label2.BackColor = vbRed
    'Unload Me
End Sub



Private Sub Label3_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
Label3.BackColor = vbBlue
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


Private Sub Label2_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
    Label2.BackColor = vbRed
End Sub

Private Sub Label2_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
    Label2.BackColor = themecol
End Sub

Private Sub Label3_Click()
    Load Form2
    Form2.Visible = True
End Sub

Private Sub Label3_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
    Label3.BackColor = themecol
End Sub
