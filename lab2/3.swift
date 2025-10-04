import Foundation

func CtoF(_ c: Double) -> Double { return (c * 9/5) + 32 }
func CtoK(_ c: Double) -> Double { return c + 273.15 }
func FtoC(_ f: Double) -> Double { return (f - 32) * 5/9 }
func FtoK(_ f: Double) -> Double { return (f - 32) * 5/9 + 273.15 }
func KtoC(_ k: Double) -> Double { return k - 273.15 }
func KtoF(_ k: Double) -> Double { return (k - 273.15) * 9/5 + 32 }

print("Enter temperature value: ", terminator: "")
let value = Double(readLine() ?? "") ?? 0.0

print("Enter unit (C, F, or K): ", terminator: "")
let unit = readLine()?.uppercased() ?? "C"

if unit == "C" {
    print("\(value)°C = \(CtoF(value))°F = \(CtoK(value))K")
} else if unit == "F" {
    print("\(value)°F = \(FtoC(value))°C = \(FtoK(value))K")
} else if unit == "K" {
    print("\(value)K = \(KtoC(value))°C = \(KtoF(value))°F")
} else {
    print("Invalid unit!")
}
