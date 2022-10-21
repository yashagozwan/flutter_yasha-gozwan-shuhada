import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:praktikum/src/widget/text_pro.dart';
import 'package:praktikum/main.dart' as app show main;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  group('Fake Authenticate Twitter', () {
    // Tested data
    const firstName = 'Yasha';
    const lastName = 'Gozwan';
    const email = 'yasha@gmail.com';
    const password = 'flutterTest12346';
    const username = '@$firstName';

    // in Welcome
    final btnCreateAccount = find.byKey(const ValueKey('btnCreateAccount'));
    final btnTextLogin = find.byKey(const ValueKey('btnTextLogin'));

    // in Register
    final ttfRegisterFirstName =
        find.byKey(const ValueKey('ttfRegisterFirstName'));

    final ttfRegisterLastName =
        find.byKey(const ValueKey('ttfRegisterLastName'));

    final ttfRegisterEmail = find.byKey(const ValueKey('ttfRegisterEmail'));

    final ttfRegisterPassword =
        find.byKey(const ValueKey('ttfRegisterPassword'));

    final btnRegister = find.byKey(const ValueKey('btnRegister'));

    // In Login
    final ttfLoginEmail = find.byKey(const ValueKey('ttfLoginEmail'));
    final ttfLoginPassword = find.byKey(const ValueKey('ttfLoginPassword'));
    final btnLogin = find.byKey(const ValueKey('btnLogin'));

    // In Home
    final textName = find.byKey(const ValueKey('textName'));
    final textEmail = find.byKey(const ValueKey('textEmail'));
    final textUsername = find.byKey(const ValueKey('textUsername'));
    final btnLogout = find.byKey(const ValueKey('btnLogout'));

    testWidgets(
      'Welcome Screen, Register Screen, Login Screen, Home Screen',
      (tester) async {
        // ASSEMBLE
        app.main();

        // ACT
        await tester.pumpAndSettle();
        await tester.tap(btnCreateAccount);
        await tester.pumpAndSettle();
        await tester.tap(ttfRegisterFirstName);
        await tester.enterText(ttfRegisterFirstName, firstName);
        await tester.tap(ttfRegisterLastName);
        await tester.enterText(ttfRegisterLastName, lastName);
        await tester.tap(ttfRegisterEmail);
        await tester.enterText(ttfRegisterEmail, email);
        await tester.tap(ttfRegisterPassword);
        await tester.enterText(ttfRegisterPassword, password);
        await tester.tap(btnRegister);
        await tester.pumpAndSettle();
        await tester.tap(btnTextLogin);
        await tester.pumpAndSettle();
        await tester.tap(ttfLoginEmail);
        await tester.enterText(ttfLoginEmail, email);
        await tester.tap(ttfLoginPassword);
        await tester.enterText(ttfLoginPassword, password);
        await tester.tap(btnLogin);
        await tester.pumpAndSettle();

        // ASSERT
        expect(find.text('$firstName $lastName'), findsOneWidget);
        expect(find.text(username), findsOneWidget);
        expect(find.text(email), findsOneWidget);
        final getName = textName.evaluate().single.widget as TextPro;
        final getUsername = textUsername.evaluate().single.widget as TextPro;
        final getEmail = textEmail.evaluate().single.widget as TextPro;
        expect(getName.data, '$firstName $lastName');
        expect(getUsername.data, username);
        expect(getEmail.data, email);

        // ACT
        await tester.tap(btnLogout);
      },
    );
  });
}
