//Функция для проверки, является ли число простым
func isPrime(_ number: Int) -> Bool {
    if number < 2 {
        return false   //Все числа меньше 2 не простые
    }
    if number == 2 {
        return true    //2 это простое число
    }
//находим квадратный корень числа  дальше проверять нет смысла
    let limit = Int(Double(number).squareRoot())
    if limit < 2 {
        return true    // Если верхняя граница меньше 2, число простое
    }

//проверяем делимость числа на все i от 2 до limit
    for i in 2...limit {
        if number % i == 0 {
            return false //eсли нашли делитель — число не простое
        }
    }
    return true  // eсли делителей не нашли — число простое
}

//цикл где проходим по всем числам от 1 до 100
for n in 1...100 {
    if isPrime(n) {
        print(n, terminator: " ")
    }
}
print()