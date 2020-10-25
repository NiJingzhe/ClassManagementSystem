VERSION 5.00
Begin VB.Form Form2 
   BorderStyle     =   0  'None
   Caption         =   "Form2"
   ClientHeight    =   4545
   ClientLeft      =   5220
   ClientTop       =   5100
   ClientWidth     =   6720
   DrawWidth       =   3
   LinkTopic       =   "Form2"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   4545
   ScaleWidth      =   6720
   ShowInTaskbar   =   0   'False
End
Attribute VB_Name = "Form2"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Declare Function GetWindowLong Lib "user32" Alias "GetWindowLongA" (ByVal hwnd As Long, ByVal nIndex As Long) As Long
Private Declare Function SetWindowLong Lib "user32" Alias "SetWindowLongA" (ByVal hwnd As Long, ByVal nIndex As Long, ByVal dwNewLong As Long) As Long
Private Declare Function SetLayeredWindowAttributes Lib "user32" (ByVal hwnd As Long, ByVal crKey As Long, ByVal bAlpha As Byte, ByVal dwFlags As Long) As Long
Private Const WS_EX_LAYERED = &H80000
Private Const GWL_EXSTYLE = (-20)
Private Const LWA_ALPHA = &H2
Private Const LWA_COLORKEY = &H1
Public down As Boolean
Public esr As Boolean
Public color As ColorConstants
Dim mx, my
Public h As Boolean
Public page As Integer

Private Sub Form_Load()
        page = 1
        Me.BackColor = &HFF0001
        Dim rtn As Long
        Dim BorderStyler
        BorderStyler = 0
        rtn = GetWindowLong(hwnd, GWL_EXSTYLE)
        rtn = rtn Or WS_EX_LAYERED
        SetWindowLong hwnd, GWL_EXSTYLE, rtn
        SetLayeredWindowAttributes hwnd, &HFF0001, 0, LWA_COLORKEY

        Me.Top = 0: Me.Left = 0
        Me.Height = Screen.Height
        Me.Width = Screen.Width
        down = False
        esr = False
        color = vbBlack
        h = False
End Sub

Private Sub Form_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
    down = True
    mx = X
    my = Y
End Sub

Private Sub Form_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
    If down And Not esr Then
        Form2.DrawWidth = 3
        Form2.Line (mx, my)-(X, Y), color
       ' Debug.Print X, Y
        mx = X: my = Y
       ' If mx > maxX Then maxX = mx
       ' If my > maxY Then maxY = my
    End If
    If down And esr Then
        Form2.DrawWidth = 25
        Form2.Line (mx, my)-(X, Y), &HFF0001
        mx = X: my = Y
    End If
End Sub

Private Sub Form_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
    down = False
End Sub

