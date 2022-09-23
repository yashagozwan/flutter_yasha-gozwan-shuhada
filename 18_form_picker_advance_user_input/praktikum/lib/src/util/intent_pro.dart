import 'package:flutter/material.dart';

class IntentPro {
  final BuildContext _context;

  const IntentPro(this._context);

  void startActivity(Widget widget) {
    Navigator.push(_context, MaterialPageRoute(
      builder: (BuildContext context) {
        return widget;
      },
    ));
  }

  void finish() => Navigator.pop(_context);
}
