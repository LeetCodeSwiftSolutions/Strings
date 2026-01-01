/* SUMA DE DOS CADENAS.
Dadas dos cadenas num1 y num2 que representan números enteros no negativos, devuelve su suma como una cadena, sin usar bibliotecas para enteros grandes ni convertir las cadenas a enteros directamente. Las longitudes están entre 1 y 10^4, solo contienen dígitos y no tienen ceros a la izquierda excepto el número '0'.

Given two strings num1 and num2 representing non-negative integers, return their sum as a string, without using big integer libraries or converting the strings directly to integers. The lengths range from 1 to 10^4, consist only of digits, and have no leading zeros except for the number '0'. */

/// Original solution. Time Complexity: O(max(m, n)). Space Complexity: O(max(m, n)). Beats 76% & 23%
func addStrings(_ num1: String, _ num2: String) -> String {
    // Convert each string to an array of characters
    var arr1 = Array(num1)
    var arr2 = Array(num2)
    // We make both arrays equal in length by padding the shorter one with leading zeros
    if arr1.count != arr2.count {
        let diff = abs(arr1.count - arr2.count)
        var aux = [Character](repeating: "0", count: diff)
        if arr1.count < arr2.count { arr1 = aux + arr1 }
        else { arr2 = aux + arr2 }
    }
    // Variables for sum algorithm
    var carry = 0
    var result = [Int](repeating: 0, count: arr1.count)
    // Iterate from right to left
    for index in (0..<arr1.count).reversed() {
        let sum = Int(String(arr1[index]))! + Int(String(arr2[index]))! + carry
        if sum > 9 {
            carry = 1
            result[index] = sum % 10
        } else {
            carry = 0
            result[index] = sum
        }
    }
    // If carry is 1, insert an extra digit at the beginning
    if carry == 1 { result.insert(1, at: 0) }
    // Convert the integer array to a string and return it
    return result.map{String($0)}.joined(separator: "")
}


/// Test cases
addStrings("1234567", "456") // Expected: "1235023"
addStrings("999", "9990123") // Expected: "9991122"
addStrings("1", "999999999999999999999999999") // Expected: "1000000000000000000000000000"
