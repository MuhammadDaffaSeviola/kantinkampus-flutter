import 'package:flutter/foundation.dart';

import '../../data/repositories/auth_repository.dart';

class AuthViewModel extends ChangeNotifier {
  final AuthRepository authRepository;

  AuthViewModel({AuthRepository? authRepository})
    : authRepository = authRepository ?? AuthRepository();

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  bool _isLoggedIn = false;
  bool get isLoggedIn => _isLoggedIn;

  Map<String, dynamic>? _user;
  Map<String, dynamic>? get user => _user;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  Future<bool> login({required String email, required String password}) async {
    _setLoading(true);
    _errorMessage = null;

    try {
      final data = await authRepository.login(email: email, password: password);

      _user = data['user'] as Map<String, dynamic>?;
      _isLoggedIn = true;

      return true;
    } catch (e) {
      _isLoggedIn = false;
      _errorMessage = _cleanErrorMessage(e);

      return false;
    } finally {
      _setLoading(false);
    }
  }

  Future<bool> loadCurrentUser() async {
    _setLoading(true);
    _errorMessage = null;

    try {
      final loggedIn = await authRepository.isLoggedIn();

      if (!loggedIn) {
        _isLoggedIn = false;
        _user = null;
        return false;
      }

      _user = await authRepository.getCurrentUser();
      _isLoggedIn = true;

      return true;
    } catch (e) {
      _isLoggedIn = false;
      _user = null;
      _errorMessage = _cleanErrorMessage(e);

      return false;
    } finally {
      _setLoading(false);
    }
  }

  Future<void> logout() async {
    _setLoading(true);

    try {
      await authRepository.logout();
    } finally {
      _isLoggedIn = false;
      _user = null;
      _errorMessage = null;
      _setLoading(false);
    }
  }

  void clearError() {
    _errorMessage = null;
    notifyListeners();
  }

  void _setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  String _cleanErrorMessage(Object error) {
    final message = error.toString();

    if (message.startsWith('ApiException')) {
      final separator = message.indexOf(':');

      if (separator != -1) {
        return message.substring(separator + 1).trim();
      }
    }

    return message.replaceFirst('Exception: ', '');
  }
}
