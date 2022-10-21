import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:praktikum/src/model/user_model.dart';
import 'package:praktikum/src/screen/home_screen.dart';
import 'package:praktikum/src/view_model/register_view_model.dart';

void main() {
  group('Home Screen', () {
    late ChangeNotifierProvider<RegisterNotifier> temporaryProvider;

    setUp(() {
      temporaryProvider = ChangeNotifierProvider((ref) {
        var registerNotifier = RegisterNotifier();
        registerNotifier.setUser(User(
          id: 123,
          firstName: 'Yasha',
          lastName: 'Gozwan',
          email: 'yasha@gmail.com',
          password: '123456',
        ));
        return registerNotifier;
      });
    });

    testWidgets('terdapat nama lengkap', (tester) async {
      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            registerViewModel.overrideWithProvider(temporaryProvider),
          ],
          child: const MaterialApp(home: HomeScreen()),
        ),
      );

      final fullName = find.text('Yasha Gozwan');
      expect(fullName, findsOneWidget);
    });

    testWidgets('terdapat username', (tester) async {
      await tester.pumpWidget(ProviderScope(
        overrides: [
          registerViewModel.overrideWithProvider(temporaryProvider),
        ],
        child: const MaterialApp(home: HomeScreen()),
      ));

      final username = find.text('@Yasha');
      expect(username, findsOneWidget);
    });

    testWidgets('terdapat email', (tester) async {
      await tester.pumpWidget(ProviderScope(
        overrides: [
          registerViewModel.overrideWithProvider(temporaryProvider),
        ],
        child: const MaterialApp(home: HomeScreen()),
      ));

      final email = find.text('yasha@gmail.com');
      expect(email, findsOneWidget);
    });

    testWidgets('terdapat icon twitter', (tester) async {
      await tester.pumpWidget(ProviderScope(
        overrides: [
          registerViewModel.overrideWithProvider(temporaryProvider),
        ],
        child: const MaterialApp(home: HomeScreen()),
      ));

      final icon = find.byType(SvgPicture);
      expect(icon, findsOneWidget);
    });

    testWidgets('terdapat message', (tester) async {
      await tester.pumpWidget(ProviderScope(
        overrides: [
          registerViewModel.overrideWithProvider(temporaryProvider),
        ],
        child: const MaterialApp(home: HomeScreen()),
      ));

      final message = find.text('Hello Flutter UI Testing 🔥');
      expect(message, findsOneWidget);
    });

    testWidgets('terdapat hash tag', (tester) async {
      await tester.pumpWidget(ProviderScope(
        overrides: [
          registerViewModel.overrideWithProvider(temporaryProvider),
        ],
        child: const MaterialApp(home: HomeScreen()),
      ));

      final hashTag = find.text('#testing');
      expect(hashTag, findsOneWidget);
    });

    testWidgets('terdapat tanggal, bulan, tahun, dan waktu', (tester) async {
      await tester.pumpWidget(ProviderScope(
        overrides: [
          registerViewModel.overrideWithProvider(temporaryProvider),
        ],
        child: const MaterialApp(home: HomeScreen()),
      ));

      final dateTime = find.text('8:30 PM • 21 October 2022');
      expect(dateTime, dateTime);
    });

    testWidgets('terdapat logout icon', (tester) async {
      await tester.pumpWidget(ProviderScope(
        overrides: [
          registerViewModel.overrideWithProvider(temporaryProvider),
        ],
        child: const MaterialApp(home: HomeScreen()),
      ));

      final icon = find.byIcon(Icons.logout);
      expect(icon, findsOneWidget);
    });
  });
}
