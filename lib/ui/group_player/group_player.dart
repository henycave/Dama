import 'package:flutter/material.dart';

class GroupPlayer extends StatefulWidget {
  const GroupPlayer({super.key});

  @override
  State<GroupPlayer> createState() => _GroupPlayerState();
}

class _GroupPlayerState extends State<GroupPlayer> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Group player"),
      ),
    );
  }
}
