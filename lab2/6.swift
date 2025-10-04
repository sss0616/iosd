import Foundation

// Функция для генерации первых n чисел Фибоначчи
func fibonacci(_ n: Int) -> [Int] {
    if n <= 0 { return [] }        // если n <= 0 → пустой массив
    if n == 1 { return [0] }       // если n = 1 → [0]
    if n == 2 { return [0, 1] }    // если n = 2 → [0, 1]
    
    var seq = [0, 1]               // начинаем с [0, 1]
    for _ in 2..<n {               // цикл от 2 до n-1
        let next = seq[seq.count-1] + seq[seq.count-2] // сумма двух последних
        seq.append(next)           // добавляем новое число
    }
    return seq
}

// --- Тесты ---
print(fibonacci(0))   // []
print(fibonacci(1))   // [0]
print(fibonacci(2))   // [0, 1]
print(fibonacci(10))  // [0, 1, 1, 2, 3, 5, 8, 13, 21, 34]
