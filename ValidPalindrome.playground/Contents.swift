/* PALÍNDROMO VÁLIDO
Dada una cadena s, determina si es un palíndromo después de convertir a minúsculas y eliminar todos los caracteres no alfanuméricos. La longitud está entre 1 y 2×10⁵, y solo contiene caracteres ASCII imprimibles.

Given a string s, determine if it is a palindrome after converting to lowercase and removing all non-alphanumeric characters. The length ranges from 1 to 2×10⁵, and it consists only of printable ASCII characters. */

import Foundation

/// Solución original. Time Complexity: O(n), Space Complexity: O(n). Beats 86% and 89%.
func isPalindrome(_ s: String) -> Bool {
    // Definimos los caracteres permitidos (CharacterSet trabaja con unicode)
    let allowedCharacters: CharacterSet = CharacterSet(charactersIn: "abcdefghijklmnñopqrstuvwxyz0123456789")
    // Convertimos la cadena a un arreglo de unicodeScalars porque CharacterSet.contains espera un parámetro tipo unicode scalar
    var phrase = String(s.lowercased().unicodeScalars.filter(allowedCharacters.contains))
    // Si queda una cadena vacía, por defecto es un palíndromo válido
    guard phrase != "" else { return true }
    // Validamos que toda la cadena sea un palíndromo
    var arrayPhrase = Array(phrase)
    var low = 0
    var high = arrayPhrase.count - 1
    // Usamos dos punteros para comparar los caracteres de la cadena
    while low < high {
        if arrayPhrase[low] != arrayPhrase[high] { return false }
        low += 1
        high -= 1
    }
    // Solo en caso de que nunca haya retornado en el while, la cadena es palíndromo
    return true
}

/// Pruebas
isPalindrome("A man, a plan, a canal: Panama!") // Expected: true
isPalindrome("race a car") // Expected: false
isPalindrome("Never odd or even") // Expected: true
isPalindrome("abc") // Expected: false
