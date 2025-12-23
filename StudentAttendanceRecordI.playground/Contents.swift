/* REGISTROS DE ASISTENCIA DE UN ESTUDIANTE
Dada una cadena s con registros de asistencia ('A': ausente, 'L': tarde, 'P': presente), determina si el estudiante es elegible para un premio de asistencia: debe tener menos de 2 ausencias totales y nunca llegar tarde 3 o más días consecutivos. La longitud está entre 1 y 1000.

Given a string s with attendance records ('A': absent, 'L': late, 'P': present), determine if the student is eligible for an attendance award: they must have fewer than 2 total absences and never be late for 3 or more consecutive days. The length ranges from 1 to 1000. */

/// Solución original. Time complexity: O(n), Space complexity: O(1). Beats 100% & 90%
func checkRecord(_ s: String) -> Bool {
    // Analizamos los casos límite
    guard s.count != 1 else { return true }
    guard s.count != 2 else {
        if (s.first! == s.last!) && (s.first! == "A") { return false }
        else { return true }
    }
    // Contamos las faltas sin reinicio y los retardos como frecuencias acumuladas
    var absentCount = 0
    var lateFreq = 0
    // Iteramos sobre todos los caracteres, reiniciando los retardos si el alumno no llegó tarde
    for character in s {
        switch character {
            case "A":
            absentCount += 1
            lateFreq = 0
            if absentCount > 1 { return false }
            case "L":
            lateFreq += 1
            if lateFreq > 2 { return false }
            default:
            lateFreq = 0
        }
    }
    return true
}


/// Pruebas
checkRecord("ALL")  // Expected: true
checkRecord("APA")  // Expected: false
checkRecord("PPPLLPPPAPPPLLPLLPLL") // Expected: true
checkRecord("PAPLLPPPAPPPLLPLLPLL") // Expected: false
