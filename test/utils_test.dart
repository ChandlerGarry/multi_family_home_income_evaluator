import 'package:finance_helper/utils/double_to_dollar_string.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Utility Methods Test', () {
    double testDouble = 143.86;
    double testDouble1 = 12345.229;
    double testDouble2 = 0.229;
    expect(doubleToDollar(testDouble), '\$143.86');
    expect(doubleToDollar(testDouble1), '\$12,345.23');
    expect(doubleToDollar(testDouble2), '\$0.23');
  });

  // testWidgets('Counter increments smoke test', (WidgetTester tester) async {
  //   // Build our app and trigger a frame.
  //   await tester.pumpWidget(const MyApp());

  //   // Verify that our counter starts at 0.
  //   expect(find.text('0'), findsOneWidget);
  //   expect(find.text('1'), findsNothing);

  //   // Tap the '+' icon and trigger a frame.
  //   await tester.tap(find.byIcon(Icons.add));
  //   await tester.pump();

  //   // Verify that our counter has incremented.
  //   expect(find.text('0'), findsNothing);
  //   expect(find.text('1'), findsOneWidget);
  // });
}
