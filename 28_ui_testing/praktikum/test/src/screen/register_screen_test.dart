import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:praktikum/src/screen/register_screen.dart';

void main() {
  group('Register Screen', () {
    testWidgets('terdapat icon twitter', (tester) async {
      await tester.pumpWidget(
        const ProviderScope(child: MaterialApp(home: RegisterScreen())),
      );

      final icon = find.byType(SvgPicture);
      expect(icon, findsOneWidget);
    });

    testWidgets('terdapat title', (tester) async {
      await tester.pumpWidget(
        const ProviderScope(child: MaterialApp(home: RegisterScreen())),
      );

      final title = find.text('Create your account');
      expect(title, findsOneWidget);
    });

    testWidgets('terdapat 4 text form field', (tester) async {
      await tester.pumpWidget(
        const ProviderScope(child: MaterialApp(home: RegisterScreen())),
      );

      final firstName = find.text('First Name');
      final lastName = find.text('Last Name');
      final email = find.text('Email');
      final password = find.text('Password');

      expect(firstName, findsOneWidget);
      expect(lastName, findsOneWidget);
      expect(email, findsOneWidget);
      expect(password, findsOneWidget);
    });

    testWidgets('terdapat button register', (tester) async {
      await tester.pumpWidget(
        const ProviderScope(child: MaterialApp(home: RegisterScreen())),
      );

      final button = find.text('Register');
      expect(button, findsOneWidget);
    });
  });
}
