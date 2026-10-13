import 'package:shared_preferences/shared_preferences.dart';

import '../services/api_service.dart';

class AuthRepository {
  final ApiService apiService;

  AuthRepository({ApiService? apiService})
    : apiService = apiService ?? ApiService();

  Future<Map<String, dynamic>> login({
    required String email,
    required String password,
  }) async {
    final response = await apiService.post(
      '/auth/login',
      body: {'email': email, 'password': password},
    );

    final data = response['data'] as Map<String, dynamic>;
    final token = data['token']?.toString();

    if (token == null || token.isEmpty) {
      throw Exception('Token login tidak ditemukan.');
    }

    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', token);

    return data;
  }

  Future<Map<String, dynamic>> getCurrentUser() async {
    final response = await apiService.get('/user', requiresAuth: true);

    return response['data'] as Map<String, dynamic>;
  }

  Future<void> logout() async {
    try {
      await apiService.post('/auth/logout', requiresAuth: true);
    } finally {
      final prefs = await SharedPreferences.getInstance();
      await prefs.remove('token');
    }
  }

  Future<bool> isLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');

    return token != null && token.isNotEmpty;
  }
}
