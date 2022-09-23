import 'package:flutter/material.dart';
import 'widgets/post_form.dart';

class PostCreatePage extends StatelessWidget {
  const PostCreatePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create new post'),
        leading: const Icon(Icons.menu),
      ),
      body: const PostForm(),
    );
  }
}
