Public Class Home
    ' Declaration of global variables
    Dim HighScore As Integer = 0
    Dim Activity As String = ""
    Dim Score As Integer

    ' Default Constructor
    Public Sub New()
        ' Define the initial values of the variables
        HighScore = 0
        Activity = ""
        Score = 0
    End Sub

    ' Method to Calculate the High Score
    Public Sub CalculateHighScore()
        If Score > HighScore Then
            HighScore = Score
        End If
    End Sub

    ' Method to Set the Activity
    Public Sub SetActivity(ByVal a As String)
        Activity = a
    End Sub

    ' Method to Set the Score
    Public Sub SetScore(ByVal s As Integer)
        Score = s
    End Sub

    ' Method to Reset the Score
    Public Sub ResetScore()
        Score = 0
    End Sub

    ' Method to Get the High Score
    Public Function GetHighScore() As Integer
        Return HighScore
    End Function

    ' Method to Get the Activity
    Public Function GetActivity() As String
        Return Activity
    End Function

    ' Method to Get the Score
    Public Function GetScore() As Integer
        Return Score
    End Function
End Class