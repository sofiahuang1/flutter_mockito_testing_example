import 'package:flutter_mockito_testing_example/domain/model/user.dart';

abstract class UserApi {
  Future<User> getUser(String userId);
}
