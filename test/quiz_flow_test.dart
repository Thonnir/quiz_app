import 'package:flutter_test/flutter_test.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/quiz.dart';

void main() {
  testWidgets('start, answer every question, see results, restart', (
    tester,
  ) async {
    await tester.pumpWidget(const Quiz());

    await tester.tap(find.text('Začať kvíz'));
    await tester.pump();

    for (final question in questions) {
      expect(find.text(question.text), findsOneWidget);
      await tester.tap(find.text(question.answers.first));
      await tester.pump();
    }

    expect(find.text('Správne odpovede: 8 z 8'), findsOneWidget);

    await tester.tap(find.text('Reštartovať kvíz'));
    await tester.pump();

    expect(find.textContaining('Správne odpovede'), findsNothing);
    expect(find.text(questions.first.text), findsOneWidget);
  });
}
