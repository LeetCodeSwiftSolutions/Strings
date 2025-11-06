/* PARÉNTESIS VÁLIDOS EN UNA CADENA.
 Dada una cadena s formada solo por los caracteres ()[]{}, decide si es válida: cada paréntesis, corchete o llave que se abre debe cerrarse con el mismo tipo y en el orden correcto, sin cierres que no tengan su apertura correspondiente. Devuelve true si cumple todo, en caso contrario false. Longitud de s: 1 a 10^4

 Given a string s containing only ()[]{}, determine if it is valid: every opening bracket must be closed by the same type and in the correct order, and no closing bracket may appear without a matching opening. Return true if all rules hold, otherwise false. String length: 1 to 10^4 */

/// Solución optimizada, usando pilas (stacks)
func isValid(_ s: String) -> Bool {
    // Primero quitamos la posibidad de que no haya un número par de paréntesis
    guard s.count % 2 == 0 else {
        return false
    }
    
    // Creamos una pila vacía
    var stack: [Character] = []
    
    // Iteramos sobre toda la cadena
    for character in s {
        switch character {
            // En caso de encontrar un paréntesis de apertura, agregamos el paréntesis de cierre correspondiente al stack
        case "(":
            stack.append(")")
        case "[":
            stack.append("]")
        case "{":
            stack.append("}")
            // En caso de encontrar un paréntesis de cierre, lo comparamos con el que está en el stack, y si es el mismo, es correcto.
            // Si no es el mismo o no hay nada con qué comparar, nunca hubo un paréntesis de apertura, y por lo tanto es incorrecto.
        default:
            if stack.isEmpty || stack.removeLast() != character { // .removeLast() elimina el último elemento de la pila y lo retorna al mismo tiempo.
                return false
            }
        }
    }
    
    return stack.isEmpty // En vez de retornar "true", verificamos si el stack quedó vacío o no. Solo si quedó vacío es correcto.
}

/// Pruebas
isValid("{()[]([]){}}")
isValid("(")
isValid("[[")
isValid("[[[[((((]]]]])))))}}}}}{{{{}{}")
