Imports System

Public Module Say
    Private ReadOnly Ones As String() = {
        "zero", "one", "two", "three", "four",
        "five", "six", "seven", "eight", "nine"
    }

    Private ReadOnly Teens As String() = {
        "ten", "eleven", "twelve", "thirteen", "fourteen",
        "fifteen", "sixteen", "seventeen", "eighteen", "nineteen"
    }

    Private ReadOnly Tens As String() = {
        "twenty", "thirty", "forty", "fifty",
        "sixty", "seventy", "eighty", "ninety"
    }

    Private ReadOnly Thousands As String() = {
        "", "thousand", "million", "billion"
    }

    ''' <summary>
    ''' Converts a number into its English word representation.
    ''' </summary>
    ''' <param name="number">A long integer to convert.</param>
    ''' <returns>A string that represents the English word of the given number.</returns>
    ''' <exception cref="ArgumentOutOfRangeException">Thrown when number is out of the supported range.</exception>
    Public Function InEnglish(ByVal number As Long) As String
        If number < 0 OrElse number > 999999999999 Then
            Throw New ArgumentOutOfRangeException(NameOf(number), "Number must be between 0 and 999,999,999,999.")
        End If

        If number < 10 Then
            Return Ones(number)
        ElseIf number < 20 Then
            Return Teens(number - 10)
        ElseIf number < 100 Then
            Return FormatTens(number)
        ElseIf number < 1000 Then
            Return FormatHundreds(number)
        Else
            Return FormatThousands(number)
        End If
    End Function

    Private Function FormatTens(ByVal number As Long) As String
        Dim tensPart As String = Tens(number \ 10 - 2)
        Dim onesPart As String = If(number Mod 10 > 0, "-" & Ones(number Mod 10), String.Empty)
        Return tensPart & onesPart
    End Function

    Private Function FormatHundreds(ByVal number As Long) As String
        Dim hundredsPart As String = Ones(number \ 100) & " hundred"
        Dim remainderPart As String = If(number Mod 100 > 0, " " & InEnglish(number Mod 100), String.Empty)
        Return hundredsPart & remainderPart
    End Function

    Private Function FormatThousands(ByVal number As Long) As String
        Dim result As New System.Text.StringBuilder()
        Dim i As Integer = 0

        While number > 0
            Dim chunk As Long = number Mod 1000
            If chunk > 0 Then
                result.Insert(0, $"{InEnglish(chunk)} {Thousands(i)} ".Trim() & " ")
            End If
            number \= 1000
            i += 1
        End While

        Return result.ToString().Trim()
    End Function
End Module
