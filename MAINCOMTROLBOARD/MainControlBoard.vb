Public Class MainControlBoard

    'CLICK EVENT
    Dim mx, my As Integer
    Dim patharr As String() = System.IO.File.ReadAllLines(Application.StartupPath + "\Path.pa")
    Dim startup As String() = System.IO.File.ReadAllLines(Application.StartupPath + "\startup.pa")
    Dim exec_ico() As String
    Public proc_pid As New ArrayList
    Public startup_pid As New ArrayList
    Dim buttonlist As New ArrayList
    Dim delay As Integer
    Dim window As optwindow



    Private Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        window = New optwindow()
        window.Show()
    End Sub


    Private Sub ButtonlistClick(ByVal sender As Object, ByVal e As EventArgs)
        Dim index As Integer
        index = buttonlist.IndexOf(CType(sender, Button))
        proc_pid.Add(Process.Start(patharr(index).Split(",")(0)).Id)
    End Sub

    'FORM EVENT
    Private Sub MainControlBoard_Load(sender As Object, e As EventArgs) Handles MyBase.Load

        Dim i As Integer


        delay = 0
        funbtnpanel.Left = 0 + Button1.Width + 10 + Button1.Left
        For i = 1 To patharr.Length
            exec_ico = patharr(i - 1).ToString.Split(",")
            Dim funbtn As Button = New Button
            With funbtn
                .Parent = funbtnpanel
                .Left = (i - 1) * (Button1.Width + 5)
                .Top = 0
                .Image = System.Drawing.Image.FromFile(".\ico\" + exec_ico(1))
                .Height = funbtnpanel.Height
                .Width = Button1.Width

            End With
            funbtnpanel.Controls.Add(funbtn)
            buttonlist.Add(funbtn)
            AddHandler funbtn.Click, AddressOf ButtonlistClick
        Next i
        funbtnpanel.Width = (i) * (Button1.Width + 5)
        Me.Width = (Button1.Width + 5) * i + Button1.Left + 10
        Me.Left = Screen.PrimaryScreen.WorkingArea.Width / 2 - Me.Width / 2
        Me.Top = Screen.PrimaryScreen.Bounds.Height - Me.Height

        'Dim i As Integer = 0
        'Debug.Print(patharr.Length)

        If startup.Length = 0 Then
            Return
        End If

        For i = 0 To startup.Length - 1
            startup_pid.Add(Process.Start(startup(i)).Id)
        Next i

    End Sub

    'Private Sub Timer1_Tick(sender As Object, e As EventArgs) Handles Timer1.Tick
    '    If MousePosition.X >= Me.Left And MousePosition.X <= Me.Left + Me.Width And MousePosition.Y >= Me.Top And MousePosition.Y <= Me.Top + Me.Height Then
    '        While Me.Top < -2
    '            Me.Top += 1
    '        End While
    '    Else
    '        While Me.Top > 0 - Me.Height * 19 / 20
    '            Me.Top -= 1
    '        End While
    '    End If
    'End Sub


    Private Sub funbtnpanel_Paint(sender As Object, e As PaintEventArgs) Handles funbtnpanel.Paint

    End Sub

    Private Sub Timer1_Tick(sender As Object, e As EventArgs) Handles Timer1.Tick
        mx = MousePosition.X
        my = MousePosition.Y
        If (mx <= Me.Location.X + Me.Width And mx >= Me.Location.X) And (my <= Me.Location.Y + Me.Height And my >= Me.Location.Y) Then
            While Me.Top > Screen.PrimaryScreen.Bounds.Height - Me.Height
                Me.Top -= 1
            End While
        Else
            While Me.Top < Screen.PrimaryScreen.Bounds.Height - Me.Height * 1 / 20
                Me.Top += 1
            End While
        End If
    End Sub
End Class