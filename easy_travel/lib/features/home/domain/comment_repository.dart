import 'package:easy_travel/features/home/domain/comment.dart';

abstract class CommentRepository {
  Future<List<Comment>> getCommentsForDestination(int destinationId);
}
