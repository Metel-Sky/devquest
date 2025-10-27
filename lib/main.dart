import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'screens/login/login_screen.dart';
import 'screens/login/logged_in_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const DevAcademyApp());
}

class DevAcademyApp extends StatelessWidget {
  const DevAcademyApp({super.key});

  Future<bool> checkLoginStatus() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.containsKey('email');
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dev Academy',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
        useMaterial3: true,
      ),
      home: FutureBuilder<bool>(
        future: checkLoginStatus(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Scaffold(
              body: Center(child: CircularProgressIndicator()),
            );
          }
          final loggedIn = snapshot.data!;
          return loggedIn
              ? const LoggedInScreen()
              : const LoginScreen();
        },
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
