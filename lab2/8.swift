import Foundation

// Функция для проверки, является ли строка палиндромом
func isPalindrome(_ text: String) -> Bool {
    // Убираем все пробелы и знаки пунктуации, приводим к нижнему регистру
    let cleaned = text.lowercased().filter { $0.isLetter || $0.isNumber }
    
    // Сравниваем строку с её реверс-версией
    return cleaned == String(cleaned.reversed())
}

// Тестовые примеры
print(isPalindrome("Я иду с мечем судия"))  
print(isPalindrome("hiii"))                      
print(isPalindrome("12321"))                       