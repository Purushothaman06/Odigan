// import 'package:flutter/material.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:mockito/mockito.dart';
// import 'package:odigan/components/my_button.dart';
// import 'package:odigan/pages/login_page.dart';

// class MockNavigatorObserver extends Mock implements NavigatorObserver {}

// void main() {
//   group('LoginPage', () {
//     late NavigatorObserver mockNavigatorObserver;
//     final emailTextFormField = find.byKey(const Key('emailTextFormField'));
//     final passwordTextFormField =
//         find.byKey(const Key('passwordTextFormField'));
//     final signInButton = find.byType(MyButton);

//     setUp(() {
//       mockNavigatorObserver = MockNavigatorObserver();
//     });

//     testWidgets('should show loading indicator when signing in',
//         (WidgetTester tester) async {
//       await tester.pumpWidget(MaterialApp(
//         home: LoginPage(
//           onTap: () {},
//         ),
//         navigatorObservers: [mockNavigatorObserver],
//       ));

//       // enter valid email and password
//       await tester.enterText(emailTextFormField, 'test@test.com');
//       await tester.enterText(passwordTextFormField, 'password');

//       // tap sign in button
//       await tester.tap(signInButton);
//       await tester.pumpAndSettle();

//       // verify loading indicator is shown
//       expect(find.byType(CircularProgressIndicator), findsOneWidget);
//     });

//     testWidgets('should show error message when sign in fails',
//         (WidgetTester tester) async {
//       await tester.pumpWidget(MaterialApp(
//         home: LoginPage(
//           onTap: () {},
//         ),
//         navigatorObservers: [mockNavigatorObserver],
//       ));

//       // enter invalid email and password
//       await tester.enterText(emailTextFormField, 'invalid@test.com');
//       await tester.enterText(passwordTextFormField, 'invalidpassword');

//       // tap sign in button
//       await tester.tap(signInButton);
//       await tester.pumpAndSettle();

//       // verify error message is shown
//       expect(find.text('invalid-email'), findsOneWidget);
//     });

//     testWidgets('should navigate to ForgotPasswordPage when Forgot Password? is tapped', (WidgetTester tester) async {
//       await tester.pumpWidget(MaterialApp(
//         home: LoginPage(
//           onTap: () {},
//         ),
//         navigatorObservers: [mockNavigatorObserver],
//       ));

//       // tap forgot password
//       await tester.tap(find.text('Forgot Password?'));
//       await tester.pumpAndSettle();

//       // verify navigation to ForgotPasswordPage
//       verify(mockNavigatorObserver.didPush(any!, any));
//       expect(find.byType(ForgotPasswordPage), findsOneWidget);
//     });

//     testWidgets('should navigate to RegisterPage when Register now is tapped', (WidgetTester tester) async {
//       var isRegisterPageOpened = false;

//       await tester.pumpWidget(MaterialApp(
//         home: LoginPage(
//           onTap: () {
//             isRegisterPageOpened = true;
//           },
//         ),
//         navigatorObservers: [mockNavigatorObserver],
//       ));

//       // tap register now
//       await tester.tap(find.text('Register now'));
//       await tester.pumpAndSettle();

//       // verify navigation to RegisterPage
//       expect(isRegisterPageOpened, isTrue);
//     });
//   });
// }
