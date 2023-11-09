Public Module ReverseString
    Public Function Reverse(ByVal inputString As String) As String
        Dim reversedString As String = ""
        For i As Integer = inputString.Length - 1 To 0 Step -1
            reversedString += inputString(i)
        Next
        Return reversedString
    End Function
End Module
