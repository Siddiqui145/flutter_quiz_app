import 'package:flutter/material.dart';
import 'quiz_screen.dart';
import 'package:flutter_animate/flutter_animate.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Flutter Quiz App'),
      centerTitle: true,
      backgroundColor: Colors.blue,),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Welcome to the Quiz!',
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ).animate().fadeIn(duration: 2.seconds),
            SizedBox(height: 24.0),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: Size(150, 35),
                backgroundColor: Colors.green.shade400
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => QuizScreen()),
                );
              },
              child: Text('Start Quiz',
              style: Theme.of(context).textTheme.titleSmall
              ),
            ).animate().shake(duration: 3.seconds),
          ],
        ),
      ),
    );
  }
}