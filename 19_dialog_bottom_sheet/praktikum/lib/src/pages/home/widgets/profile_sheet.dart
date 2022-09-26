import 'package:flutter/material.dart';
import 'package:praktikum/src/model/character_model.dart';
import 'package:praktikum/src/pages/home/widgets/text_pro.dart';
import 'package:praktikum/src/pages/preview/preview_page.dart';

class ProfileSheet extends StatelessWidget {
  final CharacterModel character;

  const ProfileSheet({
    Key? key,
    required this.character,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: Column(
              children: [
                Center(child: Image.network(character.urlImageCircle)),
                const SizedBox(width: 16),
                TextPro(
                  character.name,
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                ),
                TextPro(
                  character.kanjiName,
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
                TextPro(
                  character.description,
                  textAlign: TextAlign.center,
                ),
                const Divider(),
              ],
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                      content: SingleChildScrollView(
                        child: GestureDetector(
                          onDoubleTap: () {
                            Navigator.push(context, MaterialPageRoute(
                              builder: (BuildContext context) {
                                return PreviewPage(
                                  url: character.urlImageFullCharacter,
                                );
                              },
                            ));
                          },
                          child: Image.network(
                            character.urlImageFullCharacter,
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
                padding: const EdgeInsets.all(16),
              ),
              child: const Icon(Icons.picture_in_picture),
            ),
          )
        ],
      ),
    );
  }
}
