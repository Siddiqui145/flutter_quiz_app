import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:quiz_flow/models/question.dart';

class QuizService {

  final String apiUrl = "https://api.jsonserve.com/Uw5CrX";

  Future<List<Question>> fetchQuestions() async {
    try {
      final response = await http.get(Uri.parse(apiUrl));

      if(response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);
        return data.map((json) => Question.fromJson(json)).toList();
      }
      else {
        throw Exception('Failed to load data');
      }
    }
    catch (e) {
      throw Exception('Error fetching data: $e');
    }
  }
}