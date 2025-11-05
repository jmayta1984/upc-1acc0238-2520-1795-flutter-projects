import 'package:easy_travel/features/auth/domain/models/user.dart';

abstract class  LoginRepository {
  Future<User> login(String email, String password);
}