Imports System.Data.OleDb
Public Class Form1
    Public conn As New OleDbConnection
    Dim selcmd As OleDbCommand
    Dim da As OleDbDataAdapter
    Dim ds As New DataSet()
    Dim dr As OleDbDataReader
    Dim con As OleDbConnection
    Dim d As OleDbDataReader
    Dim deptcmd As OleDbCommand
    Dim selCir As String
    Dim finStr As String
    Dim sv, i, j As Integer
    Public Function RandomNumber(ByVal MaxValue As Long, Optional _
    ByVal MinValue As Long = 0)
        On Error Resume Next
        RandomNumber = Int((MaxValue - MinValue + 1) * Rnd()) + MinValue
    End Function
    Private Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        'MsgBox(selCir)
        'MsgBox(finStr)
        Dim qry As String
        Dim serList As New ArrayList
        qry = "select ser from mb_ser where " & finStr
        conn.ConnectionString = ("Provider=SQLOLEDB;Data Source=DESKTOP-85IC66R\SQLEXPRESS;Initial Catalog=TestMv;Persist Security Info=True;User ID=sa;Password=7787")
        'If conn.State = 1 Then conn.Close()
        conn.Open()
        sv = 0
        selcmd = New OleDbCommand(qry, conn)
        da = New OleDbDataAdapter
        da.SelectCommand = selcmd
        da.Fill(ds)
        Dim i As Integer
        For i = 0 To ds.Tables(0).Rows.Count - 1
            serList.Add(ds.Tables(0).Rows(i)(0))
        Next
        'con.Close()
        Dim num As Integer
        For Each num In serList
            Dim k As String
            i = 0
            j = Val(TxtCCount.Text)
            Do While i < j
                k = RandomNumber(999999, 000001).ToString
                If (k.Length = 6) Then
                    i += 1
                    RichTextBox1.Text = RichTextBox1.Text & "BEGIN:VCARD" & vbCrLf & "BEGIN:VCARD" & vbCrLf &
                    "VERSION:3.0" & vbCrLf & "FN:" & TxtDName.Text & i & vbCrLf & "N:;" & TxtDName.Text & i & ";;;" &
                    vbCrLf & "TEL;TYPE=CELL:" & num.ToString & k & "End:VCARD"
                    'Dim file As System.IO.StreamWriter
                    'file = My.Computer.FileSystem.OpenTextFileWriter("c:\test.vcf", True)
                    'file.WriteLine("BEGIN:VCARD")
                    'file.WriteLine("VERSION:3.0")
                    'file.WriteLine("FN:" & TxtDName.Text & i)
                    'file.WriteLine("N:;" & TxtDName.Text & i & ";;;")
                    'file.WriteLine("TEL;TYPE=CELL:" & num.ToString & k)
                    'file.WriteLine("End:VCARD")
                    'file.Close()
                    sv += 1
                End If
            Loop
        Next
        Label1.Text = "SV: " & sv


    End Sub

    Private Sub Form1_Load(sender As Object, e As EventArgs) Handles MyBase.Load
        CboCir.SelectedIndex = 0
        finStr = "N"
    End Sub
    Private Sub PictureBox1_Click(sender As Object, e As EventArgs) Handles PictureBox1.Click
        If (chkAirtel.Checked = True) Then
            chkAirtel.Checked = False
        Else
            chkAirtel.Checked = True
        End If
    End Sub

    Private Sub PictureBox2_Click(sender As Object, e As EventArgs) Handles PictureBox2.Click
        If (ChkBsnl.Checked = True) Then
            ChkBsnl.Checked = False
        Else
            ChkBsnl.Checked = True
        End If
    End Sub

    Private Sub PictureBox4_Click(sender As Object, e As EventArgs) Handles PictureBox4.Click
        If (ChkIdea.Checked = True) Then
            ChkIdea.Checked = False
        Else
            ChkIdea.Checked = True
        End If
    End Sub

    Private Sub PictureBox3_Click(sender As Object, e As EventArgs) Handles PictureBox3.Click
        If (ChkDocomo.Checked = True) Then
            ChkDocomo.Checked = False
        Else
            ChkDocomo.Checked = True
        End If
    End Sub

    Private Sub PictureBox10_Click(sender As Object, e As EventArgs) Handles PictureBox10.Click
        If (ChkMtnl.Checked = True) Then
            ChkMtnl.Checked = False
        Else
            ChkMtnl.Checked = True
        End If
    End Sub

    Private Sub PictureBox5_Click(sender As Object, e As EventArgs) Handles PictureBox5.Click
        If (ChkT24.Checked = True) Then
            ChkT24.Checked = False
        Else
            ChkT24.Checked = True
        End If
    End Sub

    Private Sub PictureBox6_Click(sender As Object, e As EventArgs) Handles PictureBox6.Click
        If (ChkJio.Checked = True) Then
            ChkJio.Checked = False
        Else
            ChkJio.Checked = True
        End If
    End Sub

    Private Sub PictureBox7_Click(sender As Object, e As EventArgs) Handles PictureBox7.Click
        If (ChkVodafone.Checked = True) Then
            ChkVodafone.Checked = False
        Else
            ChkVodafone.Checked = True
        End If
    End Sub

    Private Sub PictureBox8_Click(sender As Object, e As EventArgs) Handles PictureBox8.Click
        If (ChkUninor.Checked = True) Then
            ChkUninor.Checked = False
        Else
            ChkUninor.Checked = True
        End If
    End Sub

    Private Sub CboCir_SelectedIndexChanged(sender As Object, e As EventArgs) Handles CboCir.SelectedIndexChanged
        If (CboCir.SelectedIndex = 0) Then
            selCir = "AP"
        ElseIf (CboCir.SelectedIndex = 1) Then
            selCir = "AS"
        ElseIf (CboCir.SelectedIndex = 2) Then
            selCir = "BR"
        ElseIf (CboCir.SelectedIndex = 3) Then
            selCir = "CH"
        ElseIf (CboCir.SelectedIndex = 4) Then
            selCir = "DL"
        ElseIf (CboCir.SelectedIndex = 5) Then
            selCir = "GJ"
        ElseIf (CboCir.SelectedIndex = 6) Then
            selCir = "HP"
        ElseIf (CboCir.SelectedIndex = 7) Then
            selCir = "HR"
        ElseIf (CboCir.SelectedIndex = 8) Then
            selCir = "JK"
        ElseIf (CboCir.SelectedIndex = 9) Then
            selCir = "KL"
        ElseIf (CboCir.SelectedIndex = 10) Then
            selCir = "KA"
        ElseIf (CboCir.SelectedIndex = 11) Then
            selCir = "KO"
        ElseIf (CboCir.SelectedIndex = 12) Then
            selCir = "MH"
        ElseIf (CboCir.SelectedIndex = 13) Then
            selCir = "MP"
        ElseIf (CboCir.SelectedIndex = 14) Then
            selCir = "MU"
        ElseIf (CboCir.SelectedIndex = 15) Then
            selCir = "NE"
        ElseIf (CboCir.SelectedIndex = 16) Then
            selCir = "OR"
        ElseIf (CboCir.SelectedIndex = 17) Then
            selCir = "PB"
        ElseIf (CboCir.SelectedIndex = 18) Then
            selCir = "RJ"
        ElseIf (CboCir.SelectedIndex = 19) Then
            selCir = "TN"
        ElseIf (CboCir.SelectedIndex = 20) Then
            selCir = "UE"
        ElseIf (CboCir.SelectedIndex = 21) Then
            selCir = "UW"
        ElseIf (CboCir.SelectedIndex = 22) Then
            selCir = "WB"
        End If
    End Sub
    Private Sub ChkT24_CheckStateChanged(sender As Object, e As EventArgs) Handles ChkT24.CheckStateChanged
        If (finStr = "N") Then
            finStr = " scd='" & selCir & "' and nw='T24' "
        Else
            finStr = finStr & " or scd='" & selCir & "' and  nw='24' "
        End If
    End Sub

    Private Sub ChkJio_CheckStateChanged(sender As Object, e As EventArgs) Handles ChkJio.CheckStateChanged
        If (finStr = "N") Then
            finStr = " scd='" & selCir & "' and nw='RJ' "
        Else
            finStr = finStr & " or scd='" & selCir & "' and nw='RJ' "
        End If
    End Sub

    Private Sub ChkVodafone_CheckStateChanged(sender As Object, e As EventArgs) Handles ChkVodafone.CheckStateChanged
        If (finStr = "N") Then
            finStr = " scd='" & selCir & "' and nw='VF' "
        Else
            finStr = finStr & " or scd='" & selCir & "' and nw='VF' "
        End If
    End Sub

    Private Sub ChkUninor_CheckStateChanged(sender As Object, e As EventArgs) Handles ChkUninor.CheckStateChanged
        If (finStr = "N") Then
            finStr = " scd='" & selCir & "' and nw='TN' "
        Else
            finStr = finStr & " or scd='" & selCir & "' and nw='TN' "
        End If
    End Sub

    Private Sub ChkMtnl_CheckStateChanged(sender As Object, e As EventArgs) Handles ChkMtnl.CheckStateChanged
        If (finStr = "N") Then
            finStr = " scd='" & selCir & "' and nw='DP' "
        Else
            finStr = finStr & " or scd='" & selCir & "' and nw='DP' "
        End If
    End Sub

    Private Sub ChkDocomo_CheckStateChanged(sender As Object, e As EventArgs) Handles ChkDocomo.CheckStateChanged
        If (finStr = "N") Then
            finStr = " scd='" & selCir & "' and nw='TD' "
        Else
            finStr = finStr & " or scd='" & selCir & "' and nw='TD' "
        End If
    End Sub

    Private Sub ChkIdea_CheckStateChanged(sender As Object, e As EventArgs) Handles ChkIdea.CheckStateChanged
        If (finStr = "N") Then
            finStr = " scd='" & selCir & "' and nw='ID' "
        Else
            finStr = finStr & " or scd='" & selCir & "' and nw='ID' "
        End If
    End Sub

    Private Sub ChkBsnl_CheckStateChanged(sender As Object, e As EventArgs) Handles ChkBsnl.CheckStateChanged
        If (finStr = "N") Then
            finStr = " scd='" & selCir & "' and nw='CC' or scd='" & selCir & "' and nw='CG'"
        Else
            finStr = finStr & " or scd='" & selCir & "' and nw='CC' or scd='" & selCir & "' and nw='CG'"
        End If
    End Sub

    Private Sub chkAirtel_CheckStateChanged(sender As Object, e As EventArgs) Handles chkAirtel.CheckStateChanged
        If (finStr = "N") Then
            finStr = " scd='" & selCir & "' and nw='AT' "
        Else
            finStr = finStr & " or scd='" & selCir & "' and nw='AT' "
        End If
    End Sub
End Class

