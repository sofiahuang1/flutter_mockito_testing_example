import 'package:flutter_mockito_testing_example/data/datasource/user_api.dart';
import 'package:flutter_mockito_testing_example/domain/model/user.dart';

class UserService {
  final UserApi api;

  UserService(this.api);

  Future<User> fetchUser(String userId) async {
    return await api.getUser(userId);
  }
}
