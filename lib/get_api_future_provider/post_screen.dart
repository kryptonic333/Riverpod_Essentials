import 'package:flutter/material.dart';

class PostScreen extends StatelessWidget {
  const PostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
        'Post Screen',
        style: TextStyle(fontWeight: FontWeight.bold),
      )),
    );
  }
}
