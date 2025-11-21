import 'package:easy_travel/features/home/domain/comment.dart';

abstract class CommentRepository {
  Future<List<Comment>> getCommentsForDestination(int destinationId);

  Future<void> addComment(int destinationId, String comment, int rating);
}
