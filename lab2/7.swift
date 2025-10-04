import Foundation  

// Словарь с именами студентов и их баллами
let students: [String: Int] = [
    "Cима": 88,
    "Дина": 90,
    "Тима": 74,
    "Алма": 63,
    "Медина": 98
]

// Извлекаем только значения (баллы) из словаря
let scores = Array(students.values)

// Считаем средний балл: сумма всех оценок / количество студентов
let average = Double(scores.reduce(0, +)) / Double(scores.count)

// Находим максимальный и минимальный баллы
if let maxScore = scores.max(), let minScore = scores.min() {
    print("Средний балл: \(average)")
    print("Максимум: \(maxScore)")
    print("Минимум: \(minScore)\n")
    
    // Перебираем каждого студента и его оценку
    for (name, score) in students {
        // Проверяем: оценка выше или ниже среднего
        let status = Double(score) >= average ? "выше среднего" : "ниже среднего"
        print("\(name): \(score) (\(status))")
    }
}