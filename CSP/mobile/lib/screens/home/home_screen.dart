import 'package:flutter/material.dart';

import '../../widgets/story_card.dart';
import '../../widgets/post_card.dart';
import '../../widgets/bottom_navigation.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(

        title: const Text(
          "CSP",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),

        actions: [

          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
          ),

          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications_none),
          ),

        ],
      ),

      body: ListView(

        children: [

          const SizedBox(height: 10),

          SizedBox(

            height: 110,

            child: ListView(

              scrollDirection: Axis.horizontal,

              children: const [

                StoryCard(name: "You"),

                StoryCard(name: "Alice"),

                StoryCard(name: "Bob"),

                StoryCard(name: "Carol"),

                StoryCard(name: "David"),

              ],
            ),
          ),

          const Padding(

            padding: EdgeInsets.all(16),

            child: Card(

              child: Padding(

                padding: EdgeInsets.all(16),

                child: Text(
                  "What's on your mind?",
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
          ),

          const PostCard(

            name: "Kidane Desta",

            text: "Welcome to CSP.",

          ),

          const PostCard(

            name: "Alice",

            text: "Good morning everyone!",

          ),

          const SizedBox(height: 80),

        ],
      ),

      bottomNavigationBar: const BottomNavigation(),

    );
  }
}
