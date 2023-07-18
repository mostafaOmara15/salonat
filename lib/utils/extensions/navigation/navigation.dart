import 'package:flutter/material.dart';

extension NavigationHelper on BuildContext {
  // void push(Widget page) {
  //   Navigator.of(this).push(
  //     MaterialPageRoute(builder: (context) => page),
  //   );
  // }
  void push(Widget page) {
    Navigator.of(this).push(
      FadePageRoute(builder: (context) => page),    );
  }

  void pushReplacement(Widget page) {
    Navigator.of(this).pushReplacement(
      MaterialPageRoute(builder: (context) => page),
    );
  }

  void pushAndRemoveUntil(Widget page) {
    Navigator.of(this).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => page),
      (route) => false,
    );
  }

  void pop() {
    Navigator.of(this).pop();
  }
}
//////////////////////////////
//////////////////////////////
/////// animation class///////
//////////////////////////////
//////////////////////////////

class FadePageRoute extends PageRouteBuilder {
  final WidgetBuilder builder;

  FadePageRoute({required this.builder})
      : super(
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              builder(context),
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) =>
              FadeTransition(
            opacity: animation,
            child: child,
          ),
        );
}

class SlidePageRoute extends PageRouteBuilder {
  final WidgetBuilder builder;

  SlidePageRoute({required this.builder})
      : super(
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              builder(context),
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) =>
              SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(1, 0),
              end: Offset.zero,
            ).animate(animation),
            child: child,
          ),
        );
}

class ScalePageRoute extends PageRouteBuilder {
  final WidgetBuilder builder;

  ScalePageRoute({required this.builder})
      : super(
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              builder(context),
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) =>
              ScaleTransition(
            scale: Tween<double>(
              begin: 0.0,
              end: 1.0,
            ).animate(animation),
            child: child,
          ),
        );
}
