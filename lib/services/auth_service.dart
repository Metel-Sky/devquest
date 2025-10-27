import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  Future<bool> register(String email, String password) async {
    final prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey('email')) return false; // вже є акаунт
    await prefs.setString('email', email);
    await prefs.setString('password', password);
    return true;
  }

  Future<bool> login(String email, String password) async {
    final prefs = await SharedPreferences.getInstance();
    final savedEmail = prefs.getString('email');
    final savedPassword = prefs.getString('password');
    return email == savedEmail && password == savedPassword;
  }

  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }

  Future<bool> isLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.containsKey('email');
  }
}
