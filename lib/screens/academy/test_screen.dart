import 'package:flutter/material.dart';

class TestScreen extends StatefulWidget {
  final String title;
  final List<Map<String, dynamic>> questions;
  final VoidCallback onPassed;

  const TestScreen({
    super.key,
    required this.title,
    required this.questions,
    required this.onPassed,
  });

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  int index = 0;
  int score = 0;

  void checkAnswer(String answer) {
    if (answer == widget.questions[index]['answer']) score++;
    if (index < widget.questions.length - 1) {
      setState(() => index++);
    } else {
      final success = score / widget.questions.length >= 0.7;
      if (success) {
        widget.onPassed();
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Спробуй ще раз 🧠')),
        );
        setState(() {
          index = 0;
          score = 0;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final q = widget.questions[index];
    return Scaffold(
      appBar: AppBar(title: Text(widget.title), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Text(q['question'], style: const TextStyle(fontSize: 20)),
            const SizedBox(height: 20),
            ...(q['options'] as List<String>).map((opt) => ElevatedButton(
              onPressed: () => checkAnswer(opt),
              child: Text(opt),
            )),
          ],
        ),
      ),
    );
  }
}
