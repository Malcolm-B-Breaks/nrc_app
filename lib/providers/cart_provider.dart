import 'package:flutter/foundation.dart';
import 'package:nrc_app/models/cart_item.dart';
import 'package:nrc_app/models/product.dart';
import 'package:nrc_app/services/cart_service.dart';

class CartProvider with ChangeNotifier {
  final CartService _cartService = CartService();
  
  List<CartItem> _items = [];
  bool _isLoading = false;
  String? _error;
  
  List<CartItem> get items => [..._items];
  bool get isLoading => _isLoading;
  String? get error => _error;
  
  int get itemCount => _items.fold(0, (sum, item) => sum + item.quantity);
  
  double get total => _items.fold(0.0, (sum, item) => sum + (item.price * item.quantity));
  
  Future<void> loadCartItems() async {
    _setLoading(true);
    try {
      _items = await _cartService.getCartItems();
    } catch (e) {
      _setError(e.toString());
    } finally {
      _setLoading(false);
    }
  }
  
  Future<void> addItem(Product product, {int quantity = 1}) async {
    _setLoading(true);
    try {
      await _cartService.addToCart(product, quantity: quantity);
      await loadCartItems();
    } catch (e) {
      _setError(e.toString());
    } finally {
      _setLoading(false);
    }
  }
  
  Future<void> updateItemQuantity(String itemId, int quantity) async {
    _setLoading(true);
    try {
      await _cartService.updateQuantity(itemId, quantity);
      await loadCartItems();
    } catch (e) {
      _setError(e.toString());
    } finally {
      _setLoading(false);
    }
  }
  
  Future<void> removeItem(String itemId) async {
    _setLoading(true);
    try {
      await _cartService.removeFromCart(itemId);
      await loadCartItems();
    } catch (e) {
      _setError(e.toString());
    } finally {
      _setLoading(false);
    }
  }
  
  Future<void> clearCart() async {
    _setLoading(true);
    try {
      await _cartService.clearCart();
      _items = [];
    } catch (e) {
      _setError(e.toString());
    } finally {
      _setLoading(false);
    }
  }
  
  void _setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }
  
  void _setError(String error) {
    _error = error;
    notifyListeners();
  }
  
  void clearError() {
    _error = null;
    notifyListeners();
  }
  
  // Add CartItem directly (for testing)
  void addCartItem(CartItem item) {
    _items.add(item);
    notifyListeners();
  }
} 