import 'package:flutter/material.dart';

class PreviewPage extends StatelessWidget {
  final String url;

  const PreviewPage({
    Key? key,
    required this.url,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
          onDoubleTap: () {
            Navigator.pop(context);
          },
          child: Image(
            image: NetworkImage(url),
          ),
        ),
      ),
    );
  }
}
