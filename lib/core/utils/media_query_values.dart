import 'package:flutter/material.dart';

extension MediaQueryValues on BuildContext {
  Size get size => MediaQuery.of(this).size;

  double get height => MediaQuery.of(this).size.height;
  double get width => MediaQuery.of(this).size.width;
  double get topPadding => MediaQuery.of(this).viewPadding.top;
  double get bottomPadding => MediaQuery.of(this).viewPadding.bottom;
  bool get isDarkTheme =>
      MediaQuery.of(this).platformBrightness == Brightness.dark;
  bool get isPortrait =>
      MediaQuery.of(this).orientation == Orientation.portrait;

  ThemeData get theme => Theme.of(this);
  TextTheme get textTheme => Theme.of(this).textTheme;

  double get aspectRatio => size.aspectRatio;

  void navigateTo(String routeName, [Object? arguments]) {
    Navigator.of(this).pushNamed(routeName, arguments: arguments);
  }

  void navigateToWithReplacementNamed(String routeName) {
    Navigator.of(this).pushReplacementNamed(routeName);
  }

  void navigateToWithReplacement(Widget screen) {
    Navigator.of(this).pushReplacement(
      MaterialPageRoute(
        builder: (context) => screen,
      ),
    );
  }

  void navigateToWithReplacementAndClearStack(String routeName) {
    Navigator.of(this).pushNamedAndRemoveUntil(
      routeName,
      (route) => false,
    );
  }

  void navigateToWithClearStackAndArguments(
      String routeName, Object arguments) {
    Navigator.of(this).pushNamedAndRemoveUntil(
      routeName,
      (route) => false,
      arguments: arguments,
    );
  }

  void navigateToWithArguments(String routeName, Object arguments) {
    Navigator.of(this).pushNamed(
      routeName,
      arguments: arguments,
    );
  }

  void navigateToWithReplacementAndArguments(
      String routeName, Object arguments) {
    Navigator.of(this).pushReplacementNamed(
      routeName,
      arguments: arguments,
    );
  }

  void pop() {
    Navigator.of(this).pop();
  }

  void mayPop() {
    Navigator.of(this).maybePop();
  }
}
