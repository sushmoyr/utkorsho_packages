import 'package:flutter/material.dart';
import 'breakpoint.dart';

class ResponsiveLayout extends StatelessWidget {
  const ResponsiveLayout({Key? key, required this.config, this.weight = 1})
      : super(key: key);

  final Map<Breakpoint, WidgetBuilder> config;
  final int weight;

  @override
  Widget build(BuildContext context) {
    Widget findActiveLayout() {
      Widget? activeLayout;
      config.forEach((key, value) {
        if (key.isActive(context)) {
          activeLayout = value(context);
        }
      });
      return activeLayout ?? const SizedBox.shrink();
    }

    return findActiveLayout();
  }
}
//
// class Layout extends StatelessWidget {
//   const Layout({
//     Key? key,
//     this.weight = 1,
//     this.builder,
//   }) : super(key: key);
//
//   final WidgetBuilder? builder;
//   final int weight;
//
//   @override
//   Widget build(BuildContext context) {
//     return builder?.call(context) ?? const SizedBox.shrink();
//   }
// }
