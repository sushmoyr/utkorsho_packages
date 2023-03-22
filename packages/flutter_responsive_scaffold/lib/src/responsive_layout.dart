import 'package:flutter/material.dart';
import 'breakpoint.dart';

class ResponsiveLayout extends StatelessWidget {
  const ResponsiveLayout({Key? key, required this.config, this.weight = 1})
      : super(key: key);

  final Map<Breakpoint, Layout> config;
  final int weight;

  @override
  Widget build(BuildContext context) {
    Layout findActiveLayout() {
      Layout? activeLayout;
      config.forEach((key, value) {
        if (key.isActive(context)) {
          activeLayout = value;
        }
      });
      return activeLayout ?? const Layout();
    }

    final layout = findActiveLayout();

    return layout;
  }
}

class Layout extends StatelessWidget {
  const Layout({
    Key? key,
    this.weight = 1,
    this.builder,
  }) : super(key: key);

  final WidgetBuilder? builder;
  final int weight;

  @override
  Widget build(BuildContext context) {
    return builder?.call(context) ?? const SizedBox.shrink();
  }
}
