VERSION 5.00
Begin VB.Form Form2 
   Appearance      =   0  'Flat
   BackColor       =   &H80000005&
   BorderStyle     =   0  'None
   Caption         =   "值日生表编辑器"
   ClientHeight    =   6450
   ClientLeft      =   12390
   ClientTop       =   4770
   ClientWidth     =   5655
   LinkTopic       =   "Form2"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   6450
   ScaleWidth      =   5655
   ShowInTaskbar   =   0   'False
   Begin VB.TextBox No 
      Height          =   375
      Left            =   1200
      TabIndex        =   10
      Top             =   240
      Width           =   1215
   End
   Begin VB.TextBox nam 
      Alignment       =   2  'Center
      Height          =   375
      Left            =   3240
      TabIndex        =   9
      Top             =   5280
      Width           =   1575
   End
   Begin VB.CommandButton Command3 
      Appearance      =   0  'Flat
      BackColor       =   &H8000000B&
      Caption         =   "保存表格"
      Height          =   495
      Left            =   120
      Style           =   1  'Graphical
      TabIndex        =   6
      Top             =   5760
      Width           =   5415
   End
   Begin VB.CommandButton Command2 
      Appearance      =   0  'Flat
      BackColor       =   &H8000000B&
      Caption         =   "添加"
      Height          =   375
      Left            =   4920
      Style           =   1  'Graphical
      TabIndex        =   4
      Top             =   5280
      Width           =   615
   End
   Begin VB.ComboBox jobbox 
      Appearance      =   0  'Flat
      Height          =   300
      ItemData        =   "值日生表编辑器.frx":0000
      Left            =   1080
      List            =   "值日生表编辑器.frx":0016
      TabIndex        =   2
      Top             =   5280
      Width           =   1095
   End
   Begin VB.ListBox List1 
      Appearance      =   0  'Flat
      Height          =   4530
      ItemData        =   "值日生表编辑器.frx":0046
      Left            =   120
      List            =   "值日生表编辑器.frx":0048
      TabIndex        =   0
      Top             =   720
      Width           =   5415
   End
   Begin VB.Label Label5 
      BackStyle       =   0  'Transparent
      Caption         =   "值日生表编辑器"
      BeginProperty Font 
         Name            =   "微软雅黑"
         Size            =   9
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   0
      TabIndex        =   8
      Top             =   0
      Width           =   1695
   End
   Begin VB.Label Label4 
      Alignment       =   2  'Center
      BackColor       =   &H8000000E&
      Caption         =   "×"
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   15
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   5040
      TabIndex        =   7
      Top             =   0
      Width           =   615
   End
   Begin VB.Label Label3 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      Caption         =   "组     别"
      ForeColor       =   &H80000008&
      Height          =   255
      Left            =   240
      TabIndex        =   5
      Top             =   360
      Width           =   855
   End
   Begin VB.Label Label2 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      Caption         =   "人员姓名"
      ForeColor       =   &H80000008&
      Height          =   255
      Left            =   2400
      TabIndex        =   3
      Top             =   5280
      Width           =   975
   End
   Begin VB.Label Label1 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      Caption         =   "职   务"
      ForeColor       =   &H80000008&
      Height          =   255
      Left            =   240
      TabIndex        =   1
      Top             =   5280
      Width           =   855
   End
End
Attribute VB_Name = "Form2"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim ind As Integer
Dim change As Boolean
Private Declare Function ReleaseCapture Lib "user32" () As Long
Private Declare Function SendMessage Lib "user32" Alias "SendMessageA" (ByVal hwnd As Long, ByVal wMsg As Long, ByVal wParam As Long, lParam As Any) As Long
Const HTCAPTION = 2
Const WM_NCLBUTTONDOWN = &HA1

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
 


Public Sub MoveForm(hwnd As Long)
DoEvents
ReleaseCapture
SendMessage hwnd, WM_NCLBUTTONDOWN, HTCAPTION, 0&
End Sub

