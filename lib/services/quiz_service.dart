import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/quiz.dart';

class QuizService {
  final String apiUrl = "https://api.jsonserve.com/Uw5CrX";

  Future<Quiz> fetchQuiz() async {
    try {
      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = jsonDecode(response.body);
        return Quiz.fromJson(data);
      } else {
        throw Exception('Failed to load data from server.');
      }
    } catch (e) {
      throw Exception('Error fetching quiz: $e');
    }
  }
}
