VERSION 5.00
Begin VB.Form Form1 
   Appearance      =   0  'Flat
   BackColor       =   &H80000005&
   Caption         =   "»­°å"
   ClientHeight    =   7530
   ClientLeft      =   8025
   ClientTop       =   3825
   ClientWidth     =   7875
   DrawStyle       =   6  'Inside Solid
   LinkTopic       =   "Form1"
   ScaleHeight     =   7530
   ScaleWidth      =   7875
   Begin VB.PictureBox Picture1 
      Appearance      =   0  'Flat
      AutoRedraw      =   -1  'True
      BackColor       =   &H80000005&
      BorderStyle     =   0  'None
      DrawWidth       =   50
      ForeColor       =   &H80000008&
      Height          =   8000
      IMEMode         =   2  'OFF
      Left            =   0
      ScaleHeight     =   7995
      ScaleWidth      =   7995
      TabIndex        =   0
      Top             =   0
      Width           =   8000
      Begin VB.Timer Timer1 
         Interval        =   10
         Left            =   3600
         Top             =   2280
      End
      Begin VB.CommandButton Command3 
         Appearance      =   0  'Flat
         BackColor       =   &H00FF00FF&
         Height          =   500
         Index           =   4
         Left            =   5400
         MaskColor       =   &H00FF0000&
         Style           =   1  'Graphical
         TabIndex        =   7
         Top             =   0
         Width           =   500
      End
      Begin VB.CommandButton Command3 
         Appearance      =   0  'Flat
         BackColor       =   &H00000000&
         Height          =   500
         Index           =   3
         Left            =   5880
         MaskColor       =   &H00FF0000&
         Style           =   1  'Graphical
         TabIndex        =   6
         Top             =   0
         Width           =   500
      End
      Begin VB.CommandButton Command3 
         Appearance      =   0  'Flat
         BackColor       =   &H0000FF00&
         Height          =   500
         Index           =   2
         Left            =   6360
         MaskColor       =   &H00FF0000&
         Style           =   1  'Graphical
         TabIndex        =   5
         Top             =   0
         Width           =   500
      End
      Begin VB.CommandButton Command3 
         Appearance      =   0  'Flat
         BackColor       =   &H00FF0000&
         Height          =   500
         Index           =   0
         Left            =   7320
         MaskColor       =   &H00FF0000&
         Style           =   1  'Graphical
         TabIndex        =   4
         Top             =   0
         Width           =   500
      End
      Begin VB.CommandButton Command3 
         Appearance      =   0  'Flat
         BackColor       =   &H000000FF&
         Height          =   500
         Index           =   1
         Left            =   6840
         MaskColor       =   &H00FF0000&
         Style           =   1  'Graphical
         TabIndex        =   3
         Top             =   0
         Width           =   500
      End
      Begin VB.CommandButton Command1 
         Appearance      =   0  'Flat
         Caption         =   "ÏðÆ¤"
         Height          =   735
         Left            =   1080
         TabIndex        =   1
         Top             =   0
         Width           =   1095
      End
      Begin VB.CommandButton Command2 
         Appearance      =   0  'Flat
         Caption         =   "±£´æ"
         Height          =   735
         Left            =   0
         Style           =   1  'Graphical
         TabIndex        =   2
         Top             =   0
         Width           =   1095
      End
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim down As Boolean
Dim mx As Single, my As Single
Dim col As Long, c As String
Dim esr As Boolean
Dim pa As String
'Dim maxX, maxY As Single

Private Sub Command3_Click(Index As Integer)
        col = Command3(Index).BackColor
End Sub


Private Sub Form_Load()
    maxX = 0: maxY = 0
    down = False
    esr = False
    Me.Width = Screen.Height / 2.5
    Me.Height = Me.Width
    Picture1.Width = Me.Width
    Picture1.Height = Me.Height
    Picture1.FillStyle = 0
    Picture1.FillColor = RGB(255, 255, 255)
    Picture1.DrawWidth = Picture1.Width / 250
    Command1.Height = Picture1.Height / 8
    Command1.Width = Command1.Height
    Command1.Top = 0
    Command1.Left = 0
    Command2.Height = Picture1.Height / 8
    Command2.Width = Command2.Height
    Command2.Top = 0
    Command2.Left = Command1.Width
    Dim i As Integer
    For i = 0 To 4
        Command3(i).Left = Screen.Height / 2.5 - (i + 1) * Command3(i).Width - 200
        Command3(i).Top = 0
    Next i
   
    'Debug.Print col
End Sub


Private Sub Command1_Click()
    esr = Not esr
    If esr Then Command1.Caption = "»­±Ê"
    If Not esr Then Command1.Caption = "ÏðÆ¤"
End Sub



Private Sub Command2_Click()
    Open "..\HOMEWORKB\name.hkn" For Input As #1
        Line Input #1, pa
    Close #1
  '  Open "..\HOMEWORKB\history\" + pa + ".bmp" For Output As #2
  '  Close #2
    If Dir(App.Path + "\history\", vbDirectory) = "" Then
        MkDir (App.Path + "\history\")
    End If
    SavePicture Picture1.Image, "..\HOMEWORKB\history\" + pa + ".bmp"
End Sub

Private Sub Picture1_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
    down = True
    mx = X
    my = Y
End Sub

Private Sub Picture1_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
    If down And Not esr Then
        Picture1.DrawWidth = Picture1.Width / 1500
        Picture1.Line (mx, my)-(X, Y), col
       ' Debug.Print X, Y
        mx = X: my = Y
       ' If mx > maxX Then maxX = mx
       ' If my > maxY Then maxY = my
    End If
    If down And esr Then
        Picture1.Circle (X, Y), Picture1.DrawWidth * 0.5, RGB(255, 255, 255)
    End If
End Sub

Private Sub Picture1_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
    down = False
End Sub


Private Sub Timer1_Timer()
    Picture1.Width = Me.Width
    Picture1.Height = Me.Height
    Picture1.FillStyle = 0
    Picture1.FillColor = RGB(255, 255, 255)
    Picture1.DrawWidth = Picture1.Width / 100
    Dim i As Integer
    For i = 0 To 4
        Command3(i).Left = Me.Width - (i + 1) * Command3(i).Width - 200
        Command3(i).Top = 0
    Next i
End Sub