Private Sub Form_MouseMove(Button As Integer, Shift As Integer, x As Single, y As Single)
    If Button = vbLeftButton Then MoveForm hwnd '如果按下鼠标左键就移动窗体
End Sub

Private Sub Command2_Click()
    If (jobbox.Text <> "" And nam.Text <> "") Then
        List1.AddItem (jobbox.Text + "    " + nam.Text)
    End If
    Dim i As Integer
End Sub

Private Sub Command3_Click()
    Dim i As Integer

    If Len(No.Text) = 2 Then
        Open "..\NAMELIST\" + "namelist" + No.Text + ".txt" For Output As #2
            For i = 0 To List1.ListCount - 1
               Print #2, List1.List(i)
               'Debug.Print List1.List(i)
            Next i
        Close #2
    End If
    
    If Len(No.Text) = 1 Then
        Open "..\NAMELIST\" + "namelist" + No.Text + ".txt" For Output As #17
            For i = 0 To List1.ListCount - 1
               Print #17, List1.List(i)
               'Debug.Print List1.List(i)
            Next i
        Close #17
    End If
    
    If No.Text = "" Then
        Open "..\NAMELIST\" + "namelist" + Form1.gpn + ".txt" For Output As #2
            For i = 0 To List1.ListCount - 1
               Print #2, List1.List(i)
               'Debug.Print List1.List(i)
            Next i
        Close #2
    End If
    Me.Visible = False
    If Form1.Visible Then
        Form1.Visible = True
    Else
        Form1.Show vbNormalFocus
    End If
End Sub

Private Sub Form_load()
    'Load Form1
    No.Text = Form1.gpn
    change = False
    Form1.Visible = True
    Dim rtn As Long
    Dim retValue As Long
    rtn = GetWindowLong(hwnd, GWL_EXSTYLE)
    rtn = rtn Or WS_EX_LAYERED
    SetWindowLong hwnd, GWL_EXSTYLE, rtn
    SetLayeredWindowAttributes hwnd, 0, 235, LWA_ALPHA

    Label4.Width = Me.Width / 10
    Label4.Height = Label4.Width / 2
    Label4.Top = 0
    Label4.Left = Me.Width - Label4.Width
    Label5.Top = 0
    Label5.Left = 0
    selfchoose = False
    Dim n As Integer
    n = 0
    Dim content As String
    Dim jobname As String
    Open "..\NAMELIST\" + "userjob" + ".job" For Input As #11
       Do While Not EOF(11)
                Line Input #11, jobname
                jobbox.AddItem (jobname)
        Loop
    Close #11
    If Dir("..\NAMELIST\" + "namelist" + No.Text + ".txt", vbDirectory + vbSystem + vbHidden) = "" Then
        Open "..\NAMELIST\" + "namelist" + No.Text + ".txt" For Output As #15
        Close #15
        Debug.Print "..\NAMELIST\" + "namelist" + No.Text + ".txt"
    End If
    
    Open "..\NAMELIST\" + "namelist" + No.Text + ".txt" For Input As #3
        List1.Clear
        Do While Not EOF(3)
                Line Input #3, content
                content = Replace(content, vbCrLf, "")
                List1.AddItem (content)
        Loop
    Close #3
    
    Label4.Top = -50
    Label4.Left = Me.Width - Label4.Width - 100
End Sub

Private Sub Label4_Click()
    Label4.BackStyle = 0
    Label4.BackColor = vbRed
    Me.Visible = False
    Unload Me
End Sub

Private Sub Label4_MouseDown(Button As Integer, Shift As Integer, x As Single, y As Single)
    Label4.BackColor = vbRed
End Sub


Private Sub List1_Click()
    For ind = 0 To List1.ListCount - 1
        If List1.Selected(ind) Then
            List1.RemoveItem (ind)
        End If
    Next ind
End Sub

Private Sub List1_MouseUp(Button As Integer, Shift As Integer, x As Single, y As Single)
    Label4.BackColor = vbWhite
End Sub

Private Sub No_Change()
    change = True
End Sub


Public Sub ending()
End
End Sub
