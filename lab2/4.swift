import Foundation

// ммассив в котором хранятся список покупок
var shoppingList: [String] = []

// функция для вывода меню
func showMenu() {
    print("""
    1. Добавить товар
    2. Удалить товар
    3. Показать список
    4. Выйти
    Выберите опцию:
    """)
}

// Флаг дает знать продолжаем ли работу приложения
var running = true

// Главный цикл
while running {
    showMenu()  
    // Читаем выбор пользователя строку и пытаемся преобразовать в Int
    guard let choice = readLine(), let option = Int(choice) else {
        print("Ошибка: введите число от 1 до 4")
        continue   // возвращаемся к меню, если ввод некорректный
    }
    
    // Ветвление по выбранной опции
    switch option {
    case 1: // Добавление товара
        print("Введите название товара для добавления:")
        if let item = readLine(), !item.isEmpty {
            shoppingList.append(item) 
            print("'\(item)' добавлен в список")
        } else {
            print("Неверный ввод")
        }
        
    case 2: // Удаление товара
        if shoppingList.isEmpty {
            print("Список пуст, нечего удалять")
        } else {
            print("Введите название товара для удаления:")
            if let item = readLine(), let index = shoppingList.firstIndex(of: item) {
                shoppingList.remove(at: index) // удаляем по индексу
                print("'\(item)' удалён из списка")
            } else {
                print("Товар не найден в списке")
            }
        }
        
    case 3: // Показать текущий список
        if shoppingList.isEmpty {
            print("Список пуст")
        } else {
            print("Текущий список покупок:")
            for (index, item) in shoppingList.enumerated() {
                print("\(index + 1). \(item)") // выводим с номером
            }
        }
        
    case 4: // Выход из программы
        print("Выход из приложения...")
        running = false
        
    default: // Если ввели не 1–4
        print("Ошибка: выберите опцию от 1 до 4")
    }
}