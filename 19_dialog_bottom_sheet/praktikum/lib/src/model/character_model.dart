class CharacterModel {
  final String name;
  final String kanjiName;
  final String urlImageCircle;
  final String urlImageFullCharacter;
  final String description;

  CharacterModel(
    this.name,
    this.kanjiName,
    this.urlImageCircle,
    this.urlImageFullCharacter,
    this.description,
  );
}

final characters = [
  CharacterModel(
    'Kinji Ninomiya',
    "二ノ宮キンジ",
    'https://static.wikia.nocookie.net/the-dungeon-of-black-company/images/1/16/Kinji_Profile.png/revision/latest/scale-to-width-down/150?cb=20210623150228',
    'https://static.wikia.nocookie.net/the-dungeon-of-black-company/images/9/9d/Kinji_Ninomiya.png/revision/latest?cb=20210326105234',
    'Kinji Ninomiya is the main protagonist of The Dungeon of Black Company he is a young man overflowing with extreme overconfidence. Right when he thought he was set to live a cushy NEET lifestyle, he was swept off to another world.',
  ),
  CharacterModel(
    'Rim',
    'リム',
    'https://static.wikia.nocookie.net/the-dungeon-of-black-company/images/1/16/Rim_Profile.png/revision/latest/scale-to-width-down/150?cb=20210623150251',
    'https://static.wikia.nocookie.net/the-dungeon-of-black-company/images/3/3e/Rim.png/revision/latest?cb=20210326105241',
    'Rim is an immensely powerful Majin, where the magic of the dungeon circulates. She later join The Main Protagonist, Ninomiya Kinji, on their adventures filled with various things to discover',
  ),
  CharacterModel(
    'Wanibe',
    'ワニベ',
    'https://static.wikia.nocookie.net/the-dungeon-of-black-company/images/3/32/Wanibe_Profile.png/revision/latest/scale-to-width-down/150?cb=20210623150239',
    'https://static.wikia.nocookie.net/the-dungeon-of-black-company/images/7/72/Wanibe.png/revision/latest?cb=20210326105249',
    "Wanibe is the deuteragonist of the series he is a reptilian who took up Kinji on one of his get-rich-quick schemes. Now he's thoroughly wrapped up in Kinji's shenanigans. A helpless guy who mostly ends up getting used as an underling, which suits him just fine.",
  ),
  CharacterModel(
    'Shia Kinou',
    'キノウ・シア',
    'https://static.wikia.nocookie.net/the-dungeon-of-black-company/images/f/f0/Shia_Profile.png/revision/latest/scale-to-width-down/150?cb=20210623150307',
    'https://static.wikia.nocookie.net/the-dungeon-of-black-company/images/c/cc/Shia.png/revision/latest?cb=20210326105257',
    "Shia is a hero who is known for possessing The Philosopher's Stone by conquering The Fifth Floor of the dungeon.",
  ),
  CharacterModel(
    'Ranga',
    "ランガ",
    'https://static.wikia.nocookie.net/the-dungeon-of-black-company/images/f/fc/Ranga_Profile.png/revision/latest/scale-to-width-down/150?cb=20210623150319',
    'https://static.wikia.nocookie.net/the-dungeon-of-black-company/images/5/5a/Ranga.png/revision/latest?cb=20210326105303',
    'Ranga is an effeminite male mage. He followed Kinji Ninomiya from a messed up future in order to knock some sense into his ancestor from current times.',
  ),
  CharacterModel(
    "Belza Shuba'ha",
    "ベルザ・シューバッハ",
    'https://static.wikia.nocookie.net/the-dungeon-of-black-company/images/a/a3/Belza_Profile.png/revision/latest/scale-to-width-down/150?cb=20210623150331',
    'https://static.wikia.nocookie.net/the-dungeon-of-black-company/images/3/3a/Velza_Shuba%27ha.png/revision/latest?cb=20210326105313',
    "Belza Shuba'ha is the Director of Raiza'ha Demonite Mining Corporation, Detmolt branch. She is willing to sacrifice her employees if it will get her results.",
  ),
];
