/* SUBCADENA MÁS LARGA SIN QUE SE REPITAN CARACTERES.
 Dada una cadena s, devuelve la longitud de la subcadena más larga sin caracteres repetidos. La subcadena debe ser continua; si repites un carácter, esa ventana ya no sirve. Si s está vacía, el resultado es 0. Restricciones: 0 <= s.length <= 50,000 y s puede incluir letras, dígitos, símbolos y espacios.
 
 Given a string s, return the length of the longest substring with no repeated characters. The substring must be contiguous; once a character repeats, that window is invalid. If s is empty, the result is 0. Constraints: 0 <= s.length <= 50,000, and s may contain letters, digits, symbols, and spaces. */


/// Solución original
func lengthOfLongestSubstring(_ s: String) -> Int {
    // eco para modificar la cadena, aux para ingresar caracteres no repetidos y max para guardar el conteo máximo
    var eco = s
    var aux = Set<Character>()
    var max = 0
    
    // Mientras eco siga teniendo caracteres, iniciamos el ciclo con un set vacio, e iteramos sobre todos los caracteres
    while eco != "" {
        aux.removeAll()
        for i in eco.indices {
            // Si el caracter no está en el set, lo agregamos, si está, terminamos el ciclo for.
            if aux.contains(eco[i]) {
                break
            } else {
                aux.insert(eco[i])
            }
        }
        // Comparamos el valor actual de max (iniciado en cero), con el conteo de caracteres de set, para almacenar el mayor
        max = aux.count > max ? aux.count : max
        // Eliminamos el primer caracter para empezar el siguiente ciclo.
        eco.remove(at: eco.startIndex)
    }
    
    return max
}

/// Pruebas
lengthOfLongestSubstring("pwwkew")
