import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:nrc_app/models/cart_item.dart';
import 'package:nrc_app/models/product.dart';
import 'package:nrc_app/services/product_service.dart';

class CartService {
  final ProductService _productService = ProductService();
  final String _cartKey = 'user_cart';
  
  // Get cart items
  Future<List<CartItem>> getCartItems() async {
    final prefs = await SharedPreferences.getInstance();
    final cartString = prefs.getString(_cartKey);
    
    if (cartString == null) {
      return [];
    }
    
    final cartJson = jsonDecode(cartString) as List;
    final cartItemsJson = List<Map<String, dynamic>>.from(cartJson);
    
    final List<CartItem> cartItems = [];
    
    for (final item in cartItemsJson) {
      try {
        cartItems.add(
          CartItem(
            id: item['id'] as String,
            name: item['name'] as String,
            price: (item['price'] as num).toDouble(),
            imageUrl: item['imageUrl'] as String,
            quantity: item['quantity'] as int,
          ),
        );
      } catch (e) {
        // Skip failed items
        continue;
      }
    }
    
    return cartItems;
  }
  
  // Add item to cart
  Future<void> addToCart(Product product, {int quantity = 1}) async {
    final prefs = await SharedPreferences.getInstance();
    final cartString = prefs.getString(_cartKey);
    
    List<Map<String, dynamic>> cartItemsJson = [];
    
    if (cartString != null) {
      final cartJson = jsonDecode(cartString) as List;
      cartItemsJson = List<Map<String, dynamic>>.from(cartJson);
    }
    
    // Check if product already exists in cart
    final existingItemIndex = cartItemsJson.indexWhere(
      (item) => item['id'] == product.id,
    );
    
    if (existingItemIndex >= 0) {
      // Update quantity
      cartItemsJson[existingItemIndex]['quantity'] = 
          (cartItemsJson[existingItemIndex]['quantity'] as int) + quantity;
    } else {
      // Add new item
      cartItemsJson.add({
        'id': product.id,
        'name': product.name,
        'price': product.price,
        'imageUrl': product.images.isNotEmpty ? product.images.first : '',
        'quantity': quantity,
      });
    }
    
    // Save updated cart
    await prefs.setString(_cartKey, jsonEncode(cartItemsJson));
  }
  
  // Update cart item quantity
  Future<void> updateQuantity(String itemId, int quantity) async {
    // If quantity is 0 or negative, remove the item
    if (quantity <= 0) {
      await removeFromCart(itemId);
      return;
    }
    
    final prefs = await SharedPreferences.getInstance();
    final cartString = prefs.getString(_cartKey);
    
    if (cartString == null) {
      return;
    }
    
    final cartJson = jsonDecode(cartString) as List;
    final cartItemsJson = List<Map<String, dynamic>>.from(cartJson);
    
    final itemIndex = cartItemsJson.indexWhere((item) => item['id'] == itemId);
    
    if (itemIndex >= 0) {
      cartItemsJson[itemIndex]['quantity'] = quantity;
      await prefs.setString(_cartKey, jsonEncode(cartItemsJson));
    }
  }
  
  // Remove item from cart
  Future<void> removeFromCart(String itemId) async {
    final prefs = await SharedPreferences.getInstance();
    final cartString = prefs.getString(_cartKey);
    
    if (cartString == null) {
      return;
    }
    
    final cartJson = jsonDecode(cartString) as List;
    final cartItemsJson = List<Map<String, dynamic>>.from(cartJson);
    
    cartItemsJson.removeWhere((item) => item['id'] == itemId);
    
    await prefs.setString(_cartKey, jsonEncode(cartItemsJson));
  }
  
  // Clear cart
  Future<void> clearCart() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_cartKey);
  }
  
  // Get cart total
  Future<double> getCartTotal() async {
    final cartItems = await getCartItems();
    return cartItems.fold<double>(0, (total, item) => total + item.total);
  }
  
  // Get cart count
  Future<int> getCartItemCount() async {
    final cartItems = await getCartItems();
    return cartItems.fold<int>(0, (count, item) => count + item.quantity);
  }
} 