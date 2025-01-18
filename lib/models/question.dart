import 'option.dart';

class Question {
  final String description;
  final List<Option> options;

  Question({
    required this.description,
    required this.options,
  });

  factory Question.fromJson(Map<String, dynamic> json) {
    return Question(
      description: json['description'] as String,
      options: (json['options'] as List<dynamic>)
          .map((option) => Option.fromJson(option))
          .toList(),
    );
  }
}
