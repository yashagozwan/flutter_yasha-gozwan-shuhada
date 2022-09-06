import 'package:cupertino/data/chat_model.dart';
import 'package:cupertino/widgets/chat_item.dart';
import 'package:cupertino/widgets/text_notification.dart';
import 'package:flutter/cupertino.dart';

class ChatsScreen extends StatelessWidget {
  const ChatsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: <Widget>[
          _search(),
          _tabText(),
          Expanded(
            child: ListView.separated(
              itemBuilder: (context, index) {
                var image = ChatModel.listChat()[index].image;
                var title = ChatModel.listChat()[index].title;
                var subTitle = ChatModel.listChat()[index].subTitle;
                var lastUpdate = ChatModel.listChat()[index].lastUpdate;
                var chatCount = ChatModel.listChat()[index].chatCount;

                return ChatItem(
                  image: image,
                  title: title,
                  subTitle: subTitle,
                  lastUpdate: lastUpdate,
                  chatCount: chatCount,
                );
              },
              separatorBuilder: (context, index) {
                return Container();
              },
              itemCount: ChatModel.listChat().length,
            ),
          ),
        ],
      ),
    );
  }

  Widget _search() {
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 16,
      ),
      padding: const EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 16,
      ),
      decoration: BoxDecoration(
        color: const Color(0xFFF4F4F4),
        borderRadius: BorderRadius.circular(16),
      ),
      child: const CupertinoTextField(
        decoration: BoxDecoration(
          color: Color(0xFFF4F4F4),
        ),
        placeholder: 'Search',
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _tabText() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: const [
          TextNotification(count: 0, text: 'All Chats'),
          TextNotification(count: 1, text: 'Work'),
          TextNotification(
            count: 9,
            text: 'Unread',
            selected: true,
          ),
          TextNotification(count: 2, text: 'Personal'),
        ],
      ),
    );
  }
}
