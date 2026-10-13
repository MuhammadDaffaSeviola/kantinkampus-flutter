import 'package:flutter_test/flutter_test.dart';

import 'package:kantinkampus_flutter/app/app.dart';

void main() {
  testWidgets('KantinKampus app loads', (WidgetTester tester) async {
    await tester.pumpWidget(const KantinKampusApp());

    expect(find.text('KantinKampus'), findsOneWidget);
  });
}