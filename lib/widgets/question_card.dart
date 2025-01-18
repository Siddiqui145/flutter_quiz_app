import 'package:flutter/material.dart';

class QuestionCard extends StatelessWidget {
  final String questionText;

  const QuestionCard({super.key, required this.questionText});
  

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: 16,
        horizontal: 24
      ),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.blue[50],
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 8,
            offset: Offset(0, 4)
          )
        ]
      ),
      child: Text(questionText,
      style: Theme.of(context).textTheme.titleMedium!.copyWith(
        color: Colors.blue[900]
      ),
      textAlign: TextAlign.center,),
    );
  }
}