import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/quiz.dart';
import '../services/quiz_service.dart';

final quizServiceProvider = Provider((ref) => QuizService());

final quizProvider = FutureProvider<Quiz>((ref) {
  final quizService = ref.read(quizServiceProvider);
  return quizService.fetchQuiz();
});

final currentQuestionIndexProvider = StateProvider<int>((ref) => 0);

final userScoreProvider = StateProvider<int>((ref) => 0);

final isQuizCompletedProvider = StateProvider<bool>((ref) => false);