import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:praktikum/src/screen/welcome_screen.dart';

void main() {
  group('Welcome Screen', () {
    testWidgets('terdapat icon twitter', (tester) async {
      await tester.pumpWidget(const MaterialApp(home: WelcomeScreen()));
      final icon = find.byKey(const ValueKey('svgIcon'));
      expect(icon, findsOneWidget);
    });

    testWidgets('terdapat title text', (tester) async {
      await tester.pumpWidget(const MaterialApp(home: WelcomeScreen()));
      final title = find.text("See what's happening in the world right now.");
      expect(title, findsOneWidget);
    });

    testWidgets('terdapat 2 button', (tester) async {
      await tester.pumpWidget(const MaterialApp(home: WelcomeScreen()));
      final button1 = find.text('Continue with Google');
      final button2 = find.text('Create account');
      expect(button1, findsOneWidget);
      expect(button2, findsOneWidget);
    });

    testWidgets('terdapat text button Log in', (tester) async {
      await tester.pumpWidget(const MaterialApp(home: WelcomeScreen()));
      final textButton = find.text('Log in');
      expect(textButton, findsOneWidget);
    });
  });
}
