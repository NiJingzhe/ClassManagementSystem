VERSION 5.00
Begin VB.Form Form2 
   Caption         =   "Form2"
   ClientHeight    =   1185
   ClientLeft      =   18570
   ClientTop       =   9195
   ClientWidth     =   3285
   LinkTopic       =   "Form2"
   ScaleHeight     =   1185
   ScaleWidth      =   3285
   Begin VB.TextBox cn 
      Height          =   270
      Left            =   480
      TabIndex        =   4
      Top             =   360
      Width           =   855
   End
   Begin VB.CommandButton Command1 
      Caption         =   "确定"
      Height          =   375
      Left            =   120
      TabIndex        =   3
      Top             =   720
      Width           =   3015
   End
   Begin VB.ComboBox CC 
      Appearance      =   0  'Flat
      Height          =   300
      ItemData        =   "Form2.frx":0000
      Left            =   2160
      List            =   "Form2.frx":0037
      TabIndex        =   2
      Top             =   360
      Width           =   975
   End
   Begin VB.Label Label2 
      Caption         =   "节课换为"
      Height          =   255
      Left            =   1440
      TabIndex        =   1
      Top             =   360
      Width           =   855
   End
   Begin VB.Label Label1 
      Caption         =   "将第"
      Height          =   375
      Left            =   120
      TabIndex        =   0
      Top             =   360
      Width           =   1095
   End
End
Attribute VB_Name = "Form2"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False


Private Sub Command1_Click()
    Dim num, name
    num = Val(cn.Text) - 1
    name = CC.Text
    Form1.class(num).Caption = name
    Form1.Label3.BackColor = vbBlack
    Unload Me
End Sub

