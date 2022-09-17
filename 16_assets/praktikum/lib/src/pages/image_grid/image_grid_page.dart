import 'package:flutter/material.dart';
import 'package:praktikum/src/pages/image_preview/image_preview_page.dart';

class ImageGridPage extends StatelessWidget {
  final List<String> _images = [
    'assets/japan_001.jpg',
    'assets/japan_002.jpg',
    'assets/japan_003.jpg',
    'assets/japan_004.jpg',
    'assets/japan_005.jpg',
    'assets/japan_006.jpg',
    'assets/japan_007.jpg',
    'assets/japan_008.jpg',
  ];

  ImageGridPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gallery'),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        mainAxisSpacing: 16,
        padding: const EdgeInsets.all(16),
        crossAxisSpacing: 16,
        children: _images.map((image) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Stack(
              children: [
                Image(
                  height: double.infinity,
                  image: AssetImage(image),
                  fit: BoxFit.cover,
                ),
                Positioned.fill(
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      splashColor: Colors.white,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (BuildContext context) {
                            return ImagePreviewPage(imageUrl: image);
                          }),
                        );
                      },
                    ),
                  ),
                )
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}
