import 'package:flutter/material.dart';

class AcademyScreen extends StatefulWidget {
  const AcademyScreen({super.key});

  @override
  State<AcademyScreen> createState() => _AcademyScreenState();
}

class _AcademyScreenState extends State<AcademyScreen> {
  int currentQuestion = 0;
  int score = 0;

  final questions = [
    {
      'question': 'Який тип даних зберігає текст?',
      'options': ['int', 'String', 'bool'],
      'answer': 'String',
    },
    {
      'question': 'Що робить оператор if?',
      'options': [
        'Повторює дії багато разів',
        'Перевіряє умову',
        'Зберігає значення'
      ],
      'answer': 'Перевіряє умову',
    }
  ];

  void checkAnswer(String selected) {
    if (selected == questions[currentQuestion]['answer']) score++;
    if (currentQuestion < questions.length - 1) {
      setState(() => currentQuestion++);
    } else {
      Navigator.pushNamed(context, '/path_select');
    }
  }

  @override
  Widget build(BuildContext context) {
    final q = questions[currentQuestion];
    return Scaffold(
      appBar: AppBar(title: const Text('Академія Основ'),centerTitle: true),
      body: Center(

        child: Padding(

          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(q['question'] as String,
                  style: const TextStyle(fontSize: 20)),
              const SizedBox(height: 20),
              ...(q['options'] as List<String>).map((opt) => ElevatedButton(
                onPressed: () => checkAnswer(opt),
                child: Text(opt),
              )),
            ],
          ),
        ),
      ),
    );
  }
}
