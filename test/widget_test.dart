import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:myportfolio/app.dart';

void _setView(WidgetTester tester, Size size) {
  tester.view.physicalSize = size;
  tester.view.devicePixelRatio = 1.0;
  addTearDown(tester.view.reset);
}

Future<void> _pumpApp(WidgetTester tester) async {
  await tester.pumpWidget(const PortfolioApp());
  await tester.pump(const Duration(seconds: 1));
}

void main() {
  testWidgets('portfolio renders hero with name and nav sections',
      (WidgetTester tester) async {
    _setView(tester, const Size(1400, 900));
    await _pumpApp(tester);

    expect(find.textContaining('Akshay Patgar'), findsWidgets);
    expect(find.text('1. home'), findsOneWidget);
    expect(find.text('4. projects'), findsOneWidget);
  });

  testWidgets('single-page layout contains experience content after scrolling',
      (WidgetTester tester) async {
    _setView(tester, const Size(1400, 900));
    await _pumpApp(tester);

    // Scroll the page content down to reveal the experience section.
    await tester.drag(find.byType(SingleChildScrollView), const Offset(0, -2600));
    await tester.pump(const Duration(seconds: 1));
    await tester.pump(const Duration(milliseconds: 200));

    expect(find.text('@ GeekyAnts India Pvt Ltd'), findsOneWidget);
    expect(
        find.text('@ Mobil80 Solutions and Services Pvt Ltd'), findsOneWidget);
  });

  testWidgets('compact layout shows popup menu instead of inline nav',
      (WidgetTester tester) async {
    _setView(tester, const Size(500, 800));
    await _pumpApp(tester);

    expect(find.text('1. home'), findsNothing);
  });
}
