import 'package:flutter/material.dart';

class LearningScreen extends StatelessWidget {
  final String title;
  final String content;
  final VoidCallback onNext;

  const LearningScreen({
    super.key,
    required this.title,
    required this.content,
    required this.onNext,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(content, style: const TextStyle(fontSize: 18)),
              const SizedBox(height: 30),
              Center(
                child: ElevatedButton(
                  onPressed: onNext,
                  child: const Text('Перейти до тесту'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
