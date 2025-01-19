
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
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
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Your Score: $score / 10',
            style: Theme.of(context).textTheme.titleLarge,).animate().fadeIn(duration: 4.seconds),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: Size(150, 35),
                backgroundColor: const Color.fromARGB(255, 209, 144, 86)
              ),
              onPressed: () {
              ref.read(currentQuestionIndexProvider.notifier).state = 0;
              ref.read(userScoreProvider.notifier).state = 0;
              ref.read(isQuizCompletedProvider.notifier).state = false;

              Navigator.pop(context);
            }, child: Text('Restart Quiz',
            style: Theme.of(context).textTheme.titleSmall,))
          ],
        ),
      ),
    );
  }
}