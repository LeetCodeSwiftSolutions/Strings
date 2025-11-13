/* LONGITUD DE LA ÚLTIMA PALABRA EN UNA CADENA
Dada una cadena s con palabras separadas por espacios, devuelve la longitud de la última palabra. Ignora cualquier espacio al final; una “palabra” es la subcadena máxima de caracteres no espaciales. Restricciones: 1 <= s.length <= 10^4, solo letras inglesas y espacios, y hay al menos una palabra.

Given a string s with words separated by spaces, return the length of the last word. Ignore any trailing spaces; a “word” is the maximal substring of non-space characters. Constraints: 1 <= s.length <= 10^4, only English letters and spaces, and there is at least one word. */


/// Solución original
func lengthOfLastWord(_ s: String) -> Int {
    var count = 0
    var sol = 0
    
    // Iteramos sobre la cadena
    for char in s {
        // Si es una letra, entonces la contamos
        if char != " " {
            count += 1
        } else if count != 0 {
            // Si no, guardamos el conteo y lo reiniciamos
            sol = count
            count = 0
        }
        // Si la cadena no termina con un espacio, actualizamos el conteo de la última palabra
        sol = s.last != " " ? count : sol
    }
    
    return sol
}

/// Pruebas
print(lengthOfLastWord("Today is a nice day"))
