import 'package:flutter_test/flutter_test.dart';
import 'package:quiz_app/models/quiz_question.dart';

void main() {
  const question = QuizQuestion('Kto viedol Hordu do Kalimdoru?', [
    'Thrall',
    'Garrosh',
    'Grom',
    'Vol\'jin',
  ]);

  test('shuffled answers contain exactly the original answers', () {
    final shuffled = question.getShuffledAnswers();

    expect(
      shuffled,
      unorderedEquals(['Thrall', 'Garrosh', 'Grom', 'Vol\'jin']),
    );
  });

  test('shuffling leaves the correct answer first in the original', () {
    for (var i = 0; i < 20; i++) {
      question.getShuffledAnswers();
    }

    expect(question.answers.first, 'Thrall');
  });
}
