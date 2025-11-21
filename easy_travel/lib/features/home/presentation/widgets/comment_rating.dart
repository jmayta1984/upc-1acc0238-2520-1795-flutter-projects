import 'package:flutter/material.dart';

class CommentRating extends StatefulWidget {
  const CommentRating({super.key, required this.onRatingSelected});
  final Function(int value) onRatingSelected;

  @override
  State<CommentRating> createState() => _CommentRatingState();
}

class _CommentRatingState extends State<CommentRating> {
  int rating = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(5, (index) {
        return IconButton(
          onPressed: () {
            setState(() {
              rating = index + 1;
            });
            widget.onRatingSelected(rating);
          },
          icon: Icon(index < rating ? Icons.star : Icons.star_border),
        );
      }),
    );
  }
}
