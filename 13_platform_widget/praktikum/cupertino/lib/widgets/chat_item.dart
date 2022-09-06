import 'package:cupertino/util/my_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

class ChatItem extends StatelessWidget {
  final String image;
  final String title;
  final String subTitle;
  final int lastUpdate;
  final int chatCount;

  const ChatItem({
    Key? key,
    required this.image,
    required this.title,
    required this.subTitle,
    required this.lastUpdate,
    required this.chatCount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(300),
              child: Image(
                width: 50,
                height: 50,
                image: AssetImage(image),
              ),
            ),
          ),
          Expanded(
            child: _titleAndSubtitle(title, subTitle),
          ),
          _lastUpdateAndChatCounting(lastUpdate, chatCount)
        ],
      ),
    );
  }

  Widget _titleAndSubtitle(String title, String subTitle) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          subTitle,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(fontSize: 14),
        )
      ],
    );
  }

  Widget _lastUpdateAndChatCounting(int lastUpdate, int chatCount) {
    var datetime = DateTime.fromMillisecondsSinceEpoch(lastUpdate);
    var clock = DateFormat('hh:mm a').format(datetime);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          clock,
          style: const TextStyle(
            color: MyColors.grey,
            fontSize: 13,
          ),
        ),
        const SizedBox(height: 8),
        if (chatCount != 0) _countingChats(),
      ],
    );
  }

  Widget _countingChats() {
    return Container(
      padding: const EdgeInsets.all(4),
      width: chatCount < 10 ? 20 : null,
      decoration: BoxDecoration(
        color: MyColors.blue,
        borderRadius: BorderRadius.circular(1000),
      ),
      child: Center(
        child: Text(
          chatCount.toString(),
          style: const TextStyle(
            color: MyColors.white,
            fontSize: 12,
          ),
        ),
      ),
    );
  }
}
