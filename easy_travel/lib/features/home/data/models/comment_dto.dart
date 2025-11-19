import 'package:easy_travel/features/home/domain/comment.dart';

class CommentDto {
  final String lastName;
  final String firstName;
  final String comment;
  final int rating;
  final DateTime date;

  const CommentDto({
    required this.lastName,
    required this.firstName,
    required this.comment,
    required this.rating,
    required this.date,
  });

  Comment toDomain() {
    return Comment(
      userName: '$firstName $lastName',
      comment: comment,
      rating: rating,
      date: date,
    );
  }

  factory CommentDto.fromJson(Map<String, dynamic> json) {
    return CommentDto(
      lastName: json['user']['lastName'],
      firstName: json['user']['firstName'],
      comment: json['comment'],
      rating: json['rating'],
      date: DateTime.parse(json['date']),
    );
  }
}
