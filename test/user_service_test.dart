import 'package:flutter_mockito_testing_example/data/datasource/user_api.dart';
import 'package:flutter_mockito_testing_example/data/service/user_service.dart';
import 'package:flutter_mockito_testing_example/domain/model/user.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'user_service_test.mocks.dart';

@GenerateMocks([UserApi])
void main() {
  late MockUserApi mockUserApi;
  late UserService userService;

  setUp(() {
    mockUserApi = MockUserApi();
    userService = UserService(mockUserApi);
  });

  test('Should return the correct user when fetchUser is called', () async {
    // Given
    const userId = '1';
    final expectedUser =
        User(id: userId, name: 'sofia', email: 'sofia123@22.es');

    // When
    when(mockUserApi.getUser(userId)).thenAnswer((_) async => expectedUser);

    // Then
    final result = await userService.fetchUser(userId);
    expect(result, expectedUser);

    // Verify
    verify(mockUserApi.getUser(userId)).called(1);
  });

  test('Should throw an exception when fetchUser is called with an invalid ID',
      () async {
    // Given
    const userId = 'invalid-id';

    // When
    when(mockUserApi.getUser(userId)).thenThrow(Exception('User not found'));

    // Then
    expect(() => userService.fetchUser(userId), throwsException);

    // Verify
    verify(mockUserApi.getUser(userId)).called(1);
  });
}
