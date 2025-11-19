import 'package:easy_travel/features/home/domain/comment.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CommentCard extends StatelessWidget {
  final Comment comment;
  const CommentCard({super.key, required this.comment});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Row(
                children: List.generate(5, (index) {
                  final selected = index < comment.rating;
                  return Icon(
                    selected ? Icons.star : Icons.star_border,
                    color: selected
                        ? Theme.of(context).colorScheme.primary
                        : Theme.of(context).colorScheme.onSurfaceVariant,
                  );
                }),
              ),
              const Spacer(),
              Text(DateFormat.yMMMd().format(comment.date)),
            ],
          ),
          Text(comment.comment),
          Text(comment.userName, style: TextStyle(fontStyle: FontStyle.italic)),
        ],
      ),
    );
  }
}
