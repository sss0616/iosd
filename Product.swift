import Foundation

struct Product: Codable {
let id: String
let name: String
let price: Double
let category: Category
let description: String
enum Category: String, Codable {
case electronics
case clothing
case food
case books
}
var displayPrice: String {
let formatter = NumberFormatter()
formatter.numberStyle = .currency
formatter.locale = Locale(identifier: "en_US")
return formatter.string(from: NSNumber(value: price)) ?? String(format: "$%.2f", price)
}
init?(id: String = UUID().uuidString,
name: String,
price: Double,
category: Category,
description: String = "") {
guard price > 0 else { return nil }
self.id = id
self.name = name
self.price = price
self.category = category
self.description = description
}
}
