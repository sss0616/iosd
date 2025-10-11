import Foundation

guard let tshirt = Product(name: "Футболка", price: 19.99, category: .clothing, description: "ХБ футболка") else { fatalError("Fail to create product tshirt") }
guard let apple = Product(name: "Яблоко", price: 0.99, category: .food, description: "Свежее яблоко") else { fatalError("Failed to create product apple") }
guard let novel = Product(name: "Роман", price: 12.49, category: .books, description: "Популярный роман") else { fatalError("Failed to create product novel") }
guard let headphones = Product(name: "Наушники", price: 59.99, category: .electronics, description: "Беспроводные наушники") else { fatalError("Failed to create product headphones") }

print("Products created:\n", tshirt.name, apple.name, novel.name, headphones.name)

let cart = ShoppingCart()
cart.addItem(product: tshirt, quantity: 1)
cart.addItem(product: apple, quantity: 5)
print("After adding tshirt x1 and apple x5 -> itemCount: \(cart.itemCount), subtotal: \(cart.subtotal)")

cart.addItem(product: tshirt, quantity: 1)
if let tshirtItem = cart.items.first(where: { $0.product.id == tshirt.id }) {
    assert(tshirtItem.quantity == 2, "Tshirt quantity should be 2")
    print("Tshirt quantity updated to \(tshirtItem.quantity)")
}

print("Subtotal: \(cart.subtotal)")
print("Item count: \(cart.itemCount)")

cart.discountCode = "SAVE10"
print("Discount amount: \(cart.discountAmount)")
print("Total with discount: \(cart.total)")

cart.removeItem(productId: apple.id)
print("After removing apple -> itemCount: \(cart.itemCount)")

func modifyCart(_ cart: ShoppingCart) {
    cart.addItem(product: headphones, quantity: 1)
}
modifyCart(cart)
print("After modifyCart -> itemCount: \(cart.itemCount)")

let item1 = CartItem(product: tshirt, quantity: 1)
var item2 = item1
item2.updateQuantity(5)
print("item1.quantity = \(item1.quantity), item2.quantity = \(item2.quantity)")

let address = Address(street: "tole bi 104", city: "Almaty", zipCode: "050006", country: "Kazakhstan")
let order = Order(from: cart, shippingAddress: address)
print("Order created with id: \(order.orderId), items: \(order.itemCount)\nOrder total: \(order.total)")

cart.clearCart()
print("Cart items count after clear: \(cart.itemCount)")
print("Order items count (snapshot): \(order.itemCount)")

let user = User(name: "Symbat", email: "symbat@гмайл.com")
user.placeOrder(order)
print("User order history count: \(user.orderHistory.count), total spent: \(user.totalSpent)")

print("All tests executed")


/* README
 Why did I choose class for ShoppingCart?
 because a cart should be shared and mutable. If I give the cart to a function, I want the changes inside that function to affect the same cart. This is similar to real life if you add an item in one place, you will still see it in your cart later. Classes allow this behavior because they use reference semantics.
 
 Why did I choose struct for Product and Order?
 product is simple data like name, price, and category. These values usually do not change after the product is created. Order is a snapshot of the cart at the moment of buying. After the order is created, it should not change. Structs copy the data, so even if the cart changes later, the order stays the same. This makes the order history reliable.
 
 Example of Reference Semantics
 In the function `modifyCart(_:)`, when I pass the cart and add an item, the original cart also changes. This shows that the cart is shared and different variables can point to the sam object. This is important for keeping the cart consistent.
 
 Example of Value Semantics
 When I copy a `CartItem` struct, I get two separate values. If I change the quantity of the second one, the first one is not affected. This shows value semantics, where data is copied and stays independent.
 
 Challenges and How I Solved Them
 At first, it was hard to decide when to use class and when to use struct. I solved it by thinking about whether the object should be shared or independent. Another challenge was making correct subtotal and total calculations. I solved this with computed properties that always give the right result.
 */

