import 'package:flutter/material.dart';

class PostCard extends StatelessWidget {
  final String name;
  final String text;

  const PostCard({
    super.key,
    required this.name,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 8,
      ),

      child: Padding(
        padding: const EdgeInsets.all(16),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [

            Row(
              children: [

                const CircleAvatar(
                  backgroundColor: Colors.indigo,
                  child: Icon(
                    Icons.person,
                    color: Colors.white,
                  ),
                ),

                const SizedBox(width: 12),

                Expanded(
                  child: Text(
                    name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),

              ],
            ),

            const SizedBox(height: 16),

            Text(
              text,
              style: const TextStyle(fontSize: 16),
            ),

            const Divider(height: 30),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,

              children: const [

                Icon(Icons.favorite_border),

                Icon(Icons.chat_bubble_outline),

                Icon(Icons.share),

              ],
            ),

          ],
        ),
      ),
    );
  }
}
