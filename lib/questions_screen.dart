import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/models/answer_button.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key, required this.onSelectAnswer});

  final void Function(String answer) onSelectAnswer;

  @override
  State<QuestionsScreen> createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  int currentQuestionIndex = 0;

  // Shuffled once per question, so rebuilds don't reorder the buttons.
  late List<String> shuffledAnswers;

  @override
  void initState() {
    super.initState();
    shuffledAnswers = questions[currentQuestionIndex].getShuffledAnswers();
  }

  void answerQuestion(String selectedAnswer) {
    widget.onSelectAnswer(selectedAnswer);

    if (currentQuestionIndex == questions.length - 1) {
      return;
    }

    setState(() {
      currentQuestionIndex++;
      shuffledAnswers = questions[currentQuestionIndex].getShuffledAnswers();
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[currentQuestionIndex];

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Otázka ${currentQuestionIndex + 1} z ${questions.length}',
              textAlign: TextAlign.center,
              style: const TextStyle(color: Color(0xFFF3E5C0)),
            ),
            const SizedBox(height: 12),
            Text(
              currentQuestion.text,
              textAlign: TextAlign.center,
              style: GoogleFonts.cinzel(
                color: const Color(0xFFD4AF37),
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 30),
            ...shuffledAnswers.map((answer) {
              return AnswerButton(
                answerText: answer,
                onTap: () => answerQuestion(answer),
              );
            }),
          ],
        ),
      ),
    );
  }
}
