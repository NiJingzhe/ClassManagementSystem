VERSION 5.00
Begin VB.Form Form1 
   Appearance      =   0  'Flat
   BackColor       =   &H00000000&
   BorderStyle     =   0  'None
   Caption         =   "Form1"
   ClientHeight    =   6570
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   10035
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   6570
   ScaleWidth      =   10035
   ShowInTaskbar   =   0   'False
   StartUpPosition =   3  '窗口缺省
   Begin VB.Timer Timer3 
      Enabled         =   0   'False
      Interval        =   20
      Left            =   1440
      Top             =   3840
   End
   Begin VB.Timer Timer2 
      Enabled         =   0   'False
      Interval        =   20
      Left            =   4320
      Top             =   2760
   End
   Begin VB.Timer Timer1 
      Interval        =   100
      Left            =   840
      Top             =   2520
   End
   Begin VB.Label Label3 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      AutoSize        =   -1  'True
      BackColor       =   &H80000005&
      BackStyle       =   0  'Transparent
      Caption         =   "×"
      BeginProperty Font 
         Name            =   "等线"
         Size            =   18
         Charset         =   134
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FFFFFF&
      Height          =   375
      Left            =   4845
      TabIndex        =   2
      Top             =   5880
      Width           =   285
   End
   Begin VB.Label Label2 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      AutoSize        =   -1  'True
      BackColor       =   &H80000005&
      BackStyle       =   0  'Transparent
      Caption         =   "class"
      BeginProperty Font 
         Name            =   "等线"
         Size            =   21.75
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00808080&
      Height          =   450
      Left            =   4245
      TabIndex        =   1
      Top             =   1560
      Width           =   885
   End
   Begin VB.Label Label1 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      AutoSize        =   -1  'True
      BackColor       =   &H80000005&
      BackStyle       =   0  'Transparent
      Caption         =   "Time"
      BeginProperty Font 
         Name            =   "等线 Light"
         Size            =   36
         Charset         =   134
         Weight          =   300
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FFFFFF&
      Height          =   750
      Left            =   3975
      TabIndex        =   0
      Top             =   600
      Width           =   1485
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Form_Load()
Me.Height = Screen.Height
Me.Width = Screen.Width
Me.Left = 0
Me.Top = -Me.Height
Dim str As String
Open App.Path + "\CLASSNAME.txt" For Input As #1
    Input #1, str
Close #1
Dim num As Integer
num = Weekday(Now, vbMonday)
Label2.Caption = "下午第一节是" + Split(str, "，")(num - 1) + "课"
'Debug.Print num
Label1.Left = (Me.Width - Label1.Width) / 2
Label2.Left = (Me.Width - Label2.Width) / 2
Label3.Left = (Me.Width - Label3.Width) / 2
Label1.Top = Me.Height / 10
Label2.Top = Label1.Top + Label1.Height
Label3.Top = Me.Height * 13 / 14
Timer2.Enabled = True
End Sub

Private Sub Label1_Click()
Form2.Show vbNormalFocus
End Sub

Private Sub Label3_Click()
Timer3.Enabled = True
End Sub

Private Sub Timer1_Timer()
Label1.Caption = Format(Now, "hh:mm:ss")
End Sub

Private Sub Timer2_Timer()
If Me.Top = 0 Then Debug.Print "finish": Timer2.Enabled = False
Me.Top = Me.Top + (0 - Me.Top) * 0.5
End Sub

Private Sub Timer3_Timer()
If Me.Top = -Me.Height Then End
Me.Top = Me.Top - (Me.Top + Me.Height) * 0.5
End Sub
