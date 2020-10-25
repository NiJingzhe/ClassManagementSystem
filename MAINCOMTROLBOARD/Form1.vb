Public Class Form1

    Dim t As Integer
    'Dim r, g, b As Int32

    Private Sub Timer1_Tick(sender As Object, e As EventArgs) Handles Timer1.Tick
        t = t + 1
        If t = 3 Then
            Timer2.Enabled = True
            ' MainControlBoard.Show()
            'Me.Close()
            Timer1.Enabled = False
        End If
        'Debug.Print(al)
    End Sub

    Private Sub Form1_Load(sender As Object, e As EventArgs) Handles MyBase.Load
        t = 0
        Label7.Left = Me.Width / 2 - Label7.Width / 2 + 10
    End Sub

    Private Sub Timer2_Tick(sender As Object, e As EventArgs) Handles Timer2.Tick
        If Me.Top < Screen.PrimaryScreen.WorkingArea.Height Then
            Me.Left = (Screen.PrimaryScreen.WorkingArea.Width - Me.Width) / 2
            Me.Top = Me.Top + 80
            Me.Width = Me.Width - 8
            Label7.Left = (Me.Width - Label7.Width) / 2
        Else
            MainControlBoard.Show()
            Me.Close()
        End If
    End Sub
End Class
