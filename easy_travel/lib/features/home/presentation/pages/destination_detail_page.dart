import 'package:easy_travel/features/home/presentation/blocs/comment_bloc.dart';
import 'package:easy_travel/features/home/presentation/blocs/comment_event.dart';
import 'package:easy_travel/features/home/presentation/widgets/comment_list.dart';
import 'package:easy_travel/features/home/presentation/widgets/comment_rating.dart';
import 'package:easy_travel/shared/domain/models/destination.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DestinationDetailPage extends StatelessWidget {
  const DestinationDetailPage({super.key, required this.destination});
  final Destination destination;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => _addComment(context),
        child: const Icon(Icons.add_comment),
      ),
      body: Column(
        children: [
          Hero(
            tag: destination.id,
            child: Image.network(
              destination.posterPath,
              height: 400,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Expanded(child: CommentList()),
        ],
      ),
    );
  }

  void _addComment(BuildContext context) {
    int rating = 0;
    String comment = '';
    showDialog(
      context: context,
      builder: (_) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AlertDialog(
            title: Text('Leave a comment'),
            content: Column(
              children: [
                TextField(
                  onChanged: (value) => comment = value,
                  decoration: InputDecoration(
                    hintText: 'Your comment here',
                    border: OutlineInputBorder(),
                  ),

                  maxLines: 2,
                ),
                CommentRating(onRatingSelected: (value) => rating = value),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('Cancel'),
              ),

              FilledButton(
                onPressed: () {
                  context.read<CommentBloc>().add(
                    AddComment(
                      destinationId: destination.id,
                      comment: comment,
                      rating: rating,
                    ),
                  );
                  Navigator.of(context).pop();
                },
                child: Text('Submit'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
