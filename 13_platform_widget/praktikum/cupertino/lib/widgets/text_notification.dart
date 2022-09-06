import 'package:cupertino/util/my_colors.dart';
import 'package:cupertino/util/my_colors.dart';
import 'package:flutter/cupertino.dart';

class TextNotification extends StatelessWidget {
  final int count;
  final String text;
  final bool? selected;

  const TextNotification({
    Key? key,
    required this.count,
    required this.text,
    this.selected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              text,
              style: TextStyle(
                color: selected != null ? MyColors.blue : MyColors.grey,
              ),
            ),
            if (count != 0) _countText(),
          ],
        ),
      ],
    );
  }

  Widget _countText() {
    return Container(
      padding: const EdgeInsets.all(4),
      margin: const EdgeInsets.only(left: 4),
      height: 25,
      width: 25,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: MyColors.blue,
      ),
      child: Center(
        child: Text(
          count.toString(),
          style: const TextStyle(
            color: MyColors.white,
            fontSize: 12,
          ),
        ),
      ),
    );
  }
}
