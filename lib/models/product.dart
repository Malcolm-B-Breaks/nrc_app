class Product {
  final String id;
  final String name;
  final String description;
  final double price;
  final List<String> images;
  final String category;
  final int stock;
  final Map<String, String> specifications;
  final List<String> relatedProducts;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.images,
    required this.category,
    required this.stock,
    required this.specifications,
    required this.relatedProducts,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'price': price,
      'images': images,
      'category': category,
      'stock': stock,
      'specifications': specifications,
      'relatedProducts': relatedProducts,
    };
  }

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      price: json['price'] as double,
      images: List<String>.from(json['images'] as List),
      category: json['category'] as String,
      stock: json['stock'] as int,
      specifications: Map<String, String>.from(json['specifications'] as Map),
      relatedProducts: List<String>.from(json['relatedProducts'] as List),
    );
  }
} 