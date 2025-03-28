import 'package:flutter/foundation.dart';
import 'package:nrc_app/models/user.dart';
import 'package:nrc_app/services/auth_service.dart';

class AuthProvider with ChangeNotifier {
  final AuthService _authService = AuthService();
  User _currentUser = User.guest();
  bool _isLoading = false;
  String? _error;

  User get currentUser => _currentUser;
  bool get isLoading => _isLoading;
  String? get error => _error;
  bool get isAuthenticated => _currentUser.isAuthenticated;

  AuthProvider() {
    _loadUser();
  }

  Future<void> _loadUser() async {
    _setLoading(true);
    try {
      final isAuth = await _authService.isAuthenticated();
      if (isAuth) {
        _currentUser = await _authService.getCurrentUser();
      }
    } catch (e) {
      _setError(e.toString());
    } finally {
      _setLoading(false);
    }
  }

  Future<bool> signIn(String email, String password) async {
    _setLoading(true);
    _clearError();
    try {
      _currentUser = await _authService.signIn(email, password);
      return true;
    } catch (e) {
      _setError(e.toString());
      return false;
    } finally {
      _setLoading(false);
    }
  }

  Future<bool> register(String name, String email, String password) async {
    _setLoading(true);
    _clearError();
    try {
      _currentUser = await _authService.register(name, email, password);
      return true;
    } catch (e) {
      _setError(e.toString());
      return false;
    } finally {
      _setLoading(false);
    }
  }

  Future<void> signOut() async {
    _setLoading(true);
    try {
      await _authService.signOut();
      _currentUser = User.guest();
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

  void _clearError() {
    _error = null;
    notifyListeners();
  }
} 