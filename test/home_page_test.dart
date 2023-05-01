// import 'package:firebase_auth_mocks/firebase_auth_mocks.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:odigan/pages/home_page.dart';
// import 'package:odigan/pages/qrcode_create_page.dart';
// import 'package:odigan/pages/qrcode_scan_page.dart';

// void main() {
//   group('HomePage', () {
//     late MockUser mockUser;
//     late Widget homePage;

//     setUp(() {
//       mockUser = MockUser(
//         isAnonymous: false,
//         uid: '12345',
//         email: 'test@example.com',
//         displayName: 'Test User',
//       );

//       homePage = MaterialApp(
//         home: HomePage(),
//       );
//     });

//     testWidgets('Renders correctly', (WidgetTester tester) async {
//       await tester.pumpWidget(homePage);

//       expect(find.text('ODIGAN - MED FINDER'), findsOneWidget);
//       expect(find.byType(CircleAvatar), findsOneWidget);
//       expect(find.text('SCAN QR'), findsOneWidget);
//       expect(find.text('CREATE QR'), findsOneWidget);
//     });

//     testWidgets('Navigation to QRCodeScanner works', (WidgetTester tester) async {
//       await tester.pumpWidget(homePage);

//       await tester.tap(find.text('SCAN QR'));
//       await tester.pumpAndSettle();

//       expect(find.byType(QRCodeScanner), findsOneWidget);
//     });

//     testWidgets('Navigation to QRCodeGenerator works', (WidgetTester tester) async {
//       await tester.pumpWidget(homePage);

//       await tester.tap(find.text('CREATE QR'));
//       await tester.pumpAndSettle();

//       expect(find.byType(QRCodeGenerator), findsOneWidget);
//     });

//     testWidgets('Signs user out when logout button is pressed', (WidgetTester tester) async {
//       await tester.pumpWidget(homePage);

//       await tester.tap(find.byIcon(Icons.logout_rounded));
//       await tester.pumpAndSettle();

//       expect(mockUser.isSignedOut, isTrue);
//     });
//   });
// }
