/* CONVIERTE UNA CADENA A UN ENTERO DE 32 BITS
Implementa myAtoi(s) para convertir una cadena s en un entero con signo de 32 bits. Reglas: ignora espacios iniciales, detecta un signo opcional - o +, luego lee dígitos consecutivos ignorando ceros iniciales hasta encontrar un no dígito o el final. Si no se leyó ningún dígito, devuelve 0. Si el valor sale del rango firmado de 32 bits. Ajústalo a ese límite. Devuelve el entero resultante.

Implement myAtoi(s) to convert a string s into a 32-bit signed integer. Rules: skip leading whitespace, read an optional - or +, then read consecutive digits ignoring leading zeros until a non-digit or end. If no digits were read, return 0. If the value exceeds the 32-bit signed range. Clamp it to that range. Return the resulting integer. */

/// Soluciòn original (falta optimizarla mucho)
func myAtoi(_ s: String) -> Int {
    var stringNum = ""
    var isSigned = false
    var hasReachedADigit = false
    var hasSign = false
    
    loop: for i in s.indices {
        let character = s[i]
        if character.isNumber {
            switch character {
            case "0":
                if s.index(after: i) < s.endIndex && !hasReachedADigit {
                    let next = s[s.index(after: i)]
                    if character == next { continue }
                    else { stringNum.append(character); hasReachedADigit = true }
                } else {
                    stringNum.append(character)
                    hasReachedADigit = true
                }
            default: stringNum.append(character); hasReachedADigit = true
            }
        } else {
            if !hasReachedADigit && !hasSign {
                print(character)
                switch character {
                case " ": continue
                case "+": hasSign = true
                case "-": isSigned = true; hasSign = true
                default: break loop
                }
            } else {
                break
            }
        }
    }
    
    guard !stringNum.isEmpty else {
        return 0
    }
    
    let intValueUnsigned = Int(stringNum) ?? 0
    
    if intValueUnsigned == 0 && Int(stringNum) != 0 {
        if isSigned {
            return -2147483648
        } else {
            return 2147483647
        }
    }
    
    let intValue = isSigned ? -1*(Int(stringNum) ?? 0) : Int(stringNum) ?? 0
    
    guard intValue >= Int32.min && intValue <= Int32.max else {
        if intValue < Int32.min {
            return -2147483648
        }
        if intValue > Int32.max {
            return 2147483647
        }
        return 0
    }
    
    return intValue
}

/// Pruebas
myAtoi("words and 123")
myAtoi("0000243124")
myAtoi("     +004500")
myAtoi("20000000000000000000")
myAtoi("-20000000000000000001")
