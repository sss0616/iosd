import Foundation

class ShoppingCart: Codable {
private(set) var items: [CartItem] = []
var discountCode: String?
init() {}
func addItem(product: Product, quantity: Int = 1) {
guard quantity > 0 else { return }

if let index = items.firstIndex(where: { $0.product.id == product.id }) {
var item = items[index]
item.increaseQuantity(by: quantity)
items[index] = item
} else {
let item = CartItem(product: product, quantity: quantity)
items.append(item)
}
}

func removeItem(productId: String) {
items.removeAll { $0.product.id == productId }
}
func updateItemQuantity(productId: String, quantity: Int) {
if quantity == 0 {
removeItem(productId: productId)
return
}
guard quantity > 0 else { return }
if let index = items.firstIndex(where: { $0.product.id == productId }) {
var item = items[index]
item.updateQuantity(quantity)
items[index] = item
}
}
func clearCart() {
items.removeAll()
}
var subtotal: Double {
return items.reduce(0) { $0 + $1.subtotal }
}
var discountAmount: Double {
guard let code = discountCode else { return 0 }
let upper = code.uppercased()
switch upper {
case "SAVE10": return subtotal * 0.10
case "SAVE20": return subtotal * 0.20
default: return 0
}
}
var total: Double {
let tot = subtotal - discountAmount
return tot >= 0 ? tot : 0
}
var itemCount: Int {
return items.reduce(0) { $0 + $1.quantity }
}
var isEmpty: Bool { items.isEmpty }
}
