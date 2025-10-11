import Foundation

struct CartItem: Codable {
let product: Product
private(set) var quantity: Int
var subtotal: Double {
return product.price * Double(quantity)
}
mutating func updateQuantity(_ newQuantity: Int) {
guard newQuantity > 0 else {
print("CartItem: quantity must be > 0")
return
}
quantity = newQuantity
}
mutating func increaseQuantity(by amount: Int) {
guard amount > 0 else { return }
quantity += amount
}
}
