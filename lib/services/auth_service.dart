import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:nrc_app/models/user.dart';

class AuthService {
  final FlutterSecureStorage _secureStorage = const FlutterSecureStorage();
  
  // Sign in with email and password
  Future<User> signIn(String email, String password) async {
    // In a real app, this would make an API call to authenticate
    return Future.delayed(
      const Duration(milliseconds: 1000),
      () {
        // Mock successful authentication
        if (email == 'test@example.com' && password == 'password') {
          final user = User(
            id: '1',
            name: 'Test User',
            email: email,
            isAuthenticated: true,
          );
          
          // Save authentication token
          _saveAuthToken('mock_token_12345');
          
          return user;
        } else {
          throw Exception('Invalid email or password');
        }
      },
    );
  }
  
  // Register new user
  Future<User> register(String name, String email, String password) async {
    // In a real app, this would make an API call to register
    return Future.delayed(
      const Duration(milliseconds: 1200),
      () {
        // Mock successful registration
        final user = User(
          id: '2',
          name: name,
          email: email,
          isAuthenticated: true,
        );
        
        // Save authentication token
        _saveAuthToken('mock_token_register_67890');
        
        return user;
      },
    );
  }
  
  // Sign out
  Future<void> signOut() async {
    // Clear authentication token
    await _secureStorage.delete(key: 'auth_token');
  }
  
  // Check if user is authenticated
  Future<bool> isAuthenticated() async {
    final token = await _secureStorage.read(key: 'auth_token');
    return token != null;
  }
  
  // Get current user
  Future<User> getCurrentUser() async {
    final token = await _secureStorage.read(key: 'auth_token');
    
    if (token != null) {
      // In a real app, this would verify the token and get user details
      return Future.delayed(
        const Duration(milliseconds: 500),
        () => User(
          id: '1',
          name: 'Test User',
          email: 'test@example.com',
          isAuthenticated: true,
        ),
      );
    } else {
      return User.guest();
    }
  }
  
  // Save authentication token
  Future<void> _saveAuthToken(String token) async {
    await _secureStorage.write(key: 'auth_token', value: token);
  }
} 