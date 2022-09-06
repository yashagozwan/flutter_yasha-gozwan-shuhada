import 'dart:math';

class ChatModel {
  final String image;
  final String title;
  final String subTitle;
  final int lastUpdate;
  final int chatCount;

  ChatModel(
    this.image,
    this.title,
    this.subTitle,
    this.lastUpdate,
    this.chatCount,
  );

  static int _countingGenerate() {
    return Random().nextInt(40);
  }

  static List<ChatModel> listChat() {
    return [
      ChatModel(
        'images/avatar_1.png',
        'Adeeva',
        'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old.',
        DateTime.now().millisecondsSinceEpoch,
        _countingGenerate(),
      ),
      ChatModel(
        'images/avatar_2.png',
        'Afra',
        'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old.',
        DateTime.now().millisecondsSinceEpoch,
        _countingGenerate(),
      ),
      ChatModel(
        'images/avatar_3.png',
        'Afsheen',
        'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old.',
        DateTime.now().millisecondsSinceEpoch,
        _countingGenerate(),
      ),
      ChatModel(
        'images/avatar_4.png',
        'Ainayya',
        'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old.',
        DateTime.now().millisecondsSinceEpoch,
        _countingGenerate(),
      ),
      ChatModel(
        'images/avatar_5.png',
        'Aiza',
        'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old.',
        DateTime.now().millisecondsSinceEpoch,
        _countingGenerate(),
      ),
      ChatModel(
        'images/avatar_6.png',
        'Akleema',
        'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old.',
        DateTime.now().millisecondsSinceEpoch,
        _countingGenerate(),
      ),
      ChatModel(
        'images/avatar_7.png',
        'Alfathunnisa',
        'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old.',
        DateTime.now().millisecondsSinceEpoch,
        _countingGenerate(),
      ),
      ChatModel(
        'images/avatar_8.png',
        'Alifah',
        'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old.',
        DateTime.now().millisecondsSinceEpoch,
        _countingGenerate(),
      ),
      ChatModel(
        'images/avatar_9.png',
        'Alishba',
        'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old.',
        DateTime.now().millisecondsSinceEpoch,
        _countingGenerate(),
      ),
      ChatModel(
        'images/avatar_10.png',
        'Alzena',
        'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old.',
        DateTime.now().millisecondsSinceEpoch,
        _countingGenerate(),
      ),
    ];
  }
}
