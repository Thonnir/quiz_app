import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:quiz_app/results_screen.dart';

void main() {
  testWidgets('counts only the answers that match the correct ones', (
    tester,
  ) async {
    const chosenAnswers = [
      'Arthas Menethil', // correct
      'Draenor',
      'Thrall', // correct
      'Stormwind',
      'Archimonde',
      'Frostmourne', // correct
      'Deathwing',
      'Cenarius',
    ];

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: ResultsScreen(chosenAnswers: chosenAnswers, onRestart: () {}),
        ),
      ),
    );

    expect(find.text('Správne odpovede: 3 z 8'), findsOneWidget);
  });
}
