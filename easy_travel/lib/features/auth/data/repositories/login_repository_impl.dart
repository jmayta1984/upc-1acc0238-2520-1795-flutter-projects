import 'package:easy_travel/features/auth/data/services/login_service.dart';
import 'package:easy_travel/features/auth/domain/models/user.dart';
import 'package:easy_travel/features/auth/domain/repositories/login_repository.dart';

class LoginRepositoryImpl implements LoginRepository {
  final LoginService service;

  const LoginRepositoryImpl({required this.service});

  @override
  Future<User> login(String email, String password) async {
    try {
      final userDto = await service.login(email, password);
      return userDto.toDomain();
    } catch (e) {
      throw Exception('Unexpected error while login: $e');
    }
  }
}
