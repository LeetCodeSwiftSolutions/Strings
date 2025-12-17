/* CUENTA Y DÍ
Dado un entero positivo n, calcula el n-ésimo término de la secuencia "count-and-say". Esta secuencia comienza con "1" y cada término siguiente se obtiene leyendo en voz alta el término anterior, contando grupos de dígitos consecutivos iguales (codificación de longitud de ejecución). Por ejemplo, si el término anterior es "21", se describe como "un 2, un 1", resultando en "1211". El valor de n está entre 1 y 30.

Given a positive integer n, compute the nth term of the count-and-say sequence. The sequence starts with "1", and each subsequent term is obtained by reading the previous term aloud, counting consecutive groups of identical digits (run-length encoding). For example, if the previous term is "21", it is described as "one 2, one 1", resulting in "1211". The value of n ranges from 1 to 30. */

/// Solución original. Time complexity: O(n*2^n), Space complexity: O(2^n) --> Beats 85% and 8%
func countAndSay(_ n: Int) -> String {
    var result: [Character] = Array("1")
    guard n != 1 else { return String(result) }
    var currentCount = 0
    var aux = [Character]()
    var currentNum: Character = " "
    // Obtenemos el resultado para cada iteración menor a n
    for iteration in 2...n {
        currentNum = result[0]
        for i in 0...(result.count-1) {
            if currentNum == result[i] {
                currentCount += 1
            } else {
                // Guardamos el resultado parcial
                aux.append(Character(String(currentCount)))
                aux.append(currentNum)
                currentNum = result[i]
                currentCount = 1
            }
        }
        // Guardamos el último resultado parcial
        aux.append(Character(String(currentCount)))
        aux.append(currentNum)
        result = aux
        // Reiniciamos variables
        currentCount = 0
        aux = []
    }
    return String(result)
}


/// Pruebas
countAndSay(2) // Expected: "11"
countAndSay(4) // Expected: "1211"
countAndSay(7) // Expected: "13112221"
