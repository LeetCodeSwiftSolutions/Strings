/* SUBCADENA PALÍNDROMO MÁS LARGA
Dada una cadena s, encuentra y retorna la subcadena palíndroma más larga dentro de ella. La longitud de la cadena está entre 1 y 1000, y solo contiene dígitos y letras inglesas.

Given a string s, find and return the longest palindromic substring within it. The string length ranges from 1 to 1000 and consists only of digits and English letters. */

/// Solución semi-original (basada en video de YouTube)
func longestPalindrome(_ s: String) -> String {
    // Convertimos a arreglo para poder manejar los índices fácilmente
    let cadena: [Character] = Array(s)
    var result = ""
    
    /// Función auxiliar
    func findPalindrome(leftIndex: Int, rightIndex: Int) -> String {
        var left = leftIndex
        var right = rightIndex
        while (left >= 0 && right < s.count) && (cadena[left] == cadena[right]) {
            left -= 1
            right += 1
        }
        return String(cadena[left+1..<right])
    }
    
    for i in 0...cadena.count-1 {
        // Ejecutamos el algoritmo para las cadenas impares
        let odd = findPalindrome(leftIndex: i, rightIndex: i)
        if odd.count > result.count { result = odd }
        // Ejecutamos el algoritmo para las cadenas pares
        if i+1 < cadena.count {
            let pair = findPalindrome(leftIndex: i, rightIndex: i+1)
            if pair.count > result.count { result = pair }
        }
    }
    
    return result
}


/// Pruebas
print(longestPalindrome("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaabcaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa")
)



/// Solución original (no es lo suficientemente rápida - Time limit exceeded)
func longestPalindromeBruteForce(_ s: String) -> String {
    let n = s.count - 1
    var maxSubstring: [Character] = [" "]
    var array: [Character] = Array(s)

    guard !isPalindrome(Array(s)) else { return s }

    for i in 0...n-1 {
        for j in i...n {
            if isPalindrome(Array(array[i...j])) {
                if maxSubstring.count < Array(array[i...j]).count {
                    maxSubstring = Array(array[i...j])
                }
            }
        }
    }

    if maxSubstring == [" "] {
        return String(s.first!)
    } else {
        return String(maxSubstring)
    }
}

func isPalindrome(_ substring: [Character]) -> Bool {
    guard substring.count > 1 else { return true }

    var low = 0
    var high = substring.count - 1

    while low < high {
        if substring[low] == substring[high] {
            low += 1
            high -= 1
        } else {
            return false
        }
    }

    return true
}
