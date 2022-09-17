import 'package:flutter/material.dart';

class ImagePreviewPage extends StatefulWidget {
  final String imageUrl;

  const ImagePreviewPage({
    super.key,
    required this.imageUrl,
  });

  @override
  State<ImagePreviewPage> createState() => _ImagePreviewPageState();
}

class _ImagePreviewPageState extends State<ImagePreviewPage> {
  bool isZoom = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image(
            image: AssetImage(widget.imageUrl),
            fit: isZoom ? BoxFit.cover : BoxFit.contain,
          ),
          Positioned.fill(
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () {
                  setState(() {
                    isZoom = !isZoom;
                  });
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
