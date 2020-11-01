VERSION 5.00
Begin VB.Form Form1 
   Appearance      =   0  'Flat
   BackColor       =   &H80000008&
   BorderStyle     =   0  'None
   Caption         =   "值日生表"
   ClientHeight    =   5865
   ClientLeft      =   15570
   ClientTop       =   5550
   ClientWidth     =   2835
   Icon            =   "值日生表.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   5865
   ScaleWidth      =   2835
   ShowInTaskbar   =   0   'False
   Begin VB.Timer pushinout 
      Enabled         =   0   'False
      Interval        =   20
      Left            =   1560
      Top             =   2760
   End
   Begin VB.Timer unloadanim 
      Enabled         =   0   'False
      Interval        =   20
      Left            =   720
      Top             =   4440
   End
   Begin VB.Timer animTimer 
      Enabled         =   0   'False
      Interval        =   20
      Left            =   1080
      Top             =   1200
   End
   Begin VB.TextBox Text1 
      Appearance      =   0  'Flat
      BackColor       =   &H00000000&
      ForeColor       =   &H00FFFFFF&
      Height          =   270
      Left            =   600
      TabIndex        =   8
      Top             =   0
      Width           =   255
   End
   Begin VB.VScrollBar VScroll1 
      Height          =   5415
      Left            =   2640
      TabIndex        =   1
      Top             =   360
      Width           =   255
   End
   Begin VB.Label Label3 
      BackStyle       =   0  'Transparent
      Caption         =   "Group"
      BeginProperty Font 
         Name            =   "微软雅黑"
         Size            =   9
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FFFFFF&
      Height          =   255
      Left            =   0
      TabIndex        =   7
      Top             =   0
      Width           =   615
   End
   Begin VB.Label Label2 
      BackStyle       =   0  'Transparent
      Caption         =   "值日生"
      BeginProperty Font 
         Name            =   "微软雅黑"
         Size            =   9
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FFFFFF&
      Height          =   255
      Left            =   840
      TabIndex        =   6
      Top             =   0
      Width           =   615
   End
   Begin VB.Label Command3 
      Alignment       =   2  'Center
      BackColor       =   &H00000000&
      Caption         =   "刷新表"
      BeginProperty Font 
         Name            =   "等线"
         Size            =   12
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FFFFFF&
      Height          =   375
      Left            =   480
      TabIndex        =   5
      Top             =   2040
      Width           =   1270
   End
   Begin VB.Label Command1 
      Alignment       =   2  'Center
      BackColor       =   &H00000000&
      Caption         =   "编辑表"
      BeginProperty Font 
         Name            =   "等线"
         Size            =   12
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FFFFFF&
      Height          =   375
      Left            =   600
      TabIndex        =   4
      Top             =   3480
      Width           =   1275
   End
   Begin VB.Label Command2 
      Alignment       =   2  'Center
      BackColor       =   &H00000000&
      Caption         =   ">"
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   14.25
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FFFFFF&
      Height          =   375
      Left            =   120
      TabIndex        =   3
      Top             =   5400
      Width           =   255
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
      Height          =   255
      Left            =   1800
      TabIndex        =   2
      Top             =   120
      Width           =   615
   End
   Begin VB.Label workname 
      Appearance      =   0  'Flat
      BackColor       =   &H80000008&
      Caption         =   "Namelist does not exsist"
      BeginProperty Font 
         Name            =   "等线"
         Size            =   10.5
         Charset         =   134
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000005&
      Height          =   615
      Index           =   0
      Left            =   0
      TabIndex        =   0
      Top             =   480
      Width           =   2655
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Dim state As Boolean
Dim n As Integer
Dim mintop As Integer
Dim alpha As Integer

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

Dim namearr() As String
Public gpn As String
Public maxgp As String
Dim nadd As Integer
Dim click As Boolean
Dim opendate As String
Dim cmpdate As String
Dim gn As String


