import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/quiz_provider.dart';
import '../widgets/question_card.dart';
import '../widgets/option_button.dart';
import 'result_screen.dart';

class QuizScreen extends ConsumerWidget {
  const QuizScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final quiz = ref.watch(quizProvider);

    return quiz.when(
      loading: () => Center(child: CircularProgressIndicator()),
      error: (error, stack) {
        return Center(
          child: Text('Error loading quiz: $error'),
        );
      },
      data: (quiz) {
        final currentIndex = ref.watch(currentQuestionIndexProvider);
        final isCompleted = ref.watch(isQuizCompletedProvider);

        if (isCompleted) {
          return ResultScreen();
        }

        final currentQuestion = quiz.questions[currentIndex];

        return Scaffold(
          appBar: AppBar(
            title: Text(quiz.title),
            backgroundColor: Colors.blue,
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 25,),
              QuestionCard(questionText: currentQuestion.description),
              ...currentQuestion.options.map(
                (option) => OptionButton(
                  text: option.description,
                  onPressed: () {
                    if (option.isCorrect) {
                      ref.read(userScoreProvider.notifier).state++;
                    }

                    if (currentIndex + 1 < quiz.questions.length) {
                      ref.read(currentQuestionIndexProvider.notifier).state++;
                    } else {
                      ref.read(isQuizCompletedProvider.notifier).state = true;
                    }
                  },
                ),
              )
            ],
          ).animate().slide(
            duration: 2.seconds
          )
        );
      },
    );
  }
}
