import 'package:task_quiz_app/models/answer.dart';
import 'package:flutter/material.dart';

class QuestionsAnswers {
  final String question;
  final List<Answer> answers;
  final String correct;

  QuestionsAnswers(
      {required this.question, required this.answers, required this.correct});

  static List<QuestionsAnswers> dummyData() {
    return [
      QuestionsAnswers(
          question: 'Which language is primarily used for Android app development?',
          answers: [
            Answer(tittle: 'Swift', icon: Icons.home),
            Answer(tittle: 'Python', icon: Icons.store),
            Answer(tittle: 'Java', icon: Icons.notifications),
            Answer(tittle: 'C#', icon: Icons.fastfood),
          ],
          correct: 'Java'),
      QuestionsAnswers(
          question: 'Which planet is known as the Red Planet?',
          answers: [
            Answer(tittle: 'Mars', icon: Icons.home),
            Answer(tittle: 'Jupiter', icon: Icons.store),
            Answer(tittle: 'Saturn', icon: Icons.notifications),
            Answer(tittle: 'Venus', icon: Icons.fastfood),
          ],
          correct: 'Mars'),
      QuestionsAnswers(
          question: 'What is the chemical symbol for water?',
          answers: [
            Answer(tittle: 'O', icon: Icons.home),
            Answer(tittle: 'H', icon: Icons.store),
            Answer(tittle: 'H2O', icon: Icons.notifications),
            Answer(tittle: 'CO2', icon: Icons.fastfood),
          ],
          correct: 'H2O'),
      QuestionsAnswers(
          question: 'Who is known for developing the theory of relativity?',
          answers: [
            Answer(tittle: 'Isaac Newton', icon: Icons.home),
            Answer(tittle: 'Albert Einstein', icon: Icons.store),
            Answer(tittle: 'Nikola Tesla', icon: Icons.notifications),
            Answer(tittle: 'Stephen Hawking', icon: Icons.fastfood),
          ],
          correct: 'Albert Einstein'),

           QuestionsAnswers(
          question: 'What is the smallest prime number?',
          answers: [
            Answer(tittle: '1', icon: Icons.home),
            Answer(tittle: '2', icon: Icons.store),
            Answer(tittle: '3', icon: Icons.notifications),
            Answer(tittle: '5', icon: Icons.fastfood),
          ],
          correct: '2'),
    ];
  }
}
