import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:praktikum/src/screen/login_screen.dart';

void main() {
  group('Login Screen', () {
    testWidgets('terdapat icon twitter', (tester) async {
      await tester.pumpWidget(
        const ProviderScope(child: MaterialApp(home: LoginScreen())),
      );
      final icon = find.byType(SvgPicture);
      expect(icon, findsOneWidget);
    });

    testWidgets('terdapat title', (tester) async {
      await tester.pumpWidget(
        const ProviderScope(child: MaterialApp(home: LoginScreen())),
      );
    });

    testWidgets('terdapat 2 text form field', (tester) async {
      await tester.pumpWidget(
        const ProviderScope(child: MaterialApp(home: LoginScreen())),
      );
    });

    testWidgets('terdapat 2 button', (tester) async {
      await tester.pumpWidget(
        const ProviderScope(child: MaterialApp(home: LoginScreen())),
      );
    });
  });
}
