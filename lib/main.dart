import 'package:flutter/material.dart';
import 'screens/login/login_screen.dart';
import 'screens/login/register_screen.dart';
import 'screens/login/logged_in_screen.dart';
import 'screens/academy/academy_screen.dart';




void main() {
  runApp(const DevQuest());
}

class DevQuest extends StatelessWidget {
  const DevQuest({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DevQuest',
      theme: ThemeData.dark(),
      initialRoute: '/login',
      routes: {
        '/login': (context) => const LoginScreen(),
        '/register': (context) => const RegisterScreen(),
        '/logged_in': (context) => const LoggedInScreen(),
        '/academy': (context) => const AcademyScreen(),
      },
    );
  }
}