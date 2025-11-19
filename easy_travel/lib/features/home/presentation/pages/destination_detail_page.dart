import 'package:easy_travel/features/home/presentation/widgets/comment_list.dart';
import 'package:easy_travel/shared/domain/models/destination.dart';
import 'package:flutter/material.dart';

class DestinationDetailPage extends StatelessWidget {
  const DestinationDetailPage({super.key, required this.destination});
  final Destination destination;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AlertDialog(
                  title: Text('Leave a comment'),
                  content: Column(
                    children: [
                      TextField(
                        decoration: InputDecoration(
                          hintText: 'Your comment here',
                          border: OutlineInputBorder(),
                        ),

                        maxLines: 2,
                      ),
                      Row(
                        children: List.generate(5, (index) {
                          return IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.star_border),
                          );
                        }),
                      ),
                    ],
                  ),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text('Submit'),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text('Close'),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
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
}
