abstract class CommentEvent {
  const CommentEvent();
}

class GetCommentsByDestination extends CommentEvent {
  final int destinationId;

  const GetCommentsByDestination({required this.destinationId});
}

class AddComment extends CommentEvent {
  final int destinationId;
  final String comment;
  final int rating;

  const AddComment({
    required this.destinationId,
    required this.comment,
    required this.rating,
  });
}
