VERSION 5.00
Begin VB.Form Form1 
   Appearance      =   0  'Flat
   BackColor       =   &H80000005&
   BorderStyle     =   0  'None
   Caption         =   "Form1"
   ClientHeight    =   4560
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   4905
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   4560
   ScaleWidth      =   4905
   Begin VB.Label Label3 
      Alignment       =   2  'Center
      BackColor       =   &H00FFFFFF&
      Caption         =   "-"
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   14.25
         Charset         =   134
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   495
      Left            =   3600
      TabIndex        =   2
      Top             =   1080
      Width           =   975
   End
   Begin VB.Label Label2 
      Alignment       =   2  'Center
      BackColor       =   &H00FFFFFF&
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
      Height          =   495
      Left            =   3840
      TabIndex        =   1
      Top             =   960
      Width           =   975
   End
   Begin VB.Label Label1 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00FFFFFF&
      BackStyle       =   0  'Transparent
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   42
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00C00000&
      Height          =   735
      Left            =   0
      TabIndex        =   0
      Top             =   0
      Width           =   4935
   End
   Begin VB.Image Image1 
      Appearance      =   0  'Flat
      Height          =   5000
      Left            =   0
      Picture         =   "Form1.frx":0000
      Stretch         =   -1  'True
      Top             =   0
      Width           =   5000
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

Public Sub MoveForm(hwnd As Long)
DoEvents
ReleaseCapture
SendMessage hwnd, WM_NCLBUTTONDOWN, HTCAPTION, 0&
End Sub

Private Sub Form_MouseMove(Button As Integer, Shift As Integer, x As Single, y As Single)
    If Button = vbLeftButton Then MoveForm hwnd '如果按下鼠标左键就移动窗体
End Sub



Private Sub Form_Load()


    Dim rtn As Long
    Dim retValue As Long
    rtn = GetWindowLong(hwnd, GWL_EXSTYLE)
    rtn = rtn Or WS_EX_LAYERED
    SetWindowLong hwnd, GWL_EXSTYLE, rtn
    SetLayeredWindowAttributes hwnd, 0, 235, LWA_ALPHA

    Dim name As String
    Open App.Path & "\loadpath.pa" For Input As #1
        Line Input #1, name
    Close #1
    
    Me.Top = 0
    Me.Left = 0
    Me.Width = Screen.Width / 5
    Me.Height = Me.Width
    
    Image1.Height = Me.Width / 12 * 11
    Image1.Width = Me.Width
    Image1.Top = Me.Height * 3 / 12
    
    Label1.Height = Me.Height / 6
    Label1.Top = Me.Height / 12
    Label1.Left = 0
    Label1.Width = Me.Width
    Label1.ForeColor = vbBlue
    Label1.BackStyle = 0
    Label1.Caption = name
    
    Label2.Height = Me.Height / 15
    Label2.Width = Me.Width / 8
    Label2.Top = 0
    Label2.Left = Me.Width - Label2.Width
    
    Label3.Height = Me.Height / 15
    Label3.Width = Me.Width / 8
    Label3.Top = 0
    Label3.Left = Me.Width - Label2.Width - Label3.Width
    
    
   ' Dim numn As Integer
    'numn = num(name)
    Image1.Picture = LoadPicture(App.Path & "\history\" & name & ".bmp")
End Sub

'Public Function num(cname As String)
 '   If cname = "语文" Then num = 1
 '   If cname = "数学" Then num = 2
 '   If cname = "英语" Then num = 3
 '   If cname = "物理" Then num = 4
 '   If cname = "化学" Then num = 5
 '   If cname = "历史" Then num = 6
 '   If cname = "政治" Then num = 7
 '   If cname = "生物" Then num = 8
 '   If cname = "信息" Then num = 9
 '   If cname = "通用" Then num = 10
'End Function

Private Sub Label2_Click()
    Label2.BackColor = vbRed
    Unload Me
End Sub

Private Sub label2_MouseDown(Button As Integer, Shift As Integer, x As Single, y As Single)
    Label2.BackColor = vbRed
End Sub

Private Sub label2_MouseUp(Button As Integer, Shift As Integer, x As Single, y As Single)
    Label2.BackColor = vbWhite
End Sub


Private Sub label3_MouseDown(Button As Integer, Shift As Integer, x As Single, y As Single)
    Label3.BackColor = vbBlue
End Sub

Private Sub label3_MouseUp(Button As Integer, Shift As Integer, x As Single, y As Single)
    Label3.BackColor = vbWhite
    Me.WindowState = vbMinimized
End Sub
