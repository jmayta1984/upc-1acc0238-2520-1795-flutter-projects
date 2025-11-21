import 'package:easy_travel/features/home/data/models/comment_dto.dart';
import 'package:easy_travel/features/home/data/services/comment_service.dart';
import 'package:easy_travel/features/home/domain/comment.dart';
import 'package:easy_travel/features/home/domain/comment_repository.dart';

class CommentRepositoryImpl implements CommentRepository {
  final CommentService service;

  const CommentRepositoryImpl({required this.service});

  @override
  Future<List<Comment>> getCommentsForDestination(int destinationId) async {
    final List<CommentDto> dtos = await service.getCommentsForDestination(
      destinationId,
    );
    return dtos.map((dto) => dto.toDomain()).toList();
  }

  @override
  Future<void> addComment(int destinationId, String comment, int rating) async {
    service.addComment(destinationId, comment, rating);
  }
}
