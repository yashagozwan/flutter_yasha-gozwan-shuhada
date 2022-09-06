import 'package:flutter/material.dart';

class MenuList {
  Icon icon;
  String title;

  MenuList(
    this.icon,
    this.title,
  );
}

final List<MenuList> menuList1 = [
  MenuList(Icon(Icons.group), 'New Group'),
  MenuList(Icon(Icons.lock), 'New Secret Chat'),
  MenuList(Icon(Icons.notifications), 'New Channel'),
];

final List<MenuList> menuList2 = [
  MenuList(Icon(Icons.contact_phone), 'Contact'),
  MenuList(Icon(Icons.person_add), 'Invite Friends'),
  MenuList(Icon(Icons.settings), 'Settings'),
  MenuList(Icon(Icons.question_mark), 'Telegram FAQ'),
];