Public Sub MoveForm(hwnd As Long)
DoEvents
ReleaseCapture
SendMessage hwnd, WM_NCLBUTTONDOWN, HTCAPTION, 0&
End Sub

Private Sub animTimer_Timer()
    If Abs(Me.Top - Screen.Width / 3) <= 1 Or alpha = 179 Then Debug.Print "finish": animTimer.Enabled = False
    alpha = alpha + (180 - alpha) * 0.3
    SetLayeredWindowAttributes hwnd, 0, alpha, LWA_ALPHA
    Me.Top = Me.Top - (Me.Top - Screen.Height / 3) * 0.5
    Debug.Print alpha
End Sub


Private Sub Form_MouseMove(Button As Integer, Shift As Integer, x As Single, y As Single)
    If Button = vbLeftButton Then MoveForm hwnd '如果按下鼠标左键就移动窗体
End Sub

Private Sub Command1_Click()
   ' Load Form2
   ' Form2.Show vbNormalFocus
   Debug.Print gn
   Unload Form2
   Load Form2
   Form2.Visible = True
   Form2.No.Text = Text1.Text
End Sub
Private Sub Command3_Click()
    Open "..\NAMELIST\grpNo.gpn" For Output As #20
        Print #20, gpn
    Close #20
    
    If Dir("..\NAMELIST\" + "namelist" + Text1.Text + ".txt", vbDirectory) = "" Then
        Unload Form2
        Load Form2
        Form2.Visible = True
        Form2.No.Text = Text1.Text
    Else
        Debug.Print "n is" + Str(n)
        nadd = 0
        Open "..\NAMELIST\" + "namelist" + gpn + ".txt" For Input As #1
            Do While Not EOF(1)
                    nadd = nadd + 1
                    ReDim Preserve namearr(nadd)
                    Line Input #1, namearr(nadd)
            Loop
        Close #1
        
        If nadd >= 0 Then
            
            If nadd >= n + 1 And n > 0 Then
                    With workname(0)
                        .Top = mintop
                        .Left = 0
                        .Caption = namearr(1)
                        .Width = Me.Width - VScroll1.Width
                        .Height = Me.Height / nadd
                        .FontSize = (12 - 0.1 * (nadd - 1)) * 2
                        .BackColor = vbBlack
                        .ForeColor = vbWhite
                    End With
                    Dim i
            
                    For i = 1 To n - 1
                        With workname(i)
                            .Height = Me.Height / nadd
                            .Enabled = True
                            .Visible = True
                            .Width = Me.Width - VScroll1.Width
                            .Top = (i) * workname(i).Height + mintop
                            .Left = 0
                            .Caption = namearr(i + 1)
                            .FontSize = (12 - 0.1 * (nadd - 1)) * 2
                            .BackColor = vbBlack
                            .ForeColor = vbWhite
                        End With
                    Next i
                    
                    For i = n To nadd - 1
                        Load workname(i)
                        With workname(i)
                            .Height = Me.Height / nadd
                            .Enabled = True
                            .Visible = True
                            .Width = Me.Width - VScroll1.Width
                            .Top = (i) * workname(i).Height + mintop
                            .Left = 0
                            .Caption = namearr(i + 1)
                            .FontSize = (12 - 0.1 * (nadd - 1)) * 2
                            .BackColor = vbBlack
                            .ForeColor = vbWhite
                        End With
                    Next i
            Else
                If nadd <> 0 Then
                    With workname(0)
                        .Top = mintop
                        .Left = 0
                        .Caption = namearr(1)
                        .Width = Me.Width - VScroll1.Width
                        .Height = Me.Height / (nadd)
                        .FontSize = (12 - 0.1 * (nadd - 1)) * 2
                        .BackColor = vbBlack
                        .ForeColor = vbWhite
                    End With
                    For i = 1 To nadd - 1
                        With workname(i)
                            .Height = Me.Height / (nadd)
                            .Enabled = True
                            .Visible = True
                            .Width = Me.Width - VScroll1.Width
                            .Top = (i) * workname(i).Height + mintop
                            .Left = 0
                            .Caption = namearr(i + 1)
                            .FontSize = (12 - 0.1 * (nadd - 1)) * 2
                            .BackColor = vbBlack
                            .ForeColor = vbWhite
                        End With
                    Next i
                    
                    For i = nadd To n - 1
                        Unload workname(i)
                    Next i
                End If
            End If
        End If
        n = nadd
    End If
End Sub

Private Sub pushinout_Timer()
    If Not state Then
        Command1.Top = Me.Height - Command2.Height
        Command3.Top = Me.Height - Command2.Height
        Command1.Left = Command1.Left - (Command1.Left - (-(Command1.Width + Command3.Width))) * 0.5
        Command3.Left = Command3.Left - (Command3.Left - (-Command3.Width)) * 0.5
        Command2.Left = Command2.Left - (Command2.Left - 0) * 0.5
        Command2.Caption = ">"
        If Command2.Left = 0 Then pushinout.Enabled = False: state = Not state
    Else
        Command1.Top = Me.Height - Command2.Height
        Command3.Top = Me.Height - Command2.Height
        Command1.Left = Command1.Left + (0 - Command1.Left) * 0.5
        Command3.Left = Command3.Left + (Command1.Width - Command3.Left) * 0.5
        Command2.Left = Command2.Left + (Command1.Width + Command3.Width - Command2.Left) * 0.5
        Command2.Caption = "<"
        If Command1.Left = 0 Then pushinout.Enabled = False: state = Not state
    End If
        
End Sub


Private Sub Command2_Click()
    pushinout.Enabled = True
End Sub

Private Sub Form_load()
    
    
    alpha = 0
    opendate = Format(Now, "yyyy-mm-dd")
    
    Open "..\NAMELIST\" + "opendate.opd" For Input As #12
        Line Input #12, cmpdate
    Close #12
    
    Open "..\NAMELIST\" + "maxgrp.gpn" For Input As #13
        Line Input #13, maxgp
    Close #13
    
    Open "..\NAMELIST\" + "grpNo.gpn" For Input As #10
        Line Input #10, gpn
    Close #10
    
    
    
    If opendate <> cmpdate Then
        If Val(gpn) = Val(maxgp) Then
            gpn = CStr(1)
        Else
            gpn = CStr(Val(gpn) + 1)
            Open "..\NAMELIST\" + "grpNo.gpn" For Output As #11
                Print #11, gpn
            Close #11
        End If
        
        Open "..\NAMELIST\" + "opendate.opd" For Output As #16
            Print #16, opendate
        Close #16
    End If
    
    Open "..\NAMELIST\" + "grpNo.gpn" For Input As #22
        Line Input #22, gpn
    Close #22
    
    Text1.Text = gpn
    
    Me.Top = Screen.Height
    animTimer.Enabled = True
    
    
    Dim rtn As Long
    Dim retValue As Long
    rtn = GetWindowLong(hwnd, GWL_EXSTYLE)
    rtn = rtn Or WS_EX_LAYERED
    SetWindowLong hwnd, GWL_EXSTYLE, rtn
    SetLayeredWindowAttributes hwnd, 0, alpha, LWA_ALPHA
        
    'retValue = SetWindowPos(Me.hwnd, HWND_TOPMOST, Me.CurrentX, Me.CurrentY, 300, 300, SWP_NOSIZE)
    
    state = True
    click = False
    mintop = Label1.Height * 1.5
    Me.Left = Screen.Width * 3 / 4
    'Me.Top = Screen.Height * 13 / 30
    Me.Width = Screen.Width / 8
    Me.Height = Screen.Height * 16 / 30
    Label3.Top = 0
    Label3.Left = 0
    Text1.Top = 0
    Text1.Left = Label3.Width
    Label2.Top = 0
    Label2.Left = Text1.Width + Label3.Width
    Label1.Width = Me.Width / 5
    Label1.Height = Label1.Width / 2
    Label1.Top = 0
    Label1.Left = Me.Width - Label1.Width
    VScroll1.Top = mintop
    VScroll1.Left = Me.Width - VScroll1.Width
    VScroll1.Height = Me.Height - 200
    Command2.Width = Me.Width / 6
    Command1.Width = Me.Width * 4 / 12
    Command3.Width = Me.Width * 4 / 12
    Command1.Left = 0 - Command3.Width - Command1.Width
    Command3.Left = -Command3.Width
    Command2.Left = 0
    Command1.Top = Me.Height - Command1.Height
    Command2.Top = Me.Height - Command2.Height
    Command3.Top = Me.Height - Command3.Height
    Dim i As Integer
    n = 0
    
    
    
    
    If Dir("..\NAMELIST\" + "namelist" + gpn + ".txt", vbDirectory + vbHidden + vbSystem) = "" Then '文件夹不存在
        Open "..\NAMELIST\" + "namelist" + gpn + ".txt" For Output As #4
        Close #4
        Form2.Show vbNormalFocus
    Else
    
        Open "..\NAMELIST\" + "namelist" + gpn + ".txt" For Input As #1
        Do While Not EOF(1)
                n = n + 1
                ReDim Preserve namearr(n)
                Line Input #1, namearr(n)
        Loop
        Close #1
    End If
    If n > 0 Then
        With workname(0)
            .Top = mintop
            .Left = 0
            .Caption = namearr(1)
            .Width = Me.Width - VScroll1.Width
            .Height = Me.Height / n
            .FontSize = (12 - 0.1 * (n - 1)) * 2
            .BackColor = vbBlack
            .ForeColor = vbWhite
        End With
    
        For i = 1 To n - 1
            Load workname(i)
            With workname(i)
                .Height = Me.Height / n
                .Enabled = True
                .Visible = True
                .Width = Me.Width - VScroll1.Width
                .Top = (i) * workname(i).Height + mintop
                .Left = 0
                .Caption = namearr(i + 1)
                .FontSize = (12 - 0.1 * (n - 1)) * 2
                .BackColor = vbBlack
                .ForeColor = vbWhite
            End With
        Next i
    End If
    
    state = True
    'Debug.Print "namelist" + Str(Weekday(Now)) + ".txt"
    
End Sub

Private Sub Label1_Click()
    animTimer.Enabled = False
    unloadanim.Enabled = True
    Label1.BackColor = vbRed
End Sub

Private Sub Label1_MouseDown(Button As Integer, Shift As Integer, x As Single, y As Single)
    Label1.BackColor = vbRed
End Sub


Private Sub Label1_MouseUp(Button As Integer, Shift As Integer, x As Single, y As Single)
    Label1.BackColor = vbBlack
End Sub


Private Sub Text1_Change()
    gpn = Text1.Text
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

'Private Sub MoveBar_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
'    click = True
'    relat_posx = X - Me.Left
'    relat_posy = Y - Me.Top
'    Debug.Print Str(relat_posx) + " " + Str(relat_posy)
'End Sub

'Private Sub MoveBar_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
'    If click = True Then
'        Me.Top = Y * 0.6 - relat_posy
'        Me.Left = X * 0.6 - relat_posx
'        Debug.Print "Me: " + Str(Me.Left) + " " + Str(Me.Top)
'    End If
'End Sub

'Private Sub MoveBar_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
'    click = False
'End Sub

Private Sub VScroll1_Scroll()
    Dim i As Integer
    For i = 0 To workname.ubound
        workname(i).Top = -VScroll1.Value * (0.5 / workname.Count) + i * workname(i).Height + mintop
    Next i
End Sub

