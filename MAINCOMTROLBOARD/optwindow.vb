Imports System.IO

Public Class optwindow

    Private Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        File.AppendAllText(Application.StartupPath + "\path.pa", pathbox.Text + "," + icobox.Text + vbCrLf)
        pathbox.Text = "添加成功,重启程序生效"
    End Sub

    Private Sub Button2_Click(sender As Object, e As EventArgs) Handles Button2.Click

        File.AppendAllText(Application.StartupPath + "\startup.pa", pathbox2.Text + vbCrLf)

        pathbox2.Text = "添加成功,重启程序生效"
    End Sub

    Private Sub Button3_Click(sender As Object, e As EventArgs) Handles Button3.Click
        Dim proc
        For Each proc In MainControlBoard.startup_pid
            Process.GetProcessById(proc).Kill()
        Next
        System.Threading.Thread.Sleep(500)
        Me.Close()
        MainControlBoard.Close()
    End Sub

End Class
