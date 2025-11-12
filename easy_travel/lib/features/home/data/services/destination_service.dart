import 'dart:convert';
import 'dart:io';

import 'package:easy_travel/core/contstants/api_constants.dart';
import 'package:easy_travel/features/home/data/models/destination_dto.dart';
import 'package:easy_travel/shared/domain/models/category.dart';
import 'package:http/http.dart' as http;

class DestinationService {
  Future<List<DestinationDto>> getDestinations(CategoryType category) async {
    try {
      final uri = Uri.parse(ApiConstants.baseUrl).replace(
        path: ApiConstants.destinationsEndpoint,
        queryParameters: category != CategoryType.all
            ? {'type': category.label}
            : null,
      );

      final response = await http.get(uri);
      if (response.statusCode == HttpStatus.ok) {
        final json = jsonDecode(response.body);
        final List maps = json['results'];
        return maps.map((json) => DestinationDto.fromJson(json)).toList();
      }
      if (response.statusCode == HttpStatus.notFound) {
        throw HttpException('No destinations found (404)');
      }
      if (response.statusCode >= 500) {
        throw HttpException('Server error (${response.statusCode})');
      }

      throw HttpException(
        'Unexpected HTTP status: ${response.statusCode} - ${response.reasonPhrase}',
      );
    } on SocketException {
      throw const SocketException('Failed to establish a network connection');
    } on FormatException catch (e) {
      throw FormatException('Failed to parse response: ${e.message}');
    } catch (e) {
      throw Exception('Unexpected error while fetching destinations: $e');
    }
  }
}
