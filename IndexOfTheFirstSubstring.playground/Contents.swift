/* BÙSQUEDA DEL ÍNDICE DE INICIO DE LA PRIMER OCURRENCIA DE UNA SUBCADENA.
Dadas dos cadenas, haystack y needle, devuelve el índice de inicio de la primera aparición de needle como subcadena continua dentro de haystack; si needle no aparece, devuelve -1. La coincidencia es exacta y las cadenas contienen solo minúsculas. Longitudes: 1<= haystack.count, needle.count <= 10^4

Given two strings, haystack and needle, return the 0-based index of the first occurrence of needle as a contiguous substring in haystack; if needle does not occur, return -1. Matching is exact and strings contain only lowercase letters. Lengths: 1<= haystack.count, needle.count <= 10^4 */

import Foundation

/// Solución original
func strStr(_ haystack: String, _ needle: String) -> Int {
    // Comprobamos que de hecho la subcadena se encuentre dentro de la cadena.
    guard haystack.contains(needle) else {
        return -1
    }
    
    // Buscamos un rango de tipo String.index en donde se encuentra por primera vez la subcadena
    if let range = haystack.range(of: needle) {
        // Usamos ese rango para encontrar el valor Int del ìndice de inicio de la subcadena
        let index = haystack.distance(from: haystack.startIndex, to: range.lowerBound)
        return index
    }
    
    return 0
}

/// Pruebas
print(strStr("This is a test from a list of test cases", "test"))
