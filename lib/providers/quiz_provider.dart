import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz_flow/models/question.dart';
import 'package:quiz_flow/services/quiz_service.dart';

final quizServiceProvider = Provider((ref) => QuizService());

final quizQuestionsProvider = FutureProvider<List<Question>>((ref) {
  final quizService = ref.read(quizServiceProvider);
  return quizService.fetchQuestions();
});

final currentQuestionIndexProvider = StateProvider<int>((ref) => 0);

final userScoreProvider = StateProvider<int>((ref) => 0);

final isQuizCompletedProvider = StateProvider<bool>((ref) => false);