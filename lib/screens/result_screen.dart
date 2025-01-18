
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz_flow/providers/quiz_provider.dart';

class ResultScreen extends ConsumerWidget{
  const ResultScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final score = ref.watch(userScoreProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz Completed'),
      ),
      body: Center(
        child: Column(
          children: [
            Text('Your Score: $score'),
            ElevatedButton(onPressed: () {
              ref.read(currentQuestionIndexProvider.notifier).state = 0;
              ref.read(userScoreProvider.notifier).state = 0;
              ref.read(isQuizCompletedProvider.notifier).state = false;

              Navigator.pop(context);
            }, child: Text('Restart Quiz'))
          ],
        ),
      ),
    );
  }
}