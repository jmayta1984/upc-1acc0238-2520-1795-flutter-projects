import 'dart:convert';
import 'dart:io';

import 'package:easy_travel/core/constants/api_constants.dart';
import 'package:easy_travel/features/auth/data/models/user_dto.dart';

import 'package:http/http.dart' as http;

class LoginService {
  Future<UserDto> login(String email, String password) async {
    final Uri uri = Uri.parse(
      ApiConstants.baseUrl,
    ).replace(path: ApiConstants.loginEndpoint);

    try {
      final response = await http.post(
        uri,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'email': email, 'password': password}),

        
      );

      if (response.statusCode == HttpStatus.ok) {
        final json = jsonDecode(response.body);

        return UserDto.fromJson(json);
      }
       throw HttpException(
        'Unexpected HTTP status: ${response.statusCode} - ${response.reasonPhrase}',
      );
    } catch (e) {
      throw Exception('Unexpected error while fetching destinations: $e');
    }
  }
}
