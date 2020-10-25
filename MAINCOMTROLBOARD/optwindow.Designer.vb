<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()>
Partial Class optwindow
    Inherits System.Windows.Forms.Form

    'Form 重写 Dispose，以清理组件列表。
    <System.Diagnostics.DebuggerNonUserCode()>
    Protected Overrides Sub Dispose(ByVal disposing As Boolean)
        Try
            If disposing AndAlso components IsNot Nothing Then
                components.Dispose()
            End If
        Finally
            MyBase.Dispose(disposing)
        End Try
    End Sub

    'Windows 窗体设计器所必需的
    Private components As System.ComponentModel.IContainer

    '注意: 以下过程是 Windows 窗体设计器所必需的
    '可以使用 Windows 窗体设计器修改它。  
    '不要使用代码编辑器修改它。
    <System.Diagnostics.DebuggerStepThrough()>
    Private Sub InitializeComponent()
        Dim resources As System.ComponentModel.ComponentResourceManager = New System.ComponentModel.ComponentResourceManager(GetType(optwindow))
        Me.Panel3 = New System.Windows.Forms.Panel()
        Me.Button3 = New System.Windows.Forms.Button()
        Me.pathbox2 = New System.Windows.Forms.TextBox()
        Me.Label2 = New System.Windows.Forms.Label()
        Me.Button2 = New System.Windows.Forms.Button()
        Me.Button1 = New System.Windows.Forms.Button()
        Me.icobox = New System.Windows.Forms.TextBox()
        Me.pathbox = New System.Windows.Forms.TextBox()
        Me.Label1 = New System.Windows.Forms.Label()
        Me.Panel3.SuspendLayout()
        Me.SuspendLayout()
        '
        'Panel3
        '
        Me.Panel3.BackColor = System.Drawing.Color.Transparent
        Me.Panel3.Controls.Add(Me.Button3)
        Me.Panel3.Controls.Add(Me.pathbox2)
        Me.Panel3.Controls.Add(Me.Label2)
        Me.Panel3.Controls.Add(Me.Button2)
        Me.Panel3.Controls.Add(Me.Button1)
        Me.Panel3.Controls.Add(Me.icobox)
        Me.Panel3.Controls.Add(Me.pathbox)
        Me.Panel3.Controls.Add(Me.Label1)
        Me.Panel3.Dock = System.Windows.Forms.DockStyle.Fill
        Me.Panel3.Location = New System.Drawing.Point(0, 0)
        Me.Panel3.Name = "Panel3"
        Me.Panel3.Size = New System.Drawing.Size(840, 149)
        Me.Panel3.TabIndex = 1
        '
        'Button3
        '
        Me.Button3.Location = New System.Drawing.Point(18, 107)
        Me.Button3.Name = "Button3"
        Me.Button3.Size = New System.Drawing.Size(224, 30)
        Me.Button3.TabIndex = 9
        Me.Button3.Text = "退出程序"
        Me.Button3.UseVisualStyleBackColor = True
        '
        'pathbox2
        '
        Me.pathbox2.AcceptsTab = True
        Me.pathbox2.ImeMode = System.Windows.Forms.ImeMode.[On]
        Me.pathbox2.Location = New System.Drawing.Point(248, 57)
        Me.pathbox2.Name = "pathbox2"
        Me.pathbox2.Size = New System.Drawing.Size(394, 25)
        Me.pathbox2.TabIndex = 8
        Me.pathbox2.Text = "请输入路径"
        '
        'Label2
        '
        Me.Label2.AutoSize = True
        Me.Label2.Font = New System.Drawing.Font("微软雅黑", 13.8!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(134, Byte))
        Me.Label2.Location = New System.Drawing.Point(12, 51)
        Me.Label2.Name = "Label2"
        Me.Label2.Size = New System.Drawing.Size(230, 31)
        Me.Label2.TabIndex = 7
        Me.Label2.Text = "添加随程序启动功能"
        '
        'Button2
        '
        Me.Button2.Location = New System.Drawing.Point(648, 51)
        Me.Button2.Name = "Button2"
        Me.Button2.Size = New System.Drawing.Size(180, 33)
        Me.Button2.TabIndex = 6
        Me.Button2.Text = "添加到随程序启动"
        Me.Button2.UseVisualStyleBackColor = True
        '
        'Button1
        '
        Me.Button1.Location = New System.Drawing.Point(648, 9)
        Me.Button1.Name = "Button1"
        Me.Button1.Size = New System.Drawing.Size(180, 33)
        Me.Button1.TabIndex = 5
        Me.Button1.Text = "添加到面板"
        Me.Button1.UseVisualStyleBackColor = True
        '
        'icobox
        '
        Me.icobox.AcceptsTab = True
        Me.icobox.AllowDrop = True
        Me.icobox.ImeMode = System.Windows.Forms.ImeMode.[On]
        Me.icobox.Location = New System.Drawing.Point(452, 12)
        Me.icobox.Name = "icobox"
        Me.icobox.Size = New System.Drawing.Size(190, 25)
        Me.icobox.TabIndex = 2
        Me.icobox.Text = "图标名称(确保放入ico/下)"
        '
        'pathbox
        '
        Me.pathbox.AcceptsTab = True
        Me.pathbox.ImeMode = System.Windows.Forms.ImeMode.[On]
        Me.pathbox.Location = New System.Drawing.Point(128, 12)
        Me.pathbox.Name = "pathbox"
        Me.pathbox.Size = New System.Drawing.Size(318, 25)
        Me.pathbox.TabIndex = 1
        Me.pathbox.Text = "请输入路径"
        '
        'Label1
        '
        Me.Label1.AutoSize = True
        Me.Label1.Font = New System.Drawing.Font("微软雅黑", 13.8!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(134, Byte))
        Me.Label1.Location = New System.Drawing.Point(12, 9)
        Me.Label1.Name = "Label1"
        Me.Label1.Size = New System.Drawing.Size(110, 31)
        Me.Label1.TabIndex = 0
        Me.Label1.Text = "添加功能"
        '
        'optwindow
        '
        Me.AutoScaleDimensions = New System.Drawing.SizeF(8.0!, 15.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        Me.BackColor = System.Drawing.Color.White
        Me.ClientSize = New System.Drawing.Size(840, 149)
        Me.Controls.Add(Me.Panel3)
        Me.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedSingle
        Me.Icon = CType(resources.GetObject("$this.Icon"), System.Drawing.Icon)
        Me.Name = "optwindow"
        Me.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen
        Me.Text = "设置"
        Me.Panel3.ResumeLayout(False)
        Me.Panel3.PerformLayout()
        Me.ResumeLayout(False)

    End Sub
    Friend WithEvents Panel3 As Panel
    Friend WithEvents Button1 As Button
    Friend WithEvents icobox As TextBox
    Friend WithEvents pathbox As TextBox
    Friend WithEvents Label1 As Label
    Friend WithEvents Button2 As Button
    Friend WithEvents Button3 As Button
    Friend WithEvents pathbox2 As TextBox
    Friend WithEvents Label2 As Label
End Class
