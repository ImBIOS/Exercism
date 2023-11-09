Public Module TwoFer
    ' In order to get the tests running, first you need to make sure the Speak method
    ' can be called both without any arguments and also by passing one string argument.
    Public Function Speak(Optional ByVal name As String = "you") As String
        Return $"One for {name}, one for me."
    End Function
End Module
