import Foundation

// Запрос предложения у пользователя
print("Enter a sentence:", terminator: " ")
let input = readLine() ?? ""

// Убираем пунктуацию, переводим в нижний регистр
let clean = input.lowercased().components(separatedBy: CharacterSet.punctuationCharacters).joined()

// Разбиваем строку на слова
let words = clean.split(separator: " ").map { String($0) }

// Словарь для подсчёта частоты
var freq: [String: Int] = [:]

// Перебираем слова и считаем
for w in words {
    freq[w, default: 0] += 1
}


print("\nWord frequencies:")
for (word, count) in freq {
    print("\(word): \(count)")
}
