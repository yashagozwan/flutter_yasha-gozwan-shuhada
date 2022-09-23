import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'widgets/button_pub.dart';
import '../../util/intent_pro.dart';
import '../../model/post_mode.dart';

class PostPreviewPage extends StatelessWidget {
  final PostModel post;

  const PostPreviewPage({
    super.key,
    required this.post,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Preview Post'),
        leading: IconButton(
          onPressed: () {
            IntentPro(context).finish();
          },
          icon: const Icon(Icons.menu),
        ),
      ),
      body: Column(
        children: [
          Image(
            height: 200,
            width: MediaQuery.of(context).size.width,
            image: FileImage(post.fileImage),
            fit: BoxFit.cover,
          ),
          buildContent(),
        ],
      ),
      floatingActionButton: ButtonPub(
        onPressed: () {},
        icon: const Icon(Icons.share),
        title: 'Publish Post',
      ),
    );
  }

  Widget buildContent() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Published : ${DateFormat('dd/MM/yyyy').format(post.dateTime)}",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Colors.grey.shade600,
                ),
              ),
              Row(
                children: [
                  Text(
                    'Color :',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.grey.shade600,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Container(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(10),
                      ),
                      color: post.color,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 8),
          const Text(
            'Caption',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            post.text,
            style: const TextStyle(height: 1.5),
          ),
        ],
      ),
    );
  }
}
