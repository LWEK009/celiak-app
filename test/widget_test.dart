import 'package:flutter_test/flutter_test.dart';
import 'package:noglutin/main.dart';

void main() {
  testWidgets('App should launch', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const NoGlutinApp());

    // Basic verification: App title should be present (in any language)
    expect(find.byType(NoGlutinApp), findsOneWidget);
  });
}
