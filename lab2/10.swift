import Foundation

// Функция для проверки, все ли символы строки уникальны
func hasUniqueCharacters(_ text: String) -> Bool {
    var seen: Set<Character> = []   // множество для хранения уже встреченных символов
    
    for char in text {              
        if seen.contains(char) {    // если символ уже есть в множестве, значит символ повторяется → возвращаем false
            return false           
        }
        seen.insert(char)           // иначе добавляем символ в множество
    }
    return true   
}


print(hasUniqueCharacters("Hello"))   // false (повторяется 'l')
print(hasUniqueCharacters("hi"))   // true (все буквы уникальны)
print(hasUniqueCharacters("Aa"))      // true ('A' и 'a' разные, потому что учёт регистра)
print(hasUniqueCharacters("Symbat"))  // true