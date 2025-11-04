/* Dadas dos cadenas, ransomNote y magazine, determina si puedes formar exactamente ransomNote usando letras de magazine. Cada letra de magazine solo puede usarse una vez. Si falta alguna letra o no hay suficiente cantidad, la respuesta es false; si alcanza para todas, true. Ambas cadenas usan solo minúsculas y pueden tener hasta 10^5 caracteres.

Given two strings, ransomNote and magazine, determine whether you can form ransomNote exactly using letters from magazine. Each letter from magazine may be used at most once. If any required letter is missing or insufficient, return false; otherwise return true. Both strings contain only lowercase letters and can be up to 10^5 characters long. */

/// Solución original
func canConstruct(_ ransomNote: String, _ magazine: String) -> Bool {
    var string1 = ransomNote
    var string2 = magazine
    
    for letter in string1 {
        // Obtenemos el índice de tipo String.index (opcional), en caso de que se encuentre el caracter "letter" dentro de la cadena "string2"
        if let i = string2.firstIndex(of: letter) {
            // Eliminamos el caracter de la cadena para no volverlo a usar.
            string2.remove(at: i)
        } else {
            // Si no se encuentra cualquier caracter de "string1" debemos regresar "false"
            return false
        }
    }
    
    return true
}

canConstruct("naranja", "mandarina")
canConstruct("amigo", "murcielago")


