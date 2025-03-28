class User {
  final String id;
  final String name;
  final String email;
  final String? profileImageUrl;
  final bool isAuthenticated;

  User({
    required this.id,
    required this.name,
    required this.email,
    this.profileImageUrl,
    this.isAuthenticated = false,
  });

  User.guest()
      : id = '',
        name = 'Guest',
        email = '',
        profileImageUrl = null,
        isAuthenticated = false;

  User copyWith({
    String? id,
    String? name,
    String? email,
    String? profileImageUrl,
    bool? isAuthenticated,
  }) {
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      profileImageUrl: profileImageUrl ?? this.profileImageUrl,
      isAuthenticated: isAuthenticated ?? this.isAuthenticated,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'profileImageUrl': profileImageUrl,
    };
  }

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
      profileImageUrl: json['profileImageUrl'] as String?,
      isAuthenticated: true,
    );
  }
} 