import 'package:flutter_test/flutter_test.dart';
import 'package:users_http_unit_test/user_model.dart';
import 'package:users_http_unit_test/user_repository.dart';

void main() {
  late UserRepository userRepository;
  setUp(() {
    // Arrange
    userRepository = UserRepository();
  });
  group('UserRepository -', () {
    group('getUser function', () {
      test(
          'given UserRepository class when getUser function is called and status code is 200 then a usermodel should be returned',
          () async {
        // Act
        final user = await userRepository.getUser();
        // Assert
        expect(user, isA<User>());
      });
      
    });
  });
}
