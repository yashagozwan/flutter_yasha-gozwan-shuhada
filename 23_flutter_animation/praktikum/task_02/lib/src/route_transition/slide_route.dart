import 'package:flutter/material.dart';

class SlideRoute<T> extends PageRouteBuilder {
  final Widget page;
  final String routeName;
  final T? parameters;

  SlideRoute({
    required this.page,
    required this.routeName,
    this.parameters,
  }) : super(
          settings: RouteSettings(
            name: routeName,
            arguments: parameters,
          ),
          pageBuilder: (context, animation, secondaryAnimation) {
            return page;
          },
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            var tween = Tween(begin: const Offset(1.5, 0), end: Offset.zero);
            return SlideTransition(
              position: animation.drive(tween),
              child: child,
            );
          },
          transitionDuration: const Duration(milliseconds: 200),
        );
}
