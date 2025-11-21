import 'dart:convert';
import 'dart:io';

import 'package:easy_travel/core/constants/api_constants.dart';
import 'package:easy_travel/core/storage/token_storage.dart';
import 'package:easy_travel/features/home/data/models/comment_dto.dart';
import 'package:http/http.dart' as http;

class CommentService {
  Future<List<CommentDto>> getCommentsForDestination(int destinationId) async {
    final Uri uri = Uri.parse(
      ApiConstants.baseUrl,
    ).replace(path: '${ApiConstants.commentsEndpoint}/$destinationId');

    try {
      final response = await http.get(uri);
      if (response.statusCode == HttpStatus.ok) {
        final List jsons = jsonDecode(response.body);
        return jsons.map((json) => CommentDto.fromJson(json)).toList();
      }
      if (response.statusCode == HttpStatus.notFound) {
        throw HttpException('No comments found (404)');
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
      throw Exception('Unexpected error while fetching comments: $e');
    }
  }

  Future<void> addComment(int destinationId, String comment, int rating) async {
    final Uri uri = Uri.parse(
      ApiConstants.baseUrl,
    ).replace(path: ApiConstants.commentsEndpoint);

    try {
      final token = await TokenStorage().read();

      final response = await http.post(
        uri,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode({
          'destinationId': destinationId,
          'comment': comment,
          'rating': rating,
        }),
      );
      if (response.statusCode != HttpStatus.created) {
        throw HttpException('Error: (${response.statusCode})');
      }
    } on SocketException {
      throw const SocketException('Failed to establish a network connection');
    } on FormatException catch (e) {
      throw FormatException('Failed to parse response: ${e.message}');
    } catch (e) {
      throw Exception('Unexpected error while adding comment: $e');
    }
  }
}
