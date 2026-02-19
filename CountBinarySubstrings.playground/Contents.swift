/*  696. Count binary substrings [easy]
 Given a binary string s, return the number of non-empty substrings that have the same number of 0's and 1's, and all the 0's and all the 1's in these substrings are grouped consecutively. Substrings that occur multiple times are counted the number of times they occur.
 
 Dada una cadena binaria s, devuelve el número de subcadenas no vacías que tengan la misma cantidad de 0's y 1's, y donde todos los 0's y todos los 1's dentro de esas subcadenas estén agrupados consecutivamente. Las subcadenas que aparezcan varias veces se cuentan tantas veces como ocurran. */

///
/// Original Solution.
/// Time Complexity: O(n), Space Complexity O(n).
/// Beats 29% in Runtime & 36% in Memory.
///
func countBinarySubstrings(_ s: String) -> Int {
    var ones = 0
    var zeros = 0
    var groupCount = 1
    var validSubstrings = 0
    var previousChar: Character? = nil

    for char in s {
        if let prev = previousChar, prev != char { groupCount += 1 }
        if char == "0" {
            zeros += 1
            if groupCount > 2 {
                validSubstrings += min(zeros-1, ones)
                zeros = 1
                groupCount = 2
            }
        } else {
            ones += 1
            if groupCount > 2 {
                validSubstrings += min(zeros, ones-1)
                ones = 1
                groupCount = 2
            }
        }
        previousChar = char
    }

    validSubstrings += min(zeros, ones)
    return validSubstrings
}


///
/// Original test cases
///
countBinarySubstrings("0000100011111") // Expected: 5
countBinarySubstrings("0101010100") // Expected: 8
countBinarySubstrings("1111111110") // Expected: 1
