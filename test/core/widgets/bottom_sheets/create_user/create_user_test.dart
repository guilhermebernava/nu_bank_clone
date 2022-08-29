import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nu_bank_clone/app/login/widgets/login_buttons.dart';
import 'package:nu_bank_clone/core/widgets/bottom_sheets/create_user/create_user.dart';
import 'package:nu_bank_clone/core/widgets/core_close_button/close_button.dart';

void main() {
  testWidgets('close the bottom sheet', (tester) async {
    await tester.pumpWidget(
        const MaterialApp(home: Scaffold(body: CreateUserBottomSheet())));

    expect(find.byType(CoreCloseButton), findsOneWidget);

    await tester.tap(find.byType(CoreCloseButton));
    await tester.pumpAndSettle();

    expect(find.byType(CoreCloseButton), findsNothing);
  });

  testWidgets('open the bottom sheet', (tester) async {
    await tester.pumpWidget(const MaterialApp(
        home: Scaffold(body: LoginButtons(size: Size(1000, 1000)))));

    expect(find.text('Começar'), findsOneWidget);

    await tester.tap(find.text('Começar'));
    await tester.pumpAndSettle();

    expect(find.byType(CreateUserBottomSheet), findsOneWidget);
    await tester.tap(find.byType(CoreCloseButton));
    await tester.pumpAndSettle();
  });
}
