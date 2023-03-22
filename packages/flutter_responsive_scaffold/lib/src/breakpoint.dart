import 'package:flutter/cupertino.dart';

class Breakpoint {
  final double? minWidth;
  final double? maxWidth;

  const Breakpoint({this.minWidth, this.maxWidth})
      : assert(
          !(minWidth != null && maxWidth != null),
          "At least minWidth or maxWidth must be given",
        );

  bool isActive(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double minWidth = this.minWidth ?? 0;
    double maxWidth = this.maxWidth ?? double.infinity;

    return screenWidth >= minWidth && screenWidth < maxWidth;
  }
}

class Breakpoints {
  static const Breakpoint compact = Breakpoint(maxWidth: 600);
  static Breakpoint medium = Breakpoint(minWidth: 600, maxWidth: 840);
  static const Breakpoint expanded = Breakpoint(minWidth: 840);
}
