/* INVERTIR UNA CADENA
Invierte la cadena representada como un arreglo de caracteres s modificándolo directamente sin usar memoria adicional extra significativa (O(1)). La longitud del arreglo está entre 1 y 10⁵, y cada carácter es ASCII imprimible.

Reverse the string represented as a character array s by modifying the array in-place with only O(1) extra memory. The array length ranges from 1 to 10⁵, and each character is a printable ASCII character. */

/// Solución original
func reverseString(_ s: inout [Character]) {
    var low = 0
    var high = s.count - 1
    var aux: Character = " "
    
    while low < high {
        aux = s[low]
        s[low] = s[high]
        s[high] = aux
        low += 1
        high -= 1
    }
}

/// Pruebas
var str: [Character] = ["h", "e", "l", "l", "o"]
reverseString(&str)
print(str)


/// Solución original optimizada
func reverseStringOptimized(_ s: inout [Character]) {
    var low = 0
    var high = s.count - 1
    
    while low < high {
        s.swapAt(low, high)
        low += 1
        high -= 1
    }
}

/// Pruebas de la función optimizada
var str2: [Character] = ["h", "e", "l", "l", "o", " " , "w", "o", "r", "l", "d"]
reverseStringOptimized(&str2)
print(str2)
