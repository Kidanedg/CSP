import 'package:flutter/material.dart';

class StoryCard extends StatelessWidget {
  const StoryCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 90,
      child: Card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            SizedBox(height: 10),
            CircleAvatar(
              radius: 25,
              child: Icon(Icons.person),
            ),
            SizedBox(height: 10),
            Text("Story"),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
