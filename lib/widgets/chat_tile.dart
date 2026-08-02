import 'package:flutter/material.dart';

class ChatTile extends StatelessWidget {
  const ChatTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 6,
      ),
      child: ListTile(
        leading: const CircleAvatar(
          child: Icon(Icons.person),
        ),
        title: const Text("John Doe"),
        subtitle: const Text("Hello from CSP!"),
        trailing: const Text("10:30"),
        onTap: () {},
      ),
    );
  }
}
