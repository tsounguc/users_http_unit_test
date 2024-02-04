import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:users_http_unit_test/home_screen.dart';
import 'package:users_http_unit_test/user_model.dart';

void main() {
  testWidgets(
      'given home screen when material app opens home screen then displays List of user with title as name and subtitle as email',
      (tester) async {
    final users = [
      User(
          email: 'christiantsoungui@gmail.com',
          name: 'Christian',
          id: 1,
          website: 'website'),
      User(
          email: 'kelliecorbett@gmail.com',
          name: 'Kellie',
          id: 2,
          website: 'website2')
    ];

    Future<List<User>> mockFetchUsers() async {
      return Future.delayed(const Duration(seconds: 1), ()=> users);
    }

    await tester.pumpWidget(
      MaterialApp(
        home: HomeScreen(
          futureUsers: mockFetchUsers(),
        ),
      ),
    );
    expect(find.byType(CircularProgressIndicator), findsOneWidget);
    await tester.pumpAndSettle();
    expect(find.byType(ListView), findsOneWidget);
  });
}
