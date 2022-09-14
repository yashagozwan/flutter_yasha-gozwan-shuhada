import 'package:flutter/material.dart';

class Navigate {
  final BuildContext _context;

  Navigate(this._context);

  void start(Widget widget) {
    Navigator.push(
      _context,
      MaterialPageRoute(builder: (BuildContext context) {
        return widget;
      }),
    );
  }

  void finish() {
    Navigator.pop(_context);
  }
}
