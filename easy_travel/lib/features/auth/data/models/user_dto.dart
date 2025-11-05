import 'package:easy_travel/features/auth/domain/models/user.dart';

class UserDto {
  final String firstName;
  final String lastName;
  final String email;
  final String token;

  const UserDto({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.token,
  });

  factory UserDto.fromJson(Map<String, dynamic> json) {
    return UserDto(
      firstName: json['firstName'],
      lastName: json['lastName'],
      email: json['email'],
      token: json['token'],
    );
  }

  User toDomain() {
    return User(firstName: firstName, lastName: lastName, email: email);
  }
}
