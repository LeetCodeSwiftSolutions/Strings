/* SANCIÓN MÍNIMA PARA UN COMERCIO.
Dado un registro horario de clientes (cadena de 'Y' y 'N'), encuentra la hora de cierre más temprana que minimice la penalización: se suma 1 por cada hora abierta sin clientes y 1 por cada hora cerrada con clientes. La longitud está entre 1 y 10^5.

Given an hourly customer log (string of 'Y' and 'N'), find the earliest closing hour that minimizes the penalty: add 1 for each open hour without customers and 1 for each closed hour with customers. The length ranges from 1 to 10^5. */

/// Solución original --- Time limit exceded.
func bestClosingTime(_ customers: String) -> Int {
    // Consideramos los casos límite
    guard customers.contains("Y") else { return 0 }
    guard customers.contains("N") else { return customers.count }
    // Vamos a crear dos arreglos con las penalizaciones de cada hora si la tienda está siempre cerrada o siempre abierta
    var alwaysClosed = [Int]()
    var alwaysOpen = [Int]()
    for customer in customers {
        if customer == "Y" {
            alwaysClosed.append(1)
            alwaysOpen.append(0)
        } else {
            alwaysClosed.append(0)
            alwaysOpen.append(1)
        }
    }
    // Ahora creamos un arreglo que tiene la suma acumulada de las penalizaciones si se cierra a la hora "i", sumando particiones de los arreglos de siempre abierto y siempre cerrado.
    var penaltySum = [Int]()
    // Primero agregamos el resultado de estar siempre cerrado
    penaltySum.append(alwaysClosed.reduce(0,+))
    // Ahora todos los casos intermedios
    for i in 1..<customers.count {
        let hoursOpened = alwaysOpen[0...i-1]
        let hoursClosed = alwaysClosed[i..<customers.count]
        penaltySum.append(hoursOpened.reduce(0, +) + hoursClosed.reduce(0,+))
    }
    // Y por último el resultado de estar siempre abierto
    penaltySum.append(alwaysOpen.reduce(0,+))
    // Finalmente analizamos los resultados para buscar el índice de la penalización menor
    var result = 0
    var min = 1000000
    for i in 0..<penaltySum.count {
        if penaltySum[i] < min {
            result = i
            min = penaltySum[i]
        }
    }
    return result
}


/// Solución optimizada con Deepseek.
/// Time complexity: , Space complexity: . Beats 56% & 5%
func bestClosingTimeOptimized(_ customers: String) -> Int {
    // Consideramos los casos límite
    guard customers.contains("Y") else { return 0 }
    guard customers.contains("N") else { return customers.count }
    // Vamos a crear dos arreglos con las penalizaciones de cada hora si la tienda está siempre cerrada o siempre abierta
    let n = customers.count
    var alwaysClosed = [Int](repeating: 0, count: n)
    var alwaysOpen = [Int](repeating: 0, count: n)
    // Las penalizaciones de "alwaysClosed" coinciden a partir de la hora de cierre
    for (index, customer) in customers.enumerated() {
        if customer == "Y" {
            alwaysClosed[index] = 1
            alwaysOpen[index] = 0
        }
        else {
            alwaysOpen[index] = 1
            alwaysClosed[index] = 0
        }
    }
    // Hacemos prefixSumOpen[i] = suma de alwaysOpen[0..<i] y prefixSumClosed[i] = suma de alwaysClosed[i..<n]
    var prefixSumOpen = [Int](repeating: 0, count: n+1)
    var prefixSumClosed = [Int](repeating: 0, count: n+1)
    // Iteramos en O(n) para llenar las sumas acumuladas.
    for i in 0 ..< n { prefixSumOpen[i+1] = prefixSumOpen[i] + alwaysOpen[i] }
    for i in (0 ..< n).reversed() { prefixSumClosed[i] = prefixSumClosed[i+1] + alwaysClosed[i] }
    // Creamos un arreglo que tiene la suma acumulada de las penalizaciones si se cierra a la hora "i", sumando particiones de los arreglos de siempre abierto y siempre cerrado.
    var penaltySum = [Int]()
    // La suma de prefixSumOpen + prefixSumClosed para cada índice, da la penalización total por cerrar a esa hora
    for i in 0...n { penaltySum.append(prefixSumOpen[i] + prefixSumClosed[i]) }
    // Finalmente analizamos los resultados para buscar el índice de la penalización menor
    var result = 0
    var min = Int.max
    for i in 0...n {
        if penaltySum[i] < min {
            result = i
            min = penaltySum[i]
        }
    }
    return result
}

/// Pruebas
bestClosingTimeOptimized("NY")  // Expected: 0
bestClosingTimeOptimized("YNY") // Expected: 1
bestClosingTime("YNNYYNNYYNYNNNNNYNYNYNNYNNYYYNNNNYYYNYNYNYYYNYNYYYYYYNNYNNNYYNYYYNNYYYYYNNYYNYNYNYNNNYYNNYYYYNYYYYNNNYNYNYNYYNNYYNNNYNNYYYNNYNNYYYNNNNYYYYNYNYNYYNNNNYNNNYNYNYYYNNNNNNNYNYYYYYNYYNNYNYNYNNNYYNYNNNYYNYNY")  // Expected: 98
