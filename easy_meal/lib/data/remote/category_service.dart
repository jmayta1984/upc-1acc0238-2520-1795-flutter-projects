import 'dart:convert';
import 'dart:io';

import 'package:easy_meal/core/constants/api_constants.dart';
import 'package:easy_meal/data/remote/category_dto.dart';
import 'package:http/http.dart' as http;

class CategoryService {
  Future<List<CategoryDto>> getAllCategories() async {
    final Uri uri = Uri.parse(
      "${ApiConstants.baseUrl}${ApiConstants.categoriesEndpoint}",
    );

    try {
      final respoonse = await http.get(uri);

      if (respoonse.statusCode == HttpStatus.ok) {
        final data = jsonDecode(respoonse.body);
        final List jsons = data['categories'];
        return jsons.map((json) => CategoryDto.fromJson(json)).toList();
      }
      return Future.error("Failed to load categories: ${respoonse.statusCode}");
    } catch (e) {
      return Future.error("Failed to load categories: $e");
    }
  }
}
