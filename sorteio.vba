Sub SortearGrupos()
Dim participantes As Variant
participantes = Array("João", "Maria", "Pedro", "Ana", "Carlos", "Lúcia", "Mariana", "José")

Dim num_grupos As Integer
num_grupos = 4

Dim grupos_sorteados As Variant
grupos_sorteados = SortearGruposInternamente(participantes, num_grupos)

Dim i As Integer
For i = 0 To UBound(grupos_sorteados)
    Debug.Print "Grupo " & i + 1 & ": " & Join(grupos_sorteados(i), ", ")
Next i
End Sub

Function SortearGruposInternamente(participantes As Variant, num_grupos As Integer) As Variant
Randomize

Dim i As Integer
For i = 0 To UBound(participantes)
    Dim j As Integer
    j = Int((UBound(participantes) + 1 - i) * Rnd() + i)
    
    Dim temp As Variant
    temp = participantes(i)
    participantes(i) = participantes(j)
    participantes(j) = temp
Next i

Dim grupos() As Variant
ReDim grupos(1 To num_grupos)

Dim tamanho_grupo As Integer
tamanho_grupo = UBound(participantes) \ num_grupos

For i = 1 To num_grupos
    Dim inicio As Integer
    inicio = (i - 1) * tamanho_grupo
    
    Dim fim As Integer
    fim = i * tamanho_grupo - 1
    
    If i = num_grupos Then
        fim = UBound(participantes)
    End If
    
    grupos(i) = Array()
    
    Dim j As Integer
    For j = inicio To fim
        grupos(i) = VBA.ArrayAppend(grupos(i), participantes(j))
    Next j
Next i

SortearGruposInternamente = grupos
