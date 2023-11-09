' FILEPATH: /Users/it-gaadmin/Exercism/vbnet/allergies/Allergies.vb
Public Class Allergies
  Private score As Integer
  ' Define a dictionary mapping allergens to their scores
  Dim allergenScores = New Dictionary(Of String, Integer) From {
    {"eggs", 1},
    {"peanuts", 2},
    {"shellfish", 4},
    {"strawberries", 8},
    {"tomatoes", 16},
    {"chocolate", 32},
    {"pollen", 64},
    {"cats", 128}
  }

  Public Sub New(score As Integer)
    Me.score = score
  End Sub

  Public Function AllergicTo(allergy As String) As Boolean
    ' Check if the person is allergic to the given allergen
    If (allergenScores.ContainsKey(allergy)) Then
      Return (allergenScores(allergy) And score) <> 0
    Else
      Return False
    End If
  End Function

  Public Function List() As IList(Of String)
    ' Create a list to store the allergens
    Dim allergens = New List(Of String)

    ' Check each allergen to see if the person is allergic to it
    For Each allergen In allergenScores
      If (AllergicTo(allergen.Key)) Then
        allergens.Add(allergen.Key)
      End If
    Next

    Return allergens
  End Function
End Class
