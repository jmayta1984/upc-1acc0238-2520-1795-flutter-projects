import 'package:easy_travel/core/enums/status.dart';
import 'package:easy_travel/features/home/domain/comment.dart';

class CommentState {
  final Status status;
  final List<Comment> comments;
  final String? message;

  const CommentState({
    this.status = Status.initial,
    this.comments = const [],
    this.message,
  });

  CommentState copyWith({
    Status? status,
    List<Comment>? comments,
    String? message,
  }) {
    return CommentState(
      status: status ?? this.status,
      comments: comments ?? this.comments,
      message: message ?? this.message,
    );
  }
}
