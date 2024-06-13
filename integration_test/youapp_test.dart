import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:youapp_assignment/data/vos/profile_vo.dart';
import 'package:youapp_assignment/main.dart';
import 'package:youapp_assignment/pages/login_page.dart';
import 'package:youapp_assignment/persistence/hive_constants.dart';
import 'package:youapp_assignment/resources/strings.dart';

void main() async {
  await Hive.initFlutter();

  /// register Adapter to custom object
  Hive.registerAdapter(ProfileVOAdapter());

  /// open box
  await Hive.openBox<ProfileVO>(boxNameProfileVO);

  testWidgets("Tap Login And Navigate To Home Page",
      (WidgetTester tester) async {
    /// pumpWidget may take a certain amount of time
    /// always set up with await
    await tester.pumpWidget(const MyApp());
    await Future.delayed(const Duration(seconds: 2));

    /// wait for data
    await tester.pumpAndSettle(const Duration(seconds: 5));

    expect(find.byType(LoginPage), findsOneWidget);

    /// Ensure the TextField is found
    expect(find.byKey(const Key(keyUserName)), findsOneWidget);

    /// Enter text into the TextField
    await tester.enterText(find.byKey(const Key(keyUserName)), 'ttttt');

    /// Ensure the TextField is found
    expect(find.byKey(const Key(keyPassword)), findsOneWidget);

    /// Enter text into the TextField
    await tester.enterText(find.byKey(const Key(keyPassword)), '11111111');

    /// Ensure the Login Button is found
    expect(find.byKey(const Key(keyLoginButton)), findsOneWidget);

    /// navigate to Home page
    await tester.tap(find.byKey(const Key(keyLoginButton)));

    /// At Home Page
    await tester.pumpAndSettle(const Duration(seconds: 10));
    await Future.delayed(const Duration(seconds: 10));

    expect(find.byType(LoginPage), findsOneWidget);
  });
}
