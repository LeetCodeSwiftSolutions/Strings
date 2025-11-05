/* Dada una cadena s con numerales romanos (I, V, X, L, C, D, M), conviértela a entero sumando valores de izquierda a derecha, excepto cuando un símbolo menor va antes de uno mayor, caso en el que se resta (pares válidos: IV, IX, XL, XC, CD, CM). La cadena es válida, tiene longitud 1–15 y representa un número en [1, 3999]. Devuelve el entero resultante.

 Given a string s of Roman numerals (I, V, X, L, C, D, M), convert it to an integer by adding values left to right, except when a smaller symbol precedes a larger one, in which case subtract it (valid pairs: IV, IX, XL, XC, CD, CM). The string is valid, length 1–15, and represents a number in [1, 3999]. Return the resulting integer. */

func romanToInt(_ s: String) -> Int {
    var value = 0
    var index = s.startIndex // Usamos el método .startIndex en vez de iniciar con un índice Int en cero.
    
    while index < s.endIndex { // El método .endIndex nos da un valor equivalente a .count, es decir, un índice después del último.
        let character = s[index]
        let nextIndex = s.index(after: index) // En vez de sumar 1 al índice Int, usamos el método .index(after: currentIndex)
        
        switch character {
        case "I":
            if nextIndex < s.endIndex { // Validamos que el índice siguiente no se haya salido de los límites (que no sea igual a .endIndex)
                let nextChar = s[nextIndex]
                if nextChar == "V" { value += 4; index = s.index(after: nextIndex); continue }
                if nextChar == "X" { value += 9; index = s.index(after: nextIndex); continue }
            }
            value += 1
        case "X":
            if nextIndex < s.endIndex {
                let nextChar = s[nextIndex]
                if nextChar == "L" { value += 40; index = s.index(after: nextIndex); continue }
                if nextChar == "C" { value += 90; index = s.index(after: nextIndex); continue }
            }
            value += 10
        case "C":
            if nextIndex < s.endIndex {
                let nextChar = s[nextIndex]
                if nextChar == "D" { value += 400; index = s.index(after: nextIndex); continue }
                if nextChar == "M" { value += 900; index = s.index(after: nextIndex); continue }
            }
            value += 100
        case "V": value += 5
        case "L": value += 50
        case "D": value += 500
        case "M": value += 1000
        default: break
        }
        index = nextIndex // Los "continue" de cada if, terminan el ciclo en ese punto (después de actualizar el index) y empiezan el ciclo siguiente, nunca llegan a esta línea fuera del switch.
    }
    return value
}

romanToInt( "MCMXCIV")
romanToInt( "MMXXIII")
romanToInt( "XVII")
