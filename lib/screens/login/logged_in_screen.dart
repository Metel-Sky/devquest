import 'package:flutter/material.dart';
import '../../services/auth_service.dart';
import '../academy/academy_screen.dart';

class LoggedInScreen extends StatelessWidget {
  const LoggedInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final auth = AuthService();
    return Scaffold(
      appBar: AppBar(title: const Text('Вітаємо!'), centerTitle: true),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Ви увійшли до гри.'),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => const AcademyScreen()),
              ),
              child: const Text('Перейти до Академії'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () async {
                await auth.logout();
                Navigator.pushReplacementNamed(context, '/login');
              },
              child: const Text('Вийти'),
            ),
          ],
        ),
      ),
    );
  }
}
