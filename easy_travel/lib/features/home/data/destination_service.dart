import 'dart:convert';
import 'dart:io';

import 'package:easy_travel/features/home/domain/category.dart';
import 'package:easy_travel/features/home/domain/destination.dart';
import 'package:http/http.dart' as http;

class DestinationService {
  final String baseUrl =
      'https://destinationapp-h4e8dvace3fqffbb.eastus-01.azurewebsites.net/api/destinations';

  Future<List<Destination>> getDestinations(CategoryType category) async {
    final String query = category == CategoryType.all ? '' : category.label;

    final response = await http.get(Uri.parse('$baseUrl?type=$query'));
    if (response.statusCode == HttpStatus.ok) {
      final json = jsonDecode(response.body);
      final List maps = json['results'];
      return maps.map((json) => Destination.fromJson(json)).toList();
    }

    return [];
  }
}
