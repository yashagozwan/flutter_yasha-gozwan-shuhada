import 'package:flutter/material.dart';
import 'package:praktikum/src/model/character_model.dart';
import 'package:praktikum/src/pages/home/widgets/profile_sheet.dart';
import 'package:praktikum/src/pages/home/widgets/text_pro.dart';
import 'package:praktikum/src/pages/home/widgets/touchable_image.dart';

class SectionTwo extends StatelessWidget {
  const SectionTwo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TextPro(
            'Characters',
            fontSize: 24,
            fontWeight: FontWeight.w600,
          ),
          const SizedBox(height: 16),
          GridView.builder(
            itemCount: characters.length,
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 16,
            ),
            itemBuilder: (context, index) {
              final character = characters[index];
              return Column(
                children: [
                  Flexible(
                    child: TouchableImage(
                      imageSrc: character.urlImageCircle,
                      onPressed: () => _showBottomSheetProfile(
                        context: context,
                        character: character,
                      ),
                    ),
                  ),
                  TextPro(character.name),
                ],
              );
            },
          ),
        ],
      ),
    );
  }

  void _showBottomSheetProfile({
    required BuildContext context,
    required CharacterModel character,
  }) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(24),
        ),
      ),
      builder: (BuildContext context) {
        return ProfileSheet(
          character: character,
        );
      },
    );
  }
}
