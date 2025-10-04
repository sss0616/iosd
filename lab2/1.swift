
for i in stride(from: 1, through: 100, by:1) {
    if i % 3 == 0 && i % 5 == 0{
        print("FizzBuzz")
    } else if i % 3 == 0{
        print("Fizz")
    } else if i % 5 == 0{
        print("Buzz")
    } else {
        print(i)
    }
}

// This program prints numbers from 1 to 100
// For multiples of 3, it prints "Fizz" instead of the number, for multiples of 5, it prints "Buzz"
// For numbers divisible by both 3 and 5, it prints "FizzBuzz"