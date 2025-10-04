import Foundation

// Функции для операций калькулятора
func add(_ a: Double, _ b: Double) -> Double { return a + b }        
func subtract(_ a: Double, _ b: Double) -> Double { return a - b }   
func multiply(_ a: Double, _ b: Double) -> Double { return a * b }   
func divide(_ a: Double, _ b: Double) -> Double? {                   
    return b == 0 ? nil : a / b    
}

var running = true   //fлаг, чтобы цикл работал до выхода

while running {
    print("\nпервое число:")      
    guard let input1 = readLine(), let num1 = Double(input1) else {
        print("Ошибка, введи число")
        continue
    }
    
    print("Введите второе число:")        // Запрос второго числа
    guard let input2 = readLine(), let num2 = Double(input2) else {
        print("Ошибка, введи число")
        continue
    }
    
    print("Выбери операцию (+, -, *, /) или 'exit' для выхода:")
    guard let operation = readLine() else { continue }
    
    switch operation {
    case "+":    
        print("Результат: \(add(num1, num2))")
    case "-":    
        print("Результат: \(subtract(num1, num2))")
    case "*":    
        print("Результат: \(multiply(num1, num2))")
    case "/":    
        if let result = divide(num1, num2) {
            print("Результат: \(result)")
        } else {
            print("Ошибка: деление на ноль")
        }
    case "exit":   // Завершаем работу
        print("Выход из калькулятора...")
        running = false
    default:       // Неверная операция
        print("Ошибка, выбери +, -, *, / или 'exit'")
    }
}