import 'package:flutter_technical_test/main.dart';
import 'package:flutter_technical_test/screens/login.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("Sign in verification", () {
    final login = const Login().createState();
    group("Field validation", () {
      test('Email should be valid', () {
        expect(login.validateEmail("example@test.com"), null);
      });
      test('Email should be invalid', () {
        expect(login.validateEmail("abcde"), "Please provide a valid email address");
      });
    });

    //Widget test
    testWidgets('Login widget has email and password', (WidgetTester tester) async {
      await tester.pumpWidget(const MyApp());
      final emailFinder = find.text('example@mail.com');
      expect(emailFinder, findsOneWidget);
    });
  });
}
