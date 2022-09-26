import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      height: 350,
      decoration: const BoxDecoration(
        color: Colors.amberAccent,
        image: DecorationImage(
            image: AssetImage('assets/images/bg.jpg'),
            fit: BoxFit.fitWidth,
            opacity: 0.6),
      ),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.bottomLeft,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(14),
              child: GestureDetector(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (_) {
                      return AlertDialog(
                        clipBehavior: Clip.hardEdge,
                        content: SingleChildScrollView(
                          child: Stack(
                            children: [
                              Image.asset(
                                'assets/images/cover.jpg',
                                fit: BoxFit.cover,
                              ),
                              Positioned.fill(
                                child: Center(
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      padding: const EdgeInsets.all(16),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                    onPressed: () {},
                                    child: const Icon(Icons.play_arrow),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        contentPadding: EdgeInsets.zero,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18),
                        ),
                      );
                    },
                  );
                },
                child: Image.asset(
                  width: 150,
                  'assets/images/cover.jpg',
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
