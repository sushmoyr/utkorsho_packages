import 'package:flutter/cupertino.dart';

class Breakpoint {
  final double? minWidth;
  final double? maxWidth;

  const Breakpoint({this.minWidth, this.maxWidth})
      : assert(minWidth != null || maxWidth != null,
            'At lease minWidth or maxWidth must be provided');

  bool isActive(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double minWidth = this.minWidth ?? 0;
    double maxWidth = this.maxWidth ?? double.infinity;

    return screenWidth >= minWidth && screenWidth < maxWidth;
  }

  bool isMinActive(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double minWidth = this.minWidth ?? 0;

    return screenWidth >= minWidth;
  }
}

class Breakpoints {
  static const Breakpoint compact = Breakpoint(maxWidth: 600);
  static const Breakpoint medium = Breakpoint(minWidth: 600, maxWidth: 840);
  static const Breakpoint expanded = Breakpoint(minWidth: 840);
  static const Breakpoint none =
      Breakpoint(minWidth: 0, maxWidth: double.infinity);
}
