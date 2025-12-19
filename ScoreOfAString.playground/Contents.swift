/* PUNTUACIÓN DE UNA CADENA
Calcula la puntuación de una cadena s sumando las diferencias absolutas entre los valores ASCII de cada par de caracteres adyacentes. La longitud está entre 2 y 100, y solo contiene letras minúsculas del inglés.

Compute the score of a string s by summing the absolute differences between the ASCII values of each pair of adjacent characters. The length ranges from 2 to 100, and it consists only of lowercase English letters. */


/// Solución original
func scoreOfString(_ s: String) -> Int {
    // Creamos un arreglo de caracteres para poder usar índices enteros
    let asciiArray: [Character] = Array(s)
    var score = 0
    for i in 0..<asciiArray.count-1 {
        // Usamos el método .asciiValue para obtener el valor ASCII (UInt8?) del caracter
        score += abs(Int(asciiArray[i].asciiValue!) - Int(asciiArray[i+1].asciiValue!))
    }
    return score
}


/// Pruebas
scoreOfString("HelloWorld")   // Expected: 104
scoreOfString("abcdefghijklmnopqrstuvwxyz")   // Expected: 25
scoreOfString(String(repeating: "a", count: 100))   // Expected: 0
