import 'package:flutter/material.dart';

class StoryCard extends StatelessWidget {
  final String name;

  const StoryCard({
    super.key,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      margin: const EdgeInsets.symmetric(horizontal: 8),

      child: Column(
        children: [
          const CircleAvatar(
            radius: 30,
            backgroundColor: Colors.indigo,
            child: Icon(
              Icons.person,
              color: Colors.white,
            ),
          ),

          const SizedBox(height: 8),

          Text(
            name,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
