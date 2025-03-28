import 'package:flutter/foundation.dart';
import 'package:nrc_app/models/product.dart';
import 'package:nrc_app/services/product_service.dart';

class ProductProvider with ChangeNotifier {
  final ProductService _productService = ProductService();
  
  List<Product> _products = [];
  List<Product> _filteredProducts = [];
  Product? _selectedProduct;
  bool _isLoading = false;
  String? _error;
  
  List<Product> get products => _products;
  List<Product> get filteredProducts => _filteredProducts;
  Product? get selectedProduct => _selectedProduct;
  bool get isLoading => _isLoading;
  String? get error => _error;
  
  Future<void> loadProducts() async {
    _setLoading(true);
    try {
      _products = await _productService.getAllProducts();
      _filteredProducts = List.from(_products);
    } catch (e) {
      _setError(e.toString());
    } finally {
      _setLoading(false);
    }
  }
  
  Future<void> loadProductById(String id) async {
    _setLoading(true);
    try {
      _selectedProduct = await _productService.getProductById(id);
    } catch (e) {
      _setError(e.toString());
    } finally {
      _setLoading(false);
    }
  }
  
  Future<void> searchProducts(String query) async {
    if (query.isEmpty) {
      _filteredProducts = List.from(_products);
      notifyListeners();
      return;
    }
    
    _setLoading(true);
    try {
      _filteredProducts = await _productService.searchProducts(query);
    } catch (e) {
      _setError(e.toString());
    } finally {
      _setLoading(false);
    }
  }
  
  Future<void> filterByCategory(String category) async {
    _setLoading(true);
    try {
      if (category.isEmpty || category == 'All') {
        _filteredProducts = List.from(_products);
      } else {
        _filteredProducts = await _productService.getProductsByCategory(category);
      }
    } catch (e) {
      _setError(e.toString());
    } finally {
      _setLoading(false);
    }
  }
  
  List<String> get categories {
    final Set<String> categorySet = {'All'};
    for (final product in _products) {
      categorySet.add(product.category);
    }
    return categorySet.toList();
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
} 