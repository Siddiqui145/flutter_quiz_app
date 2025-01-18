import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz_flow/providers/quiz_provider.dart';
import 'package:quiz_flow/screens/result_screen.dart';

class QuizScreen extends ConsumerWidget{
  const QuizScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final questions = ref.watch(quizQuestionsProvider);

    return questions.when(
      error: (err, stack) => Center(child: Text('Error loading questions'),), 
      loading: () => Center(child: CircularProgressIndicator(),),
      data: (questions) {
        final currentIndex = ref.watch(currentQuestionIndexProvider);
        final isCompleted = ref.watch(isQuizCompletedProvider);

        if (isCompleted) {
          return ResultScreen();
        }

        return Scaffold(
          appBar: AppBar(
            title: Text('Quiz'),
          ),
          body: Column(
            children: [
              Text(questions[currentIndex].question),...questions[currentIndex].options.asMap().entries.map((entry) => ElevatedButton(onPressed: () {
                final correctAnswerIndex = questions[currentIndex].correctAnswerIndex;

                if(entry.key == correctAnswerIndex) {
                  ref.read(userScoreProvider.notifier).state++;
                }
                if (currentIndex + 1 < questions.length) {
                  ref.read(currentQuestionIndexProvider.notifier).state++;
                }
                else{
                  ref.read(isQuizCompletedProvider.notifier).state = true;
                }
              }, child: Text(entry.value)))
            ],
          ),
        );
      });
  }
}